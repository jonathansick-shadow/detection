#if !defined(LSST_DETECTION_MEASURE_H)
#define LSST_DETECTION_MEASURE_H
//!
// Measure properties of an image selected by a Footprint
//
#include <list>
#include <cmath>
#include <boost/cstdint.hpp>
#include <boost/shared_ptr.hpp>
#include <lsst/afw/image/MaskedImage.h>
#include <lsst/afw/image/ImageUtils.h>
#include <lsst/detection/Footprint.h>
#include <lsst/afw/detection/Source.h>

namespace lsst { namespace detection {

/*!
 * \brief Measure properties of an image selected by a Footprint
 *
 */

/* Define the PixelProcessingFunc that will be used for the measurement */

template <typename ImagePixelT, typename MaskPixelT> 
class MeasurePixProcFunc : public lsst::afw::image::PixelProcessingFunc<ImagePixelT, MaskPixelT> {
public:
    typedef typename vw::PixelChannelType<ImagePixelT>::type ImageChannelT;
    typedef typename vw::PixelChannelType<MaskPixelT>::type MaskChannelT;
    typedef typename lsst::afw::image::PixelLocator<ImagePixelT> ImageIteratorT;
    typedef typename lsst::afw::image::PixelLocator<MaskPixelT> MaskIteratorT;
    
    MeasurePixProcFunc(lsst::afw::image::MaskedImage<ImagePixelT, MaskPixelT>& m, const std::string & footPrintPlaneName) : lsst::afw::image::PixelProcessingFunc<ImagePixelT, MaskPixelT>(m), _footPrintPlaneName(footPrintPlaneName) {}
    
    void init() {
        lsst::afw::image::PixelProcessingFunc<ImagePixelT, MaskPixelT>::_maskPtr->getPlaneBitMask(_footPrintPlaneName, bitsFP);
       nPix = 0;
       flux = 0.0;
       xMoment = 0.0;
       yMoment = 0.0;
    }
       
    void operator ()(ImageIteratorT &i,MaskIteratorT &m ) { 
       if (*m & bitsFP) {
           flux += *i;
           xMoment += i.col() * *i;
           yMoment += i.row() * *i;
           nPix++;
       }
    }

    int getNumPix() { return nPix; }
    float getFlux() { return flux; }
    float getXCentroid() { return xMoment/flux  + lsst::afw::image::PixelZeroPos; }
    float getYCentroid() { return yMoment/flux  + lsst::afw::image::PixelZeroPos; }

private:
    const std::string _footPrintPlaneName;
    MaskChannelT bitsFP;
    int nPix;
    float flux;
    float xMoment;
    float yMoment;
};


template<typename ImagePixelT, typename MaskPixelT>
class Measure :  private lsst::daf::data::LsstBase {
public:
    Measure(lsst::afw::image::MaskedImage<ImagePixelT, MaskPixelT> &img, const std::string & footPrintPlaneName);
    Measure(lsst::afw::image::MaskedImage<ImagePixelT, MaskPixelT> &img, const std::string & footPrintPlaneName,
            lsst::afw::image::MaskPixelBooleanFunc<MaskPixelT> &selector);
    void measureSource( lsst::afw::detection::Source::Ptr, const Footprint &fp, float background=0);
    void measureSource( lsst::afw::detection::Source::Ptr, Footprint::PtrType fpPtr, float background=0);
private:
    lsst::afw::image::MaskedImage<ImagePixelT, MaskPixelT> _img;
    lsst::afw::image::MaskPixelBooleanFunc<MaskPixelT> *_selector;
    const std::string _footPrintPlaneName;
};

#ifndef SWIG // don't bother SWIG with .cc files
#include "Measure.cc"  
#endif
}
}
#endif // LSST_DETECTION_MEASURE_H

