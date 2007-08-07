#if !defined(LSST_DETECTION_FOOTPRINT_H)
#define LSST_DETECTION_FOOTPRINT_H
//
// Describe a segment of an image
//
#include <list>
#include <cmath>
#include <boost/shared_ptr.hpp>
#include <lsst/fw/MaskedImage.h>
#include <lsst/detection/Peak.h>

namespace lsst { namespace detection {

class Footprint;

class Span {
public:
    typedef boost::shared_ptr<Span> SpanPtrT;

    Span(int y,                         //!< Row that span's in
         int x0,                        //!< Starting column (inclusive)
         int x1)                        //!< Ending column (inclusive)
        : _y(y), _x0(x0), _x1(x1) {}
    ~Span() {}

    int getX0() { return _x0; }
    int getX1() { return _x1; }
    int getY() { return _y; }

    std::string toString();    
    
    int compareByYX(const void **a, const void **b);

    friend class Footprint;
private:
    Span(const Span &) {}
    int _y;                             //!< Row that span's in
    int _x0;                            //!< Starting column (inclusive)
    int _x1;                            //!< Ending column (inclusive)
};

typedef boost::shared_ptr<Span> SpanPtrT;

/************************************************************************************************************/

class Footprint : private lsst::fw::LsstBase {
public:
    Footprint(int nspan = 0, const vw::BBox2i region = vw::BBox2i(0, 0, 0, 0));
    ~Footprint();

    int getId() { return _id; }         //!< Return the footprint's unique ID
    std::vector<SpanPtrT> &getSpans() { return _spans; } //!< return the Spans contained in this Footprint
    std::vector<PeakPtrT> &getPeaks() { return _peaks; } //!< Return the Peaks contained in this Footprint
    int getNpix() { return _npix; }     //!< Return the number of pixels in this Footprint

    const Span& addSpan(const int y, const int x0, const int x1);

    const vw::BBox2i& getBBox() const { return _bbox; } //!< Return the Footprint's bounding box
    const vw::BBox2i& getRegion() const { return _region; } //!< Return the corners of the MaskedImage the footprints live in
    
    void normalize();
    int setNpix();
    void setBBox();    

    void insertIntoImage(lsst::fw::Image<int>& idImage, const int id) const;
private:
    //Footprint(const Footprint &) {};  // XXX how to I handle LsstBase's copy constructor?
    static int id;
    mutable int _id;                    //!< unique ID
    int _npix;                          //!< number of pixels in this Footprint
    
    std::vector<SpanPtrT> &_spans;        //!< the Spans contained in this Footprint
    vw::BBox2i _bbox;                   //!< the Footprint's bounding box
    std::vector<PeakPtrT> &_peaks;        //!< the Peaks lying in this footprint
    const vw::BBox2i _region;           //!< The corners of the MaskedImage the footprints live in
    bool _normalized;                   //!< Are the spans sorted? 
};

typedef boost::shared_ptr<Footprint> FootprintPtrT;

/************************************************************************************************************/
    
template<typename ImagePixelT, typename MaskPixelT>
class DetectionSet : private lsst::fw::LsstBase {
public:
    DetectionSet(const lsst::fw::MaskedImage<ImagePixelT, MaskPixelT> &img,
                 const float threshold,
                 const std::string& planeName = "",
                 const int npixMin = 1);
    DetectionSet(const lsst::fw::MaskedImage<ImagePixelT, MaskPixelT> &img,
                 const float threshold,
                 int x,
                 int y,
                 const vector<Peak> *peaks = NULL);
    DetectionSet(const DetectionSet &set, int r = 0);
    DetectionSet(const DetectionSet &footprints1, const DetectionSet &footprints2,
                 const int includePeaks);
    ~DetectionSet();

    std::vector<FootprintPtrT>& getFootprints() { return _footprints; } //!< Retun the Footprints of detected objects
    const vw::BBox2i& getRegion() const { return _region; } //!< Return the corners of the MaskedImage

#if 0                                   // these are equivalent, but the former confuses swig
    typename lsst::fw::Image<int>::ImagePtrT insertIntoImage(const bool relativeIDs);
#else
    typename boost::shared_ptr<lsst::fw::Image<int> > insertIntoImage(const bool relativeIDs);
#endif
private:
    std::vector<FootprintPtrT>& _footprints;  //!< the Footprints of detected objects
    const vw::BBox2i _region;           //!< The corners of the MaskedImage that the detections live in
};

#if 0
psErrorCode pmPeaksAssignToFootprints(psArray *footprints, const psArray *peaks);

psErrorCode pmFootprintArrayCullPeaks(const psImage *img, const psImage *weight, psArray *footprints,
                                 const float nsigma, const float threshold_min);
psErrorCode pmFootprintCullPeaks(const psImage *img, const psImage *weight, pmFootprint *fp,
                                 const float nsigma, const float threshold_min);

psArray *pmFootprintArrayToPeaks(const psArray *footprints);
#endif

#include "Footprint.cc"
}}
#endif
