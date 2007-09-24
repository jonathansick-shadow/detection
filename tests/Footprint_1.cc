#include <iostream>
#include "lsst/detection/Footprint.h"

using namespace lsst::fw;
using namespace lsst::detection;

typedef float ImagePixelT;
typedef unsigned char MaskPixelT;

int main() {
    int status = 0;                     // return status; 0 => good
    
    MaskedImage<ImagePixelT, MaskPixelT> img(10,20);

    DetectionSet<ImagePixelT, MaskPixelT> ds_by_value1(img, 0);
    DetectionSet<ImagePixelT, MaskPixelT> ds_by_value2(img, Threshold(0, Threshold::VALUE));

    try {
        DetectionSet<ImagePixelT, MaskPixelT> ds_by_variance(img, Threshold(0, Threshold::STDEV));
        status++;
    } catch (lsst::mwi::exceptions::Runtime& e) {
        std::cerr << "Caught exception: " << e.what() << std::endl;
    }
    
    try {
        DetectionSet<ImagePixelT, MaskPixelT> ds_by_variance(img, Threshold(0, Threshold::VARIANCE));
        status++;
    } catch (lsst::mwi::exceptions::Runtime& e) {
        std::cerr << "Caught exception: " << e.what() << std::endl;
    }

    return status;
}
