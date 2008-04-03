#if !defined(LSST_DETECTION_MEASURE_H)
#define LSST_DETECTION_MEASURE_H
//!
// Measure properties of an image selected by a Footprint
//
#include <list>
#include <cmath>
#include <boost/cstdint.hpp>
#include <boost/shared_ptr.hpp>
#include <lsst/afw/MaskedImage.h>
#include <lsst/afw/ImageUtils.h>
#include <lsst/detection/Footprint.h>
#include <lsst/afw/DiaSource.h>

namespace lsst { namespace detection {

/*!
 * \brief Measure properties of an image selected by a Footprint
 *
 */

/* Define the PixelProcessingFunc that will be used for the measurement */

template <typename ImagePixelT, typename MaskPixelT> 
class MeasurePixProcFunc : public lsst::afw::PixelProcessingFunc<ImagePixelT, MaskPixelT> {
public:
    typedef typename PixelChannelType<ImagePixelT>::type ImageChannelT;
    typedef typename PixelChannelType<MaskPixelT>::type MaskChannelT;
    typedef typename lsst::afw::PixelLocator<ImagePixelT> ImageIteratorT;
    typedef typename lsst::afw::PixelLocator<MaskPixelT> MaskIteratorT;
    
    MeasurePixProcFunc(lsst::afw::MaskedImage<ImagePixelT, MaskPixelT>& m, const std::string & footPrintPlaneName) : lsst::afw::PixelProcessingFunc<ImagePixelT, MaskPixelT>(m), _footPrintPlaneName(footPrintPlaneName) {}
    
    void init() {
        lsst::afw::PixelProcessingFunc<ImagePixelT, MaskPixelT>::_maskPtr->getPlaneBitMask(_footPrintPlaneName, bitsFP);
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
    Measure(lsst::afw::MaskedImage<ImagePixelT, MaskPixelT> &img, const std::string & footPrintPlaneName);
    Measure(lsst::afw::MaskedImage<ImagePixelT, MaskPixelT> &img, const std::string & footPrintPlaneName,
            lsst::afw::MaskPixelBooleanFunc<MaskPixelT> &selector);
    void measureSource( lsst::afw::DiaSource::Ptr, const Footprint &fp, float background=0);
    void measureSource( lsst::afw::DiaSource::Ptr, Footprint::PtrType fpPtr, float background=0);
private:
    lsst::afw::MaskedImage<ImagePixelT, MaskPixelT> _img;
    lsst::afw::MaskPixelBooleanFunc<MaskPixelT> *_selector;
    const std::string _footPrintPlaneName;
};

#ifndef SWIG // don't bother SWIG with .cc files
#include "Measure.cc"  
#endif
}
}
#endif // LSST_DETECTION_MEASURE_H

