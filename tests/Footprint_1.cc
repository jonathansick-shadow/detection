#include <iostream>
#include "lsst/detection/Footprint.h"

using namespace lsst::fw;
using namespace lsst::detection;

typedef float ImagePixelT;

int main() {
    int status = 0;                     // return status; 0 => good
    
    MaskedImage<ImagePixelT, lsst::fw::maskPixelType> img(10,20);

    DetectionSet<ImagePixelT, lsst::fw::maskPixelType> ds_by_value1(img, 0);
    DetectionSet<ImagePixelT, lsst::fw::maskPixelType> ds_by_value2(img, Threshold(0, Threshold::VALUE));

    try {
        DetectionSet<ImagePixelT, lsst::fw::maskPixelType> ds_by_variance(img, Threshold(0, Threshold::STDEV));
        status++;
    } catch (lsst::mwi::exceptions::ExceptionStack& e) {
        std::cerr << "Caught exception: " << e.what() << std::endl;
    }
    
    try {
        DetectionSet<ImagePixelT, lsst::fw::maskPixelType> ds_by_variance(img, Threshold(0, Threshold::VARIANCE));
        status++;
    } catch (lsst::mwi::exceptions::ExceptionStack& e) {
        std::cerr << "Caught exception: " << e.what() << std::endl;
    }

    return status;
}
