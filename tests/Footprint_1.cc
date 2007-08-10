#include "lsst/detection/Footprint.h"

using namespace lsst::fw;
using namespace lsst::detection;

typedef float ImagePixelT;
typedef unsigned char MaskPixelT;

int main() {
    MaskedImage<ImagePixelT, MaskPixelT> img(10,20);
    DetectionSet<ImagePixelT, MaskPixelT> ds(img, 0);

    return 0;
}
