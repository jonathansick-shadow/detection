#if !defined(LSST_DETECTION_MEASURE_H)
#define LSST_DETECTION_MEASURE_H
//!
// Measure properties of an image selected by a Footprint
//
#include <list>
#include <cmath>
#include <boost/cstdint.hpp>
#include <boost/shared_ptr.hpp>
#include <lsst/fw/MaskedImage.h>
#include <lsst/fw/ImageUtils.h>
#include <lsst/detection/Footprint.h>
#include <lsst/fw/DiaSource.h>

namespace lsst { namespace detection {

/*!
 * \brief Measure properties of an image selected by a Footprint
 *
 */

/* Define the PixelProcessingFunc that will be used for the measurement */

template <typename ImagePixelT, typename MaskPixelT> 
class MeasurePixProcFunc : public lsst::fw::PixelProcessingFunc<ImagePixelT, MaskPixelT> {
public:
    typedef typename PixelChannelType<ImagePixelT>::type ImageChannelT;
    typedef typename PixelChannelType<MaskPixelT>::type MaskChannelT;
    typedef typename lsst::fw::PixelLocator<ImagePixelT> ImageIteratorT;
    typedef typename lsst::fw::PixelLocator<MaskPixelT> MaskIteratorT;
    
    MeasurePixProcFunc(lsst::fw::MaskedImage<ImagePixelT, MaskPixelT>& m, const std::string & footPrintPlaneName) : lsst::fw::PixelProcessingFunc<ImagePixelT, MaskPixelT>(m), _footPrintPlaneName(footPrintPlaneName) {}
    
    void init() {
        lsst::fw::PixelProcessingFunc<ImagePixelT, MaskPixelT>::_maskPtr->getPlaneBitMask(_footPrintPlaneName, bitsFP);
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
    float getXCentroid() { return xMoment/flux  + lsst::fw::image::PixelZeroPos; }
    float getYCentroid() { return yMoment/flux  + lsst::fw::image::PixelZeroPos; }

private:
    const std::string _footPrintPlaneName;
    MaskChannelT bitsFP;
    int nPix;
    float flux;
    float xMoment;
    float yMoment;
};


template<typename ImagePixelT, typename MaskPixelT>
class Measure :  private lsst::mwi::data::LsstBase {
public:
    Measure(lsst::fw::MaskedImage<ImagePixelT, MaskPixelT> &img, const std::string & footPrintPlaneName);
    Measure(lsst::fw::MaskedImage<ImagePixelT, MaskPixelT> &img, const std::string & footPrintPlaneName,
            lsst::fw::MaskPixelBooleanFunc<MaskPixelT> &selector);
    void measureSource( lsst::fw::DiaSource::Ptr, const Footprint &fp, float background=0);
    void measureSource( lsst::fw::DiaSource::Ptr, Footprint::PtrType fpPtr, float background=0);
private:
    lsst::fw::MaskedImage<ImagePixelT, MaskPixelT> _img;
    lsst::fw::MaskPixelBooleanFunc<MaskPixelT> *_selector;
    const std::string _footPrintPlaneName;
};

#ifndef SWIG // don't bother SWIG with .cc files
#include "Measure.cc"  
#endif
}
}
#endif // LSST_DETECTION_MEASURE_H

