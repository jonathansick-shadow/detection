// -*- lsst-c++ -*-
#include <iostream>
#include <lsst/detection/Measure.h>
#include <lsst/mwi/utils/Trace.h>
#include <lsst/fw/Exposure.h>
#include "lsst/mwi/persistence/BoostStorage.h"
#include "lsst/mwi/persistence/DbStorage.h"
#include "lsst/mwi/persistence/DbTsvStorage.h"
#include "lsst/mwi/persistence/Formatter.h"
#include "lsst/mwi/persistence/LogicalLocation.h"
#include "lsst/mwi/persistence/Persistence.h"

using namespace lsst::fw;
using namespace lsst::detection;
using namespace lsst::mwi::persistence;
namespace mwie = lsst::mwi::exceptions;

typedef float ImagePixelT;
typedef unsigned int MaskPixelT;

int main(int argc, char**argv) {

    lsst::mwi::utils::Trace::setDestination(std::cout);
    lsst::mwi::utils::Trace::setVerbosity(".", 1);
    
    Exposure<ImagePixelT, maskPixelType> inpExposure;

    try {
	 inpExposure.readFits(argv[1]);
    } catch (mwie::ExceptionStack &e) {
	 std::cerr << "Error processing Exposure " << argv[1] << ": " << std::endl << e.what() << std::endl;
	 exit(1);
    }

    // Unpack the MaskedImage from the Exposure

    MaskedImage<ImagePixelT, maskPixelType> img = inpExposure.getMaskedImage();

    // Crudely estimate noise from mean of variance image - should do sigma clipping

    MaskedImage<ImagePixelT, maskPixelType>::ImagePtrT varianceImagePtr = img.getVariance();
    //
    float noise = sqrt(mean_channel_value(varianceImagePtr->getIVw()));

    float thresh = atof(argv[2]);

    std::cout << "Using threshold: " << thresh*noise << std::endl;

    const int nPixMin = 5;   

    bool polarity = false;

    DetectionSet<ImagePixelT, maskPixelType> ds(img, Threshold(thresh*noise, Threshold::VALUE, polarity), "FP", nPixMin);

    //  Write out the image for debug so that the DetectionSet can be seen in the mask plane   
    
    std::string outName(argv[1]);

    try {
	 outName = outName + "_OP";
	 img.writeFits(outName);
    } catch (mwie::ExceptionStack &e) {
	 std::cerr << "Failed to write " << outName << ": " << e.what() << std::endl;
	 exit(1);
    }
    

    // Now measure the footprints.  Background is explicitly zero, as expected for difference image

    WCS imgWCS = inpExposure.getWcs();

    Measure<ImagePixelT, maskPixelType> mimg(img, "FP");

    std::vector<Footprint::PtrType>& fpVec = ds.getFootprints();
    lsst::fw::DiaSourceVector outputDiaSources;

    for (unsigned int i=0; i<fpVec.size(); i++) {
	 DiaSource::Ptr diaPtr(new lsst::fw::DiaSource);
	 diaPtr->setId(i); // will need to include Exposure id here!
	 mimg.measureSource(diaPtr, *fpVec[i], 0);
	 // use imgWCS to put ra and dec into DiaSource
	 Coord2D pixCoord(diaPtr->getColc(), diaPtr->getRowc());
	 Coord2D skyCoord = imgWCS.colRowToRaDec(pixCoord);
	 diaPtr->setRa(skyCoord[0]);
	 diaPtr->setDec(skyCoord[1]);
	 std::cout << boost::format("DiaSource: %ld %lf %lf -> %lf %lf\n") % diaPtr->getId() 
	      % diaPtr->getColc() % diaPtr->getRowc() % diaPtr->getRa() % diaPtr->getDec();
         outputDiaSources.push_back(*diaPtr);
    }

    // Now, try persisting the DiaSourceVector

    // Define a blank Policy.
    lsst::mwi::policy::Policy::Ptr policy(new lsst::mwi::policy::Policy);

    // Get a unique id for this test.
    struct timeval tv;
    gettimeofday(&tv, 0);      
    long long testId = tv.tv_sec * 1000000LL + tv.tv_usec;

    std::ostringstream os;
    os << testId;
    std::string testIdString = os.str();

    lsst::mwi::data::DataProperty::PtrType additionalData = lsst::mwi::data::SupportFactory::createPropertyNode("info");
    lsst::mwi::data::DataProperty::PtrType child1(new lsst::mwi::data::DataProperty("visitId", testId));
    lsst::mwi::data::DataProperty::PtrType child2(new lsst::mwi::data::DataProperty("sliceId", 0));
    additionalData->addProperty(child1);
    additionalData->addProperty(child2);

    Persistence::Ptr persist = Persistence::getPersistence(policy);
    Storage::List storageList;
    LogicalLocation pathLoc("outputDiaSources.boost." + testIdString);
    storageList.push_back(persist->getPersistStorage("BoostStorage", pathLoc));
    persist->persist(outputDiaSources, storageList, additionalData);

}
