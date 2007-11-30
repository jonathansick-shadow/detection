#if !defined(LSST_DETECTION_FOOTPRINT_H)
#define LSST_DETECTION_FOOTPRINT_H
//!
// Describe a portion of an image
//
#include <list>
#include <cmath>
#include <boost/cstdint.hpp>
#include <boost/shared_ptr.hpp>
#include <lsst/fw/MaskedImage.h>
#include <lsst/detection/Peak.h>
#include "BCircle.h"

namespace lsst { namespace detection {

class Footprint;

/*!
 * \brief Describe a range of pixels within an image
 *
 * This isn't really for public consumption, as it's the insides
 * of a Footprint --- it should be made a private class within
 * Footprint (but not until I'm fully checked in, which is hard
 * at 30000' over Peru)
 */
class Span {
public:
    typedef boost::shared_ptr<Span> PtrType;

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

/************************************************************************************************************/
/**
 * \brief A Threshold is used to pass a threshold value to the DetectionSet constructors
 *
 * The threshold may be a simple value (type == VALUE), or in units of the image
 * standard deviation; you may specify that you'll provide the standard deviation
 * (type == STDEV) or variance (type == VARIANCE)
 *
 * Note that the constructor is not declared explicit, so you may pass a bare
 * threshold, and it'll be interpreted as a VALUE.
 */
class Threshold {
public:
    typedef enum { VALUE, STDEV, VARIANCE } ThresholdType; //!< types of threshold:
    ;                                   //!< pixel value, number of sigma given s.d.; number of sigma given variance

    Threshold(const float value,        //!< desired value
              const ThresholdType type = VALUE) //!< interpretation of type
        : _value(value), _type(type) {}

    //! return type of threshold
    ThresholdType getType() const { return _type; }
    //! return value of threshold, to be interpreted via type
    float getValue(const float param = -1 //!< value of variance/stdev if needed
                  ) const {
        switch (_type) {
          case STDEV:
            if (param <= 0) {
                throw lsst::mwi::exceptions::InvalidParameter(boost::format("St. dev. must be > 0: %g") % param);
            }
            return _value*param;
          case VALUE:
            return _value;
          case VARIANCE:
            if (param <= 0) {
                throw lsst::mwi::exceptions::InvalidParameter(boost::format("Variance must be > 0: %g") % param);
            }
            return _value*std::sqrt(param);
          default:
            throw lsst::mwi::exceptions::InvalidParameter(boost::format("Unsopported type: %d") % _type);
        }
    } 
private:
    float _value;                       //!< value of threshold, to be interpreted via _type
    ThresholdType _type;                //!< type of threshold
};

/************************************************************************************************************/
/*!
 * \brief Represent a set of pixels in an image
 *
 * A Footprint is a set of pixels, usually but not necessarily contiguous.
 * There are constructors to find Footprints above some threshold in an image
 * (see DetectionSet), or to create Footprints in the shape of various
 * geometrical figures
 */
class Footprint : public lsst::mwi::data::LsstBase {
public:
    typedef boost::shared_ptr<Footprint> PtrType;

    Footprint(int nspan = 0, const vw::BBox2i region = vw::BBox2i(0, 0, 0, 0));
    Footprint(const vw::BBox2i& bbox, const vw::BBox2i region = vw::BBox2i(0, 0, 0, 0));
    Footprint(const BCircle2i& circle, const vw::BBox2i region = vw::BBox2i(0, 0, 0, 0));

    ~Footprint();

    int getId() { return _id; }         //!< Return the footprint's unique ID
    std::vector<Span::PtrType> &getSpans() { return _spans; } //!< return the Spans contained in this Footprint
    std::vector<Peak::PtrType> &getPeaks() { return _peaks; } //!< Return the Peaks contained in this Footprint
    int getNpix() { return _npix; }     //!< Return the number of pixels in this Footprint

    const Span& addSpan(const int y, const int x0, const int x1);

    const vw::BBox2i& getBBox() const { return _bbox; } //!< Return the Footprint's bounding box
    const vw::BBox2i& getRegion() const { return _region; } //!< Return the corners of the MaskedImage the footprints live in
    
    void normalize();
    int setNpix();
    void setBBox();

    void rectangle(const vw::BBox2i& bbox);

    void insertIntoImage(lsst::fw::Image<boost::uint16_t>& idImage, const int id) const;
private:
    //Footprint(const Footprint &) {};  // XXX how to I handle LsstBase's copy constructor?
    static int id;
    mutable int _id;                    //!< unique ID
    int _npix;                          //!< number of pixels in this Footprint
    
    std::vector<Span::PtrType> &_spans; //!< the Spans contained in this Footprint
    vw::BBox2i _bbox;                   //!< the Footprint's bounding box
    std::vector<Peak::PtrType> &_peaks; //!< the Peaks lying in this footprint
    const vw::BBox2i _region;           //!< The corners of the MaskedImage the footprints live in
    bool _normalized;                   //!< Are the spans sorted? 
};

/************************************************************************************************************/
/*!
 * \brief A set of Footprints, associated with a MaskedImage
 *
 */
template<typename ImagePixelT, typename MaskPixelT>
class DetectionSet : public lsst::mwi::data::LsstBase {
public:
    DetectionSet(const lsst::fw::MaskedImage<ImagePixelT, MaskPixelT> &img,
                 const Threshold& threshold,
                 const std::string& planeName = "",
                 const int npixMin = 1);
    DetectionSet(const lsst::fw::MaskedImage<ImagePixelT, MaskPixelT> &img,
                 const Threshold& threshold,
                 int x,
                 int y,
                 const std::vector<Peak> *peaks = NULL);
    DetectionSet(const DetectionSet &set, int r = 0);
    DetectionSet(const DetectionSet &footprints1, const DetectionSet &footprints2,
                 const int includePeaks);
    ~DetectionSet();

    std::vector<Footprint::PtrType>& getFootprints() { return _footprints; } //!< Retun the Footprints of detected objects
    const vw::BBox2i& getRegion() const { return _region; } //!< Return the corners of the MaskedImage

#if 0                                   // these are equivalent, but the former confuses swig
    typename lsst::fw::Image<boost::uint16_t>::ImagePtrT insertIntoImage(const bool relativeIDs);
#else
    typename boost::shared_ptr<lsst::fw::Image<boost::uint16_t> > insertIntoImage(const bool relativeIDs);
#endif
private:
    std::vector<Footprint::PtrType>& _footprints;  //!< the Footprints of detected objects
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

}}
#endif
