// -*- LSST-C++ -*-
/**
 * \file
 *
 * \brief Detect cosmic rays in a MaskedImage
 *
 * \ingroup detection
 */
#include <stdexcept>
#include <algorithm>
#include <cassert>
#include <string>
#include <typeinfo>
#include <boost/format.hpp>

#include <lsst/mwi/utils/Trace.h>
#include <lsst/mwi/exceptions.h>
#include <lsst/fw/MaskedImage.h>
#include <lsst/fw/PixelAccessors.h>
#include "lsst/detection/CR.h"
#include "lsst/detection/Interp.h"

namespace lsst { namespace fw { namespace math {
    double gaussdev() { return 1; }
}}}

using namespace lsst::fw;
using namespace lsst::detection;

/************************************************************************************************************/
//
// A class to hold a detected pixel
template<typename ImageT>
struct CRPixel {
    typedef typename boost::shared_ptr<CRPixel> PtrT;

    CRPixel(int _col, int _row, int _val, int _id = -1) :
        id(_id), col(_col), row(_row), val(_val) {
        _i = ++i;
    }
    ~CRPixel() {}

    bool operator< (const CRPixel& a) const {
        return _i < a._i;
    }

    int id;                             // Unique ID for cosmic ray (not cosmic ray pixel)
    int col;                            // position
    int row;                            //    of pixel
    ImageT val;                         // initial value of pixel
private:
    static int i;                       // current value of running index
    int mutable _i;                     // running index 
};

template<typename ImageT>
int CRPixel<ImageT>::i = 0;

template<typename ImageT>
struct Sort_CRPixel_by_id {
    bool operator() (CRPixel<ImageT> const & a, CRPixel<ImageT> const & b) const {
        return a.id < b.id;
    }
};

/*****************************************************************************/
/*
 * This is the code to see if a given pixel is bad
 *
 * Note that the pixel in question is at index 0, so its value is pt_0[0]
 */
template <typename ImageT, typename MaskT>
static bool
is_cr_pixel(ImageT *corr,               // corrected value
            MaskedPixelAccessor<ImageT, MaskT> const mi_row_m, // previous row
            lsst::fw::MaskedPixelAccessor<ImageT, MaskT> const mi_row_0, // this row
            lsst::fw::MaskedPixelAccessor<ImageT, MaskT> const mi_row_p, // next row
	    int const min_sigma,	// min_sigma, or -threshold if negative
	    float const thres_h, float const thres_v, float const thres_d, // for condition #3
	    float const bkgd,           // unsubtracted background level
	    float const e_per_dn,		// gain of amplifier, e^-/DN
	    float const cond3_fac		// fiddle factor for condition #3
           ) {
    //
    // Unpack pointers to rows (mnemonic: _m, minus one; _p, plus one)
    //
    ImageT const *img_m  = &(*mi_row_m.image); ImageT const *var_m = &(*mi_row_m.variance);
    ImageT const *img_0  = &(*mi_row_0.image); ImageT const *var_0 = &(*mi_row_0.variance);
    ImageT const *img_p  = &(*mi_row_p.image); ImageT const *var_p = &(*mi_row_p.variance);
    //
    // Unpack some values
    //
    ImageT const v_00 = img_0[0];

    if (v_00 < 0) {
        return false;
    }
    /*
     * condition #1 is not applied on a pixel-by-pixel basis
     */
    ;
    /*
     * condition #2
     */
    ImageT const mean_we =   (img_0[-1] + img_0[1])/2; // averages of surrounding 8 pixels
    ImageT const mean_ns =   (img_m[0]  + img_p[0])/2;
    ImageT const mean_swne = (img_m[-1] + img_p[1])/2;
    ImageT const mean_nwse = (img_m[1]  + img_p[-1])/2;

    if(min_sigma < 0) {		/* |thres_sky_sigma| is threshold */
        if(v_00 < -min_sigma) {
            return false;
        }
    } else {
        double const thres_sky_sigma = min_sigma*sqrt(var_0[0]);

        if(v_00 < mean_ns   + thres_sky_sigma &&
           v_00 < mean_we   + thres_sky_sigma &&
           v_00 < mean_swne + thres_sky_sigma &&
           v_00 < mean_nwse + thres_sky_sigma) {
            return false;
        }
    }
/*
 * condition #3
 *
 * Note that this uses mean_ns etc. even if min_sigma is negative
 */
    ImageT const dv_00 =      sqrt(var_0[0]);
    ImageT const dmean_we =   sqrt(var_0[-1] + var_0[1])/2; // s.d. of averages of surrounding 8 pixels
    ImageT const dmean_ns =   sqrt(var_m[0]  + var_p[0])/2;
    ImageT const dmean_swne = sqrt(var_m[-1] + var_p[1])/2;
    ImageT const dmean_nwse = sqrt(var_m[1]  + var_p[-1])/2;

    if(!condition_3(corr,
                    v_00 - bkgd, mean_ns - bkgd, mean_we - bkgd, mean_swne - bkgd, mean_nwse - bkgd,
                    dv_00,      dmean_ns,       dmean_we,       dmean_swne,       dmean_nwse,
                    thres_h, thres_v, thres_d, e_per_dn, cond3_fac)){
        return false;
    }
/*
 * OK, it's a contaminated pixel
 */
    *corr += bkgd;
    
    return true;
}

/************************************************************************************************************/
//
// Worker routine to process the pixels adjacent to a span
//
// Return the number of pixels added to the CR
//
template <typename ImageT, typename MaskT>
static void checkSpanForCRs(Footprint *extras,
                            std::vector<CRPixel<ImageT> >& crpixels,
                            int const row0,   // row to process
                            int const x0, int const x1, // range of pixels in the span (inclusive)
                            MaskedImage<ImageT, MaskT> &image, ///< Image to search
                            int const min_sigma, // min_sigma
                            float const thres_h, float const thres_v, float const thres_d, // for condition #3
                            float const bkgd, // unsubtracted background level
                            float const e_per_dn, // gain of amplifier, e^-/DN
                            float const cond3_fac, // fiddle factor for condition #3
                            bool const keep ///< if true, don't remove the CRs
                           ) {
    typedef typename lsst::fw::MaskedPixelAccessor<ImageT, MaskT> MIAccessorT;

    int const i0 = x0 - 1;
    
    MIAccessorT pt_m(image);
    pt_m.advance(i0, row0 - 1);
    MIAccessorT pt_0(image);
    pt_0.advance(i0, row0);
    MIAccessorT pt_p(image);
    pt_p.advance(i0, row0 + 1);

    for (int i = i0; i <= x1 + 1; ++i, pt_m.nextCol(), pt_0.nextCol(), pt_p.nextCol()) {
        ImageT corr = 0;                // new value for pixel
        if(is_cr_pixel(&corr, pt_m, pt_0, pt_p,
                       min_sigma, thres_h, thres_v, thres_d, bkgd, e_per_dn, cond3_fac)) {
            if(keep) {
                crpixels.push_back(CRPixel<ImageT>(i, row0, *pt_0.image));
            }
            *pt_0.image = corr;
            
            extras->addSpan(row0, i, i);
        }
    }
}

/************************************************************************************************************/
/*!
 * \brief Find cosmic rays in an Image, and mask and remove them
 *
 * \return vector of CR's Footprints
 */
template <typename ImageT, typename MaskT>
std::vector<Footprint::PtrType>
lsst::detection::findCosmicRays(MaskedImage<ImageT, MaskT> &image, ///< Image to search
                                PSF const &psf,          ///< the Image's PSF
                                float const bkgd,        ///< unsubtracted background of frame, DN
                                lsst::mwi::policy::Policy const &policy, ///< Policy directing the behavior               
                                bool const keep          ///< if true, don't remove the CRs
                               ) {
    typedef typename lsst::fw::MaskedPixelAccessor<ImageT, MaskT> MIAccessorT;

    // Parse the Policy
    const double e_per_dn = policy.getDouble("CR.e_per_dn");    // gain of amplifier, e^-/DN
    const double min_sigma = policy.getDouble("CR.min_sigma");   ///< min sigma above sky in pixel for CR candidates
    const int min_e = policy.getDouble("CR.min_e");         ///< min number of e^- in an CRs
    const double cond3_fac = policy.getDouble("CR.cond3_fac");   ///< fiddle factor for condition #3
    const double cond3_fac2 = policy.getDouble("CR.cond3_fac2");  ///< 2nd fiddle factor for condition #3
    const int niteration = policy.getInt("CR.niteration");  ///< Number of times to look for contaminated pixels near CRs

    assert(e_per_dn > 0.0);
/*
 * thresholds for 3rd condition
 */
    double const thres_h = cond3_fac2*psf.getValue(0, 1); // horizontal
    double const thres_v = cond3_fac2*psf.getValue(1, 0); // vertical
    double const thres_d = cond3_fac2*psf.getValue(1, 1); // diagonal
/*
 * Setup desired mask planes
 */
    MaskT const badBit = image.getMask()->getPlaneBitMask("BAD"); // Generic bad pixels
    MaskT const crBit = image.getMask()->getPlaneBitMask("CR"); // CR-contaminated pixels
    MaskT const interpBit = image.getMask()->getPlaneBitMask("INTRP"); // Interpolated pixels
    MaskT const saturBit = image.getMask()->getPlaneBitMask("SAT"); // Saturated pixels

    MaskT const badMask = (badBit | interpBit | saturBit); // naughty pixels
/*
 * Go through the frame looking at each pixel (except the edge ones which we ignore)
 */
    int const ncol = static_cast<int>(image.getCols());
    int const nrow = static_cast<int>(image.getRows());

    std::vector<CRPixel<ImageT> > crpixels; // storage for detected CR-contaminated pixels
    typedef typename std::vector<CRPixel<ImageT> >::iterator crpixel_iter;
    typedef typename std::vector<CRPixel<ImageT> >::reverse_iterator crpixel_riter;
    
    for (int j = 1; j < nrow - 1; ++j) {
        MIAccessorT pt_m(image);
        pt_m.advance(1, j - 1);         // previous row
        MIAccessorT pt_0(image);
        pt_0.advance(1, j);             // this row
        MIAccessorT pt_p(image);
        pt_p.advance(1, j + 1);         // next row

        for(int i = 1; i < ncol - 1; ++i, pt_m.nextCol(), pt_0.nextCol(), pt_p.nextCol()) {
            ImageT corr = 0;
            if(!is_cr_pixel(&corr, pt_m, pt_0, pt_p,
                            min_sigma, thres_h, thres_v, thres_d, bkgd, e_per_dn, cond3_fac)) {
                continue;
            }            
/*
 * condition #4
 */
            if(*pt_0.mask & badMask) {
                continue;
            }
/*
 * OK, it's a CR
 *
 * replace CR-contaminated pixels with reasonable values as we go through
 * image, which increases the detection rate
 */
            crpixels.push_back(CRPixel<ImageT>(i, j, *pt_0.image));
            *pt_0.image = corr;		/* just a preliminary estimate */
        }
    }
/*
 * We've found them on a pixel-by-pixel basis, now merge those pixels
 * into cosmic rays
 */
    int ncr = 0;                        // number of detected cosmic rays
    if(crpixels.size()> 0) {
        int id;				// id number for a CR
      
        crpixels.push_back(CRPixel<ImageT>(0, -1, 0, -1)); // i.e. row is an impossible value, ID's out of range
        for (crpixel_iter crp = crpixels.begin(); crp < crpixels.end() - 1 ; ++crp) {
            if(crp->id < 0) {		// not already assigned
                crp->id = ++ncr;        // a new CR
            }
            id = crp->id;

            if(crp[1].row == crp[0].row && crp[1].col == crp[0].col + 1) {
                crp[1].id = id;
            }
/*
 * look for connected pixels in the next row; we have to skip those in
 * this row first
 */
            crpixel_iter crp2 = crp;
            for(; crp2->row == crp->row; ++crp2) continue; // skip pixels in this row

            for(; crp2->row == crp->row + 1; ++crp2) {
                if(crp2->col >= crp->col - 1) {
                    if(crp2->col > crp->col + 1) {
                        break;
                    }
                    crp2->id = id;	 
                }
            }
        }
    }
/*
 * assemble those pixels, now identified with ID numbers, into OBJMASKs
 */
    {
        Sort_CRPixel_by_id<ImageT> sort_by_id;
        sort(crpixels.begin(), crpixels.end() - 1, sort_by_id); // sort by ID; ignore the dummy
    }

    std::vector<Footprint::PtrType> CRs; // our cosmic rays
    
    crpixel_iter crp = crpixels.begin();
    for(int i = 1; i <= ncr; ++i) {
        ImageT max = -1;                // maximum pixel in CR
        double sum = 0;			// total number of electrons in CR

        Footprint::PtrType cr(new Footprint);
        crpixel_iter const crp0 = crp;  // starting element for this CR
        for (; ; ++crp) {
            if(crp->val < 0) {
                crp->val = 0;
            }
	 
            if(crp->id != i) {
                break;
            }

            int r = crp->row;
            int col0 = crp->col;
            
            for (int prev_col = col0 - 1;
                 crp->id == i && crp->row == r && crp->col == prev_col + 1; ++crp, ++prev_col) {
                sum += crp->val - bkgd;
                if(crp->val > max) {
                    max = crp->val;
                }
            }
            
            crp--;                      // revisit this element
            cr->addSpan(crp->row, col0, crp->col);
        }
        assert (max >= 0);
        max -= bkgd;
/*
 * apply condition #1
 */
        if(max < min_e/e_per_dn) {	/* not bright enough */
            for (crpixel_iter crp = crp0; crp->id == i; crp++) {
                image.getImage()->getIVw()(crp->col, crp->row) = crp->val;
            }
        } else {
            cr->setBBox();
            CRs.push_back(cr);
        }
    }
    ncr = CRs.size();		/* some may have been too faint */
/*
 * We've found them all, time to kill them all
 */
    bool const debias_values = true;
    bool grow = false;
    removeCR(image, CRs, bkgd, crBit, saturBit, badMask, debias_values, grow);
#if 0                                   // Useful to see phase 2 in ds9; debugging only
    (void)setMaskFromFootprintList(image.getMask(), CRs, image.getMask()->getPlaneBitMask("DETECTED"));
#endif
/*
 * Now that we've removed them, go through image again, examining area around
 * each CR for extra bad pixels. Note that we set cond3_fac = 0 for this pass
 *
 * We iterate niteration times;  niter==1 was sufficient for SDSS data, but megacam
 * CCDs are different -- who knows for other devices?
 */
    int nextra = 0;                     // number of pixels added to list of CRs
    for (int i = 0; i != niteration; ++i) {
        TTrace<1>("detection.CR", "Starting iteration %d", i);
        for (std::vector<Footprint::PtrType>::iterator fiter = CRs.begin(); fiter != CRs.end(); fiter++) {
            Footprint::PtrType cr = *fiter;
/*
 * Are all those `CR' pixels interpolated?  If so, don't grow it
 */
            {
                Footprint::PtrType om = footprintAndMask(cr, image.getMask(), interpBit);
                int const npix = (om == NULL) ? 0 : om->getNpix();

                if (npix == cr->getNpix()) {
                    continue;
                }
            }
/*
 * No; some of the suspect pixels aren't interpolated
 */
            Footprint extra;                     // extra pixels added to cr
            for (Footprint::const_span_iterator siter = cr->getSpans().begin();
                 siter != cr->getSpans().end(); siter++) {
                Span::PtrType const span = *siter;

                /*
                 * Check the lines above and below the span
                 */
                int const y = span->getY();
                if (y < 1 || y >= nrow - 1) {
                    continue;
                }
                int x0 = span->getX0(); int x1 = span->getX1();
                x0 = (x0 < 1) ? 1 : (x0 >= ncol - 1) ? ncol - 2 : x0;
                x1 = (x1 < 1) ? 1 : (x1 >= ncol - 1) ? ncol - 2 : x1;

                checkSpanForCRs(&extra, crpixels, y - 1, x0, x1, image,
                                min_sigma/2, thres_h, thres_v, thres_d, bkgd, e_per_dn, 0, keep);
                checkSpanForCRs(&extra, crpixels, y,     x0, x1, image,
                                min_sigma/2, thres_h, thres_v, thres_d, bkgd, e_per_dn, 0, keep);
                checkSpanForCRs(&extra, crpixels, y + 1, x0, x1, image,
                                min_sigma/2, thres_h, thres_v, thres_d, bkgd, e_per_dn, 0, keep);
            }

            if(extra.getSpans().size() > 0) {      // we added some pixels
                nextra += extra.getNpix();

                Footprint::SpanListT &espans = extra.getSpans();
                for (Footprint::const_span_iterator siter = espans.begin(); siter != espans.end(); siter++) {
                    cr->addSpan(**siter);
                }
            
                cr->normalize();            // XXX Not yet functional
            } else {
                cr->setBBox();
            }
        }

        if (nextra == 0) {
            break;
        }
    }
/*
 * mark those pixels as CRs
 */
    (void)setMaskFromFootprintList(image.getMask(), CRs, crBit);
/*
 * Reinstate initial values; n.b. the same pixel may appear twice, so we want the
 * first value stored (hence the uses of rbegin/rend)
 *
 * We have to do this as we may decide _not_ to remove certain CRs,
 * for example those which lie next to saturated pixels
 */
    sort(crpixels.begin(), crpixels.end() - 1); // sort into birth order; ignore the dummy
    for (crpixel_riter crp = crpixels.rbegin() + 1, rend = crpixels.rend(); crp != rend; ++crp) {
        MIAccessorT ptr(image);
        ptr.advance(crp->col, crp->row);
        *ptr.image = crp->val;
    }

    if(!keep) {
        if(nextra > 0) {
            grow = true;
            removeCR(image, CRs, bkgd, crBit, saturBit, badMask, debias_values, grow);
        }
/*
 * we interpolated over all CR pixels, so set the interp bits too
 */
        (void)setMaskFromFootprintList(image.getMask(), CRs, crBit);
    }

    return CRs;
}

/*****************************************************************************/
/*
 * Is condition 3 true?
 */
template<typename ImageT>
static bool condition_3(ImageT *estimate, // estimate of true value of pixel
                        ImageT const peak, // counts in central pixel (no sky)
                        ImageT const mean_ns,   // mean in NS direction (no sky)
                        ImageT const mean_we,   //  "   "  WE    "  "     "   "
                        ImageT const mean_swne, //  "   "  SW-NE "  "     "   "
                        ImageT const mean_nwse, //  "   "  NW-SE "  "     "   "
                        ImageT const dpeak, // standard deviation of peak value
                        ImageT const dmean_ns, //   s.d. of mean in NS direction
                        ImageT const dmean_we, //    "   "   "   "  WE    "  "
                        ImageT const dmean_swne, //  "   "   "   "  SW-NE "  "
                        ImageT const dmean_nwse, //  "   "   "   "  NW-SE "  "
                        double const thres_h, // horizontal threshold
                        double const thres_v, // vertical threshold
                        double const thres_d, // diagonal threshold
                        double const e_per_dn, // gain, e^_/DN
                        double const cond3_fac) { // fiddle factor for noise
   if(thres_v*(peak - cond3_fac*dpeak) > mean_ns + cond3_fac*dmean_ns) {
      *estimate = mean_ns;
      return true;
   }

   if(thres_h*(peak - cond3_fac*dpeak) > mean_we + cond3_fac*dmean_we) {
      *estimate = mean_we;
      return true;
   }

   if(thres_d*(peak - cond3_fac*dpeak) > mean_swne + cond3_fac*dmean_swne) {
      *estimate = mean_swne;
      return true;
   }

   if(thres_d*(peak - cond3_fac*dpeak) > mean_nwse + cond3_fac*dmean_nwse) {
      *estimate = mean_nwse;
      return true;
   }

   return false;
}

/************************************************************************************************************/
/*
 * Does any pixel in a bounding mask have any bits in bitMask set?
 *
 * Note that I don't use MaskPixelBooleanFunc<MaskT> as this would require me to build
 * a submask, and this seems too heavy weight
 *
 * N.b. gcc 4.0 can't find this template if the first argument is defined as
 *   typename Mask<MaskT>::MaskPtrT const & mask
 */
template <typename MaskT>
static MaskT is_contaminated(boost::shared_ptr<Mask<MaskT> > const & mask,
                             MaskT const bitmask,
                             vw::BBox2i const & bbox
                            ) {
    int const x0 = bbox.min().x();
    int const x1 = bbox.max().x();
    int const y0 = bbox.min().y();
    int const y1 = bbox.max().y();

    typedef typename Mask<MaskT>::pixel_accessor MaskAccessorT;
    MaskAccessorT rows = mask->origin();
    rows.advance(x0, y0);
    
    for (int y = y0; y != y1; ++y, rows.next_row()) {
        MaskAccessorT row = rows;
        for (int x = x0; x != x1; ++x, row.next_col()) {
            if (*row & bitmask) {
                return *row;
            }
        }
    }

    return 0;
}

/************************************************************************************************************/
/*
 * actually remove CRs from the frame
 */
template<typename ImageT, typename MaskT>
static void removeCR(MaskedImage<ImageT, MaskT> & mi,  // image to search
                     std::vector<Footprint::PtrType> & CRs, // list of cosmic rays
                     float const bkgd, // non-subtracted background
                     MaskT const crBit, // Bit value used to label CRs
                     MaskT const saturBit, // Bit value used to label saturated pixels
                     MaskT const badMask, // Bit mask for bad pixels
                     bool const debias, // statistically debias values?
                     bool const grow)   // Grow CRs?
{
#if 0
    OBJMASK *cr;				/* a CR's mask */
    CHAIN *satur_crChain = NULL;		/* CRs that touch saturated pixels */
    int row, col;			/* row and column counters */
    int col1, col2;			/* range of columns in a span */
    int i, j;
    int min = 0;				/* minimum of estimates for replacement
                                                   value of a pixel under a CR */
    float minval = bkgd - 2*skysig + SOFT_BIAS; /* minimum acceptable pixel
                                                   value after interp. XXX */
    int nrow, ncol;			/* reg->nrow, reg->ncol */
    int ngood = 0;				/* number of good values on min */
    PIX **rrows;				/* == reg->ROWS */
    int tmp;
    SPANMASK *sm;			/* The region's masks */
#endif
    typedef typename lsst::fw::MaskedPixelAccessor<ImageT, MaskT> MIAccessorT;

    int const ncol = static_cast<int>(mi.getCols()); // cast away "unsigned"
    int const nrow = static_cast<int>(mi.getRows());
    /*
     * replace the values of cosmic-ray contaminated pixels with 1-dim 2nd-order weighted means Cosmic-ray
     * contaminated pixels have already been given a mask value, crBit
     *
     * If there are no good options (i.e. all estimates are contaminated), try using just pixels that are not
     * CRs; failing that, interpolate in the row- or column direction over as large a distance as is required
     *
     * XXX SDSS (and we) go through this list backwards; why?
     */
    for (std::vector<Footprint::PtrType>::reverse_iterator fiter = CRs.rbegin();
         fiter != CRs.rend(); ++fiter) {
        Footprint::PtrType cr = *fiter;
/*
 * If I grow this CR does it touch saturated pixels?  If so, don't
 * interpolate and add CR pixels to saturated mask
 */
        if(grow && cr->getNpix() < 100) {
            Footprint::PtrType gcr = growFootprint(cr, 1);
            Footprint::PtrType const saturPixels = footprintAndMask(gcr, mi.getMask(), saturBit);

            if (saturPixels->getNpix() > 0) { // pixel is adjacent to a saturation trail
                setMaskFromFootprint(mi.getMask(), saturPixels, saturBit);

                continue;
            }
        }
/*
 * OK, fix it
 */
        for (Footprint::const_span_iterator siter = cr->getSpans().begin();
             siter != cr->getSpans().end(); siter++) {
            Span::PtrType const span = *siter;
          
            int const y = span->getY();

            MIAccessorT row(mi);
            row.advance(span->getX0(), y);
            
            for (int x = span->getX0(), x1 = span->getX1(); x <= x1; ++x, row.nextCol()) {
                ImageT min = std::numeric_limits<ImageT>::max();
                int ngood = 0;          // number of good values on min

                ImageT const minval = bkgd - 2*sqrt(*row.variance); // min. acceptable pixel value after interp
/*
 * W-E row
 */
                if (x - 2 >= 0 && x + 2 < ncol) {
                    if (is_contaminated(mi.getMask(), badMask, vw::BBox2i(x - 2, y, 2, 1)) ||
                        is_contaminated(mi.getMask(), badMask, vw::BBox2i(x + 1, y, 2, 1))) {
                        ;			// estimate is contaminated
                    } else {
                        MIAccessorT ptr(mi);
                        ptr.advance(x - 2, y);
                        ImageT const v_m2 = *ptr.image; ptr.nextCol();
                        ImageT const v_m1 = *ptr.image; ptr.nextCol();
                        ptr.nextCol();
                        ImageT const v_p1 = *ptr.image; ptr.nextCol();
                        ImageT const v_p2 = *ptr.image;

                        ImageT const tmp = (interp::lpc_1_c1*(v_m1 + v_p1) + interp::lpc_1_c2*(v_m2 + v_p2));
                        if(tmp > minval && tmp < min) {
                            min = tmp;
                            ngood++;
                        }
                    }
                }
/*
 * N-S column
 */
                if (y - 2 >= 0 && y + 2 < nrow) {
                    if (is_contaminated(mi.getMask(), badMask, vw::BBox2i(x, y - 2, 2, 1)) ||
                        is_contaminated(mi.getMask(), badMask, vw::BBox2i(x, y + 2, 2, 1))) {
                        ;			/* estimate is contaminated */
                    } else {
                        MIAccessorT ptr(mi);
                        ptr.advance(x, y - 2);
                        ImageT const v_m2 = *ptr.image; ptr.nextRow();
                        ImageT const v_m1 = *ptr.image; ptr.nextRow();
                        ptr.nextRow();
                        ImageT const v_p1 = *ptr.image; ptr.nextRow();
                        ImageT const v_p2 = *ptr.image;
                        
                        ImageT const tmp = interp::lpc_1_c1*(v_m1 + v_p1) + interp::lpc_1_c2*(v_m2 + v_p2);
                        if(tmp > minval && tmp < min) {
                            min = tmp;
                            ngood++;
                        }
                    }
                }
/*
 * SW--NE diagonal
 */
                if(x - 2 >= 0 && x + 2 < ncol && y - 2 >= 0 && y + 2 < nrow) {
                    if (is_contaminated(mi.getMask(), badMask, vw::BBox2i(x - 2, y - 2, 1, 1)) ||
                        is_contaminated(mi.getMask(), badMask, vw::BBox2i(x - 1, y - 1, 1, 1)) ||
                        is_contaminated(mi.getMask(), badMask, vw::BBox2i(x + 1, y + 1, 1, 1)) ||
                        is_contaminated(mi.getMask(), badMask, vw::BBox2i(x + 2, y + 2, 1, 1))
                      ) {
                        ;			/* estimate is contaminated */
                    } else {
                        MIAccessorT ptr(mi);
                        ptr.advance(x - 2, y - 2);
                        ImageT const v_m2 = *ptr.image; ptr.nextRow(); ptr.nextCol();
                        ImageT const v_m1 = *ptr.image; ptr.nextRow(); ptr.nextCol();
                        ptr.nextRow(); ptr.nextCol();
                        ImageT const v_p1 = *ptr.image; ptr.nextRow(); ptr.nextCol();
                        ImageT const v_p2 = *ptr.image;
                        
                        ImageT const tmp =
                            interp::lpc_1s2_c1*(v_m1 + v_p1) + interp::lpc_1s2_c2*(v_m2 + v_p2);

                        if(tmp > minval && tmp < min) {
                            min = tmp;
                            ngood++;
                        }
                    }
                }
/*
 * SE--NW diagonal
 */
                if(x - 2 >= 0 && x + 2 < ncol && y - 2 >= 0 && y + 2 < nrow) {
                    if (is_contaminated(mi.getMask(), badMask, vw::BBox2i(x - 2, y + 2, 1, 1)) ||
                        is_contaminated(mi.getMask(), badMask, vw::BBox2i(x - 1, y + 1, 1, 1)) ||
                        is_contaminated(mi.getMask(), badMask, vw::BBox2i(x + 1, y - 1, 1, 1)) ||
                        is_contaminated(mi.getMask(), badMask, vw::BBox2i(x + 2, y - 2, 1, 1))
                      ) {
                        ;			/* estimate is contaminated */
                    } else {
                        MIAccessorT ptr(mi);
                        ptr.advance(x - 2, y + 2);
                        ImageT const v_m2 = *ptr.image; ptr.prevRow(); ptr.nextCol();
                        ImageT const v_m1 = *ptr.image; ptr.prevRow(); ptr.nextCol();
                        ptr.prevRow(); ptr.nextCol();
                        ImageT const v_p1 = *ptr.image; ptr.prevRow(); ptr.nextCol();
                        ImageT const v_p2 = *ptr.image;
                        
                        ImageT const tmp =
                            interp::lpc_1s2_c1*(v_m1 + v_p1) + interp::lpc_1s2_c2*(v_m2 + v_p2);

                        if(tmp > minval && tmp < min) {
                            min = tmp;
                            ngood++;
                        }
                    }
                }
/*
 * Have we altogether failed to find an acceptable value? If so interpolate
 * using the full-up interpolation code both vertically and horizontally
 * and take the average. This can fail for large enough defects (e.g. CRs
 * lying in bad columns), in which case the interpolator returns -1. If
 * both directions fail, use the background value.
 */
                if(ngood == 0) {
                    ImageT const val_h = interp::singlePixel(x, y, mi, true,  minval);
                    ImageT const val_v = interp::singlePixel(x, y, mi, false, minval);
	       
                    if(val_h == std::numeric_limits<ImageT>::min()) {
                        if(val_v == std::numeric_limits<ImageT>::min()) { // Still no good value. Guess wildly
                            min = bkgd + sqrt(*row.variance)*lsst::fw::math::gaussdev();
                        } else {
                            min = val_v;
                        }
                    } else {
                        if(val_v == std::numeric_limits<ImageT>::min()) {
                            min = val_h;
                        } else {
                            min = (val_v + val_h)/2;
                        }
                    }
                }
/*
 * debias the minimum; If more than one uncontaminated estimate was
 * available, estimate the bias to be simply that due to choosing the
 * minimum of two Gaussians. In fact, even some of the "good" pixels
 * may have some extra charge, so even if ngood > 2, still use this
 * estimate
 */
                if(debias && ngood > 1) {
                    min -= interp::min_2Gaussian_bias*sqrt(*row.variance);
                }
                *row.image = min;
            }
        }
    }
}

/************************************************************************************************************/
//
// Explicit instantiations
//
typedef float imagePixelType;

template
std::vector<lsst::detection::Footprint::PtrType>
lsst::detection::findCosmicRays(lsst::fw::MaskedImage<imagePixelType, maskPixelType> &image,
                                PSF const &psf,
                                float const bkgd,
                                lsst::mwi::policy::Policy const& policy,
                                bool const keep = false
                               );

//
// Why do we need double images?
//
#if 1
template
std::vector<lsst::detection::Footprint::PtrType>
lsst::detection::findCosmicRays(lsst::fw::MaskedImage<double, maskPixelType> &image,
                                PSF const &psf,
                                float const bkgd,
                                lsst::mwi::policy::Policy const& policy,
                                bool const keep = false
                               );
#endif
