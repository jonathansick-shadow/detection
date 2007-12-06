/*****************************************************************************/
/*
 * Handle Footprints
 */
#include <cassert>
#include <string>
#include <typeinfo>
#include <boost/format.hpp>
#include "lsst/mwi/utils/Trace.h"
#include "lsst/mwi/exceptions.h"
#include "lsst/detection/Peak.h"
#include "lsst/detection/Footprint.h"

using namespace lsst::detection;

/************************************************************************************************************/
/**
 * Return a string-representation of a Span
 */
std::string Span::toString() {
    return (boost::format("%d: %d..%d") % _y % _x0 % _x1).str();
}

/**
 * Compare two Spans by y, then x0, then x1
 */
int Span::compareByYX(const void **a, const void **b) {
    const Span *sa = *reinterpret_cast<const Span **>(a);
    const Span *sb = *reinterpret_cast<const Span **>(b);

    if (sa->_y < sb->_y) {
	return -1;
    } else if (sa->_y == sb->_y) {
	if (sa->_x0 < sb->_x0) {
	    return -1;
	} else if (sa->_x0 == sb->_x0) {
	    if (sa->_x1 < sb->_x1) {
		return -1;
	    } else if (sa->_x1 == sb->_x1) {
		return 0;
	    } else {
		return 1;
	    }
	} else {
	    return 1;
	}
    } else {
	return 1;
    }
}

/************************************************************************************************************/

int Footprint::id = 0;                  //!< Counter for Footprint IDs
/**
 * Create a Footprint
 */
Footprint::Footprint(int nspan,         //!< initial number of spans in this Footprint
                     const vw::BBox2i region) //!< Bounding box of MaskedImage footprint lives in
    : lsst::mwi::data::LsstBase(typeid(this)),
      _id(++id),
      _npix(0),
      _spans(*new std::vector<Span::PtrType>),
      _bbox(vw::BBox2i()),
      _peaks(*new std::vector<Peak::PtrType>),
      _region(region),
      _normalized(false) {
    if (nspan < 0) {
        throw lsst::mwi::exceptions::InvalidParameter(boost::format("Number of spans requested is -ve: %d") % nspan);
    }
    _npix = 0;
}

/**
 * Create a rectangular Footprint
 */
Footprint::Footprint(const vw::BBox2i& bbox, //!< The bounding box defining the rectangle
                     const vw::BBox2i region) //!< Bounding box of MaskedImage footprint lives in
    : lsst::mwi::data::LsstBase(typeid(this)),
      _id(++id),
      _npix(0),
      _spans(*new std::vector<Span::PtrType>),
      _bbox(vw::BBox2i()),
      _peaks(*new std::vector<Peak::PtrType>),
      _region(region),
      _normalized(false) {
    const int col0 = bbox.min().x();
    const int row0 = bbox.min().y();
    const int col1 = bbox.max().x() - 1; // This is the vw convention;
    const int row1 = bbox.max().y() - 1; //                            "max" means one-past-the-end

    for (int i = row0; i <= row1; i++) {
        addSpan(i, col0, col1);
    }
}

/**
 * Create a circular Footprint
 */
Footprint::Footprint(const BCircle2i& circle, //!< The center and radius of the circle
                     const vw::BBox2i region) //!< Bounding box of MaskedImage footprint lives in
    : lsst::mwi::data::LsstBase(typeid(this)),
      _id(++id),
      _npix(0),
      _spans(*new std::vector<Span::PtrType>),
      _bbox(vw::BBox2i()),
      _peaks(*new std::vector<Peak::PtrType>),
      _region(region),
      _normalized(false) {
    const int xc = circle.center().x(); // col-centre
    const int yc = circle.center().y(); // row-centre
    const int r2 = static_cast<int>(circle.radius()*circle.radius() + 0.5); // rounded radius^2
    const int r = static_cast<int>(std::sqrt(static_cast<double>(r2))); // truncated radius; r*r <= r2
   
    for(int i = -r; i <= r; i++) {
        int hlen = static_cast<int>(std::sqrt(static_cast<double>(r2 - i*i)));
        addSpan(yc + i, xc - hlen, xc + hlen);
    }
}

/**
 * Destroy a Footprint
 */
Footprint::~Footprint() {
    delete &_spans;
    delete &_peaks;
}

void Footprint::normalize() {
    if (!_normalized) {
	//_peaks = psArraySort(fp->peaks, pmPeakSortBySN);
	_normalized = true;
    }
}
/**
 * Add a span to a footprint, returning a reference the new span; note that this reference
 * does not own the span and should not be deleted
 */
const Span& Footprint::addSpan(const int y, //!< row to add
                               const int x0, //!< range of
                               const int x1) { //!<        columns
    if (x1 < x0) {
        return this->addSpan(y, x1, x0);
    }

    Span::PtrType sp(new Span(y, x0, x1));
    _spans.push_back(sp);
    
    _npix += x1 - x0 + 1;

    _bbox.grow(vw::Vector2i(x0, y));
    _bbox.grow(vw::Vector2i(x1 + 1, y + 1));

    return *sp.get();
}

/**
 * Tell this to calculate its bounding box
 */
void Footprint::setBBox() {
    if (_spans.size() == 0) {
	return;
    }

    std::vector<Span::PtrType>::const_iterator spi;
    spi = _spans.begin();
    const Span::PtrType sp = *spi;
    int x0 = sp->_x0;
    int x1 = sp->_x1;
    int y0 = sp->_y;
    int y1 = sp->_y;
    
    for (; spi != _spans.end(); spi++) {
        const Span::PtrType sp = *spi;
	if (sp->_x0 < x0) x0 = sp->_x0;
	if (sp->_x1 > x1) x1 = sp->_x1;
	if (sp->_y < y0) y0 = sp->_y;
	if (sp->_y > y1) y1 = sp->_y;
    }

    _bbox = vw::BBox2i(x0, y0, x1 - x0 + 1, y1 - y0 + 1); // must be "+ 1" as BBox EXCLUDES max in width/height
}

/**
 * Tell this to set its number of pixels
 */
int Footprint::setNpix() {
    _npix = 0;
    for (std::vector<Span::PtrType>::const_iterator spi = _spans.begin(); spi != _spans.end(); spi++) {
        const Span::PtrType sp = *spi;
        _npix += sp->_x1 - sp->_x0 + 1;
   }

   return _npix;
}
/**
 * Convert a Footprint to a rectangle, specified by bbox
 *
 * Throws an exception (TBD) if the Footprint already contains Spans
 *
 * \deprecated This method has been superceded by the ctor taking a BBox2i
 */
void Footprint::rectangle(const vw::BBox2i& bbox //!< The desired bounding box
                         ) {
    if (_spans.size() > 0) {
        throw lsst::mwi::exceptions::InvalidParameter(boost::format("Footprint already has %d spans") %
                                                      _spans.size());
    }

    std::cout << "Please use Footprint(BBox2i) not Footprint.rectangle()" << std::endl;

    const int col0 = bbox.min().x();
    const int row0 = bbox.min().y();
    const int col1 = bbox.max().x() - 1; // This is the vw convention;
    const int row1 = bbox.max().y() - 1; //                            "max" means one-past-the-end

    for (int i = row0; i <= row1; i++) {
        addSpan(i, col0, col1);
    }
}

/**
 * Set the pixels in idImage which are in this to the specified value
 */
void Footprint::insertIntoImage(lsst::fw::Image<boost::uint16_t>& idImage, //!< Image to contain the footprint
                                const int id) const { //!< Set image to this value
    const unsigned int ncols = _region.width();
    const unsigned int nrows = _region.height();
    const int col0 = _region.min().x();
    const int row0 = _region.min().y();

    if (ncols != idImage.getCols() || nrows != idImage.getRows()) {
        throw lsst::mwi::exceptions::InvalidParameter(boost::format("Image of size (%dx%d) doesn't match "
                                                       "Footprint's host Image of size (%dx%d)")
                                         % idImage.getCols() % idImage.getRows() % ncols % nrows);
    }

    typedef lsst::fw::Image<boost::uint16_t>::pixel_accessor pixAccessT;

    for (std::vector<Span::PtrType>::const_iterator spi = _spans.begin(); spi != _spans.end(); spi++) {
        const Span::PtrType span = *spi;

        pixAccessT spanPtr = idImage.origin().advance(span->getX0(), span->getY() - row0);
        for (int x = span->getX0() - col0; x <= span->getX1() - col0; x++, spanPtr.next_col()) {
            *spanPtr += id;
        }
    }
}

#if 0

/************************************************************************************************************/
/*
 * Worker routine for the pmSetFootprintArrayIDs/pmSetFootprintID (and pmMergeFootprintArrays)
 */
static void
set_footprint_id(psImage *idImage,	// the image to set
		 const pmFootprint *fp, // the footprint to insert
		 const int id) {	// the desired ID
   const int col0 = fp->region.x0;
   const int row0 = fp->region.y0;

   for (int j = 0; j < fp->spans->n; j++) {
       const pmSpan *span = fp->spans->data[j];
       psS32 *imgRow = idImage->data.S32[span->y - row0];
       for(int k = span->x0 - col0; k <= span->x1 - col0; k++) {
	   imgRow[k] += id;
       }
   }
}

static void
set_footprint_array_ids(psImage *idImage,
			const psArray *footprints, // the footprints to insert
			const bool relativeIDs) { // show IDs starting at 0, not pmFootprint->id
   int id = 0;				// first index will be 1
   for (int i = 0; i < footprints->n; i++) {
       const pmFootprint *fp = footprints->data[i];
       if (relativeIDs) {
	   id++;
       } else {
	   id = fp->id;
       }
       
       set_footprint_id(idImage, fp, id);
   }
}

/*
 * Set an image to the value of footprint's ID whever they may fall
 */
psImage *pmSetFootprintArrayIDs(const psArray *footprints, // the footprints to insert
				const bool relativeIDs) { // show IDs starting at 1, not pmFootprint->id
   assert (footprints != NULL);

   if (footprints->n == 0) {
       psError(PS_ERR_BAD_PARAMETER_SIZE, true, "You didn't provide any footprints");
       return NULL;
   }
   const pmFootprint *fp = footprints->data[0];
   assert(pmIsFootprint((const psPtr)fp));
   const int numCols = fp->region.x1 - fp->region.x0 + 1;
   const int numRows = fp->region.y1 - fp->region.y0 + 1;
   const int col0 = fp->region.x0;
   const int row0 = fp->region.y0;
   assert (numCols >= 0 && numRows >= 0);
   
   psImage *idImage = psImageAlloc(numCols, numRows, PS_TYPE_S32);
   P_PSIMAGE_SET_ROW0(idImage, row0);
   P_PSIMAGE_SET_COL0(idImage, col0);
   psImageInit(idImage, 0);
   /*
    * do the work
    */
   set_footprint_array_ids(idImage, footprints, relativeIDs);

   return idImage;
   
}

/*
 * Set an image to the value of footprint's ID whever they may fall
 */
psImage *pmSetFootprintID(const pmFootprint *fp, // the footprint to insert
			  const int id) {	// the desired ID
   assert(fp != NULL && pmIsFootprint((const psPtr)fp));
   const int numCols = fp->region.x1 - fp->region.x0 + 1;
   const int numRows = fp->region.y1 - fp->region.y0 + 1;
   const int col0 = fp->region.x0;
   const int row0 = fp->region.y0;
   assert (numCols >= 0 && numRows >= 0);
   
   psImage *idImage = psImageAlloc(numCols, numRows, PS_TYPE_S32);
   P_PSIMAGE_SET_ROW0(idImage, row0);
   P_PSIMAGE_SET_COL0(idImage, col0);
   psImageInit(idImage, 0);
   /*
    * do the work
    */
   set_footprint_id(idImage, fp, id);

   return idImage;
   
}

/************************************************************************************************************/
/*
 * Grow a psArray of pmFootprints isotropically by r pixels, returning a new psArray of new pmFootprints
 */
psArray *pmGrowFootprintArray(const psArray *footprints, // footprints to grow
			      int r) {	// how much to grow each footprint
    assert (footprints->n == 0 || pmIsFootprint(footprints->data[0]));

    if (footprints->n == 0) {		// we don't know the size of the footprint's region
	return psArrayAlloc(0);
    }
    /*
     * We'll insert the footprints into an image, then convolve with a disk,
     * then extract a footprint from the result --- this is magically what we want.
     */
    psImage *idImage = pmSetFootprintArrayIDs(footprints, true);
    if (r <= 0) {
	r = 1;				// r == 1 => no grow
    }
    psKernel *circle = psKernelAlloc(-r, r, -r, r);
    assert (circle->image->numRows == 2*r + 1 && circle->image->numCols == circle->image->numRows);
    for (int i = 0; i <= r; i++) {
	for (int j = 0; j <= r; j++) {
	    if (i*i + j*j <= r*r) {
		circle->kernel[i][j] = 
		    circle->kernel[i][-j] = 
		    circle->kernel[-i][j] = 
		    circle->kernel[-i][-j] = 1;
	    }
	}
    }

    psImage *grownIdImage = psImageConvolveDirect(idImage, circle); // Here's the actual grow step
    psFree(circle);	

    psArray *grown = pmFindFootprints(grownIdImage, 0.5, 1); // and here we rebuild the grown footprints
    assert (grown != NULL);
    psFree(idImage); psFree(grownIdImage);
    /*
     * Now assign the peaks appropriately.  We could do this more efficiently
     * using grownIdImage (which we just freed), but this is easy and probably fast enough
     */
    const psArray *peaks = pmFootprintArrayToPeaks(footprints);
    pmPeaksAssignToFootprints(grown, peaks);
    psFree((psArray *)peaks);

    return grown;
    
}

/************************************************************************************************************/
/*
 * Merge together two psArrays of pmFootprints neither of which is damaged.
 *
 * The returned psArray may contain elements of the inital psArrays (with
 * their reference counters suitable incremented)
 */
psArray *pmMergeFootprintArrays(const psArray *footprints1, // one set of footprints
				const psArray *footprints2, // the other set
				const int includePeaks) { // which peaks to set? 0x1 => footprints1, 0x2 => 2
    assert (footprints1->n == 0 || pmIsFootprint(footprints1->data[0]));
    assert (footprints2->n == 0 || pmIsFootprint(footprints2->data[0]));

    if (footprints1->n == 0 || footprints2->n == 0) {		// nothing to do but put copies on merged
	const psArray *old = (footprints1->n == 0) ? footprints2 : footprints1;

	psArray *merged = psArrayAllocEmpty(old->n);
	for (int i = 0; i < old->n; i++) {
	    psArrayAdd(merged, 1, old->data[i]);
	}
	
	return merged;
    }
    /*
     * We have real work to do as some pmFootprints in footprints2 may overlap
     * with footprints1
     */
    {
	pmFootprint *fp1 = footprints1->data[0];
	pmFootprint *fp2 = footprints2->data[0];
	if (fp1->region.x0 != fp2->region.x0 ||
	    fp1->region.x1 != fp2->region.x1 ||
	    fp1->region.y0 != fp2->region.y0 ||
	    fp1->region.y1 != fp2->region.y1) {
	    psError(PS_ERR_BAD_PARAMETER_SIZE, true,
		    "The two pmFootprint arrays correspnond to different-sized regions");
	    return NULL;
	}
    }
    /*
     * We'll insert first one set of footprints then the other into an image, then
     * extract a footprint from the result --- this is magically what we want.
     */
    psImage *idImage = pmSetFootprintArrayIDs(footprints1, true);
    set_footprint_array_ids(idImage, footprints2, true);

    psArray *merged = pmFindFootprints(idImage, 0.5, 1);
    assert (merged != NULL);
    psFree(idImage);
    /*
     * Now assign the peaks appropriately.  We could do this more efficiently
     * using idImage (which we just freed), but this is easy and probably fast enough
     */ 
    if (includePeaks & 0x1) {
	const psArray *peaks = pmFootprintArrayToPeaks(footprints1);
	pmPeaksAssignToFootprints(merged, peaks);
	psFree((psArray *)peaks);
    }

    if (includePeaks & 0x2) {
	const psArray *peaks = pmFootprintArrayToPeaks(footprints2);
	pmPeaksAssignToFootprints(merged, peaks);
	psFree((psArray *)peaks);
    }
    
    return merged;
}

/************************************************************************************************************/
/*
 * Given a psArray of pmFootprints and another of pmPeaks, assign the peaks to the
 * footprints in which that fall; if they _don't_ fall in a footprint, add a suitable
 * one to the list.
 */
psErrorCode
pmPeaksAssignToFootprints(psArray *footprints,	// the pmFootprints
			  const psArray *peaks) { // the pmPeaks
    assert (footprints != NULL);
    assert (footprints->n == 0 || pmIsFootprint(footprints->data[0]));
    assert (peaks != NULL);
    assert (peaks->n == 0 || pmIsPeak(peaks->data[0]));
    
    if (footprints->n == 0) {
	if (peaks->n > 0) {
	    return psError(PS_ERR_BAD_PARAMETER_SIZE, true, "Your list of footprints is empty");
	}
	return PS_ERR_NONE;
    }
    /*
     * Create an image filled with the object IDs, and use it to assign pmPeaks to the
     * objects
     */
    psImage *ids = pmSetFootprintArrayIDs(footprints, true);
    assert (ids != NULL);
    assert (ids->type.type == PS_TYPE_S32);
    const int row0 = ids->row0;
    const int col0 = ids->col0;
    const int numRows = ids->numRows;
    const int numCols = ids->numCols;

    for (int i = 0; i < peaks->n; i++) {
	pmPeak *peak = peaks->data[i];
	const int x = peak->x - col0;
	const int y = peak->y - row0;
	
	assert (x >= 0 && x < numCols && y >= 0 && y < numRows);
	int id = ids->data.S32[y][x - col0];

	if (id == 0) {			// peak isn't in a footprint, so make one for it
	    pmFootprint *nfp = pmFootprintAlloc(1, ids);
	    pmFootprintAddSpan(nfp, y, x, x);
	    psArrayAdd(footprints, 1, nfp);
	    psFree(nfp);
	    id = footprints->n;
	}

	assert (id >= 1 && id <= footprints->n);
	pmFootprint *fp = footprints->data[id - 1];
	psArrayAdd(fp->peaks, 5, peak);
    }
    
    psFree(ids);
    //
    // Make sure that peaks within each footprint are sorted and unique
    //
    for (int i = 0; i < footprints->n; i++) {
	pmFootprint *fp = footprints->data[i];
        fp->peaks = psArraySort(fp->peaks, pmPeakSortBySN);

	for (int j = 1; j < fp->peaks->n; j++) { // check for duplicates
	    if (fp->peaks->data[j] == fp->peaks->data[j-1]) {
		(void)psArrayRemoveIndex(fp->peaks, j);
		j--;			// we moved everything down one
	    }
	}
    }

    return PS_ERR_NONE;
}

/************************************************************************************************************/
 /*
  * Examine the peaks in a pmFootprint, and throw away the ones that are not sufficiently
  * isolated.  More precisely, for each peak find the highest coll that you'd have to traverse
  * to reach a still higher peak --- and if that coll's more than nsigma DN below your
  * starting point, discard the peak.
  */
psErrorCode pmFootprintCullPeaks(const psImage *img, // the image wherein lives the footprint
				 const psImage *weight,	// corresponding variance image
				 pmFootprint *fp, // Footprint containing mortal peaks
				 const float nsigma_delta, // how many sigma above local background a peak
				 	// needs to be to survive
				 const float min_threshold) { // minimum permitted coll height
    assert (img != NULL); assert (img->type.type == PS_TYPE_F32);
    assert (weight != NULL); assert (weight->type.type == PS_TYPE_F32);
    assert (img->row0 == weight->row0 && img->col0 == weight->col0);
    assert (fp != NULL);

    if (fp->peaks == NULL || fp->peaks->n == 0) { // nothing to do
	return PS_ERR_NONE;
    }

    psRegion subRegion;			// desired subregion; 1 larger than bounding box (grr)
    subRegion.x0 = fp->bbox.x0; subRegion.x1 = fp->bbox.x1 + 1;
    subRegion.y0 = fp->bbox.y0; subRegion.y1 = fp->bbox.y1 + 1;
    const psImage *subImg = psImageSubset((psImage *)img, subRegion);
    const psImage *subWt = psImageSubset((psImage *)weight, subRegion);
    assert (subImg != NULL && subWt != NULL);
    //
    // We need a psArray of peaks brighter than the current peak.  We'll fake this
    // by reusing the fp->peaks but lying about n.
    //
    // We do this for efficiency (otherwise I'd need two peaks lists), and we are
    // rather too chummy with psArray in consequence.  But it works.
    //
    psArray *brightPeaks = psArrayAlloc(0);
    psFree(brightPeaks->data);
    brightPeaks->data = psMemIncrRefCounter(fp->peaks->data);// use the data from fp->peaks
    //
    // The brightest peak is always safe; go through other peaks trying to cull them
    //
    for (int i = 1; i < fp->peaks->n; i++) { // n.b. fp->peaks->n can change within the loop
	const pmPeak *peak = fp->peaks->data[i];
	int x = peak->x - subImg->col0;
	int y = peak->y - subImg->row0;
	//
	// Find the level nsigma below the peak that must separate the peak
	// from any of its friends
	//
	assert (x >= 0 && x < subImg->numCols && y >= 0 && y < subImg->numRows);
	const float stdev = std::sqrt(subWt->data.F32[y][x]);
	float threshold = subImg->data.F32[y][x] - nsigma_delta*stdev;
	if (isnan(threshold) || threshold < min_threshold) {
#if 1					// min_threshold is assumed to be below the detection threshold,
					// so all the peaks are pmFootprint, and this isn't the brightest
	    (void)psArrayRemoveIndex(fp->peaks, i);
	    i--;			// we moved everything down one
	    continue;
#else
#error n.b. We will be running LOTS of checks at this threshold, so only find the footprint once
	    threshold = min_threshold;
#endif
	}
	if (threshold > subImg->data.F32[y][x]) {
	    threshold = subImg->data.F32[y][x] - 10*FLT_EPSILON;
	}

	const int peak_id = 1;		// the ID for the peak of interest
	brightPeaks->n = i;		// only stop at a peak brighter than we are
	pmFootprint *peakFootprint = pmFindFootprintAtPoint(subImg, threshold, brightPeaks, peak->y, peak->x);
	brightPeaks->n = 0;		// don't double free
	psImage *idImg = pmSetFootprintID(peakFootprint, peak_id);
	psFree(peakFootprint);

	int j;
	for (j = 0; j < i; j++) {
	    const pmPeak *peak2 = fp->peaks->data[j];
	    int x2 = peak2->x - subImg->col0;
	    int y2 = peak2->y - subImg->row0;
	    const int peak2_id = idImg->data.S32[y2][x2]; // the ID for some other peak

	    if (peak2_id == peak_id) {	// There's a brighter peak within the footprint above
		;			// threshold; so cull our initial peak
		(void)psArrayRemoveIndex(fp->peaks, i);
		i--;			// we moved everything down one
		break;
	    }
	}
	if (j == i) {
	    j++;
	}

	psFree(idImg);
    }

    brightPeaks->n = 0; psFree(brightPeaks);
    psFree((psImage *)subImg);
    psFree((psImage *)subWt);

    return PS_ERR_NONE;
}

/*
 * Cull an entire psArray of pmFootprints
 */
psErrorCode
pmFootprintArrayCullPeaks(const psImage *img, // the image wherein lives the footprint
			  const psImage *weight,	// corresponding variance image
			  psArray *footprints, // array of pmFootprints
			  const float nsigma_delta, // how many sigma above local background a peak
    					// needs to be to survive
			  const float min_threshold) { // minimum permitted coll height
    for (int i = 0; i < footprints->n; i++) {
	pmFootprint *fp = footprints->data[i];
	if (pmFootprintCullPeaks(img, weight, fp, nsigma_delta, min_threshold) != PS_ERR_NONE) {
	    return psError(PS_ERR_UNKNOWN, false, "Culling pmFootprint %d", fp->id);
	}
    }
    
    return PS_ERR_NONE;
}

/************************************************************************************************************/
/*
 * Extract the peaks in a psArray of pmFootprints, returning a psArray of pmPeaks
 */
psArray *pmFootprintArrayToPeaks(const psArray *footprints) {
   assert(footprints != NULL);
   assert(footprints->n == 0 || pmIsFootprint(footprints->data[0]));

   int npeak = 0;
   for (int i = 0; i < footprints->n; i++) {
      const pmFootprint *fp = footprints->data[i];
      npeak += fp->peaks->n;
   }

   psArray *peaks = psArrayAllocEmpty(npeak);
   
   for (int i = 0; i < footprints->n; i++) {
      const pmFootprint *fp = footprints->data[i];
      for (int j = 0; j < fp->peaks->n; j++) {
	 psArrayAdd(peaks, 1, fp->peaks->data[j]);
      }
   }

   return peaks;
}
#endif
