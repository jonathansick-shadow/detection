template<typename ImagePixelT, typename MaskPixelT>
Measure<ImagePixelT, MaskPixelT>::Measure(lsst:afw::MaskedImage<ImagePixelT, MaskPixelT> &img, const std::string & footPrintPlaneName) 
     : lsst::daf::data::LsstBase(typeid(this)), _footPrintPlaneName(footPrintPlaneName)
{
     _img = img;
     _selector = NULL;
}

template<typename ImagePixelT, typename MaskPixelT>
Measure<ImagePixelT, MaskPixelT>::Measure(lsst:afw::MaskedImage<ImagePixelT, MaskPixelT> &img,
					  const std::string & footPrintPlaneName,
					  lsst:afw::MaskPixelBooleanFunc<MaskPixelT> &selector) 
     : lsst::daf::data::LsstBase(typeid(this)), _footPrintPlaneName(footPrintPlaneName)
{
     _img = img;
     _selector = &selector;
}

template<typename ImagePixelT, typename MaskPixelT>
void Measure<ImagePixelT, MaskPixelT>::measureSource( lsst:afw::DiaSource::Ptr pDia, const Footprint &fp, float background)
{
/* Plan:
   1. Define a MeasurePixProcFunc derived from PixelProcessingFunc
   2. Get the bounding box for the Footprint, and get a SubImage for it
   3. Set a MaskPlane to the Footprint pixels (new method on Footprint? - modify insertIntoImage)
   3. Instantiate a MeasurePixProcFunc with the correct Maskplane
   4. subimg.processPixels()
   5. Retrieve the various moments
   6. Make a new DiaSource and stuff the moments in, return pointer
 */

     vw::BBox2i bbox = fp.getBBox();
     vw::Vector<float, 2> bbMin = bbox.min();
     vw::Vector<float, 2> bbMax = bbox.max();

     typename lsst:afw::MaskedImage<ImagePixelT, MaskPixelT>::MaskedImagePtrT fpImage = _img.getSubImage(fp.getBBox());
     *fpImage -= background;

     MeasurePixProcFunc<ImagePixelT, MaskPixelT> measureFunc(*fpImage, _footPrintPlaneName);
     measureFunc.init();

     fpImage->processPixels(measureFunc);

     float xCentroid = fpImage->getOffsetCols() + measureFunc.getXCentroid();
     float yCentroid = fpImage->getOffsetRows() + measureFunc.getYCentroid();
     float flux = measureFunc.getFlux();

     lsst::daf::utils::Trace("detection.Measure", 1,
			     boost::format("nPix, flux, xCen, yCen: %d %f %f %f") 
			     %  measureFunc.getNumPix() %  measureFunc.getFlux()
			     % xCentroid % yCentroid);

     lsst::daf::utils::Trace("detection.Measure", 2,
			     boost::format("(x,y)-(x,y) nPix(fp), nPi: %f %f %f %f %d %d") 
			     % bbMin[0] % bbMin[1] % bbMax[0] % bbMax[1]
			     % fp.getNpix() %  measureFunc.getNumPix());

     pDia->setColc(xCentroid);
     pDia->setRowc(yCentroid);
     pDia->setFlux(flux);
     pDia->setFlag4detection(measureFunc.getNumPix());

     lsst::daf::utils::Trace("detection.Measure", 1,
			     boost::format("nPix, flag: %d %d") 
			     %  measureFunc.getNumPix() %  pDia->getFlag4detection());
     
}

template<typename ImagePixelT, typename MaskPixelT>
void Measure<ImagePixelT, MaskPixelT>::measureSource( lsst:afw::DiaSource::Ptr pDia, Footprint::PtrType fpPtr, float background)
{
/* Plan:
   1. Define a MeasurePixProcFunc derived from PixelProcessingFunc
   2. Get the bounding box for the Footprint, and get a SubImage for it
   3. Set a MaskPlane to the Footprint pixels (new method on Footprint? - modify insertIntoImage)
   3. Instantiate a MeasurePixProcFunc with the correct Maskplane
   4. subimg.processPixels()
   5. Retrieve the various moments
   6. Make a new DiaSource and stuff the moments in, return pointer
 */

     vw::BBox2i bbox = fpPtr->getBBox();
     vw::Vector<float, 2> bbMin = bbox.min();
     vw::Vector<float, 2> bbMax = bbox.max();

     typename lsst:afw::MaskedImage<ImagePixelT, MaskPixelT>::MaskedImagePtrT fpImage = _img.getSubImage(fpPtr->getBBox());
     *fpImage -= background;

     MeasurePixProcFunc<ImagePixelT, MaskPixelT> measureFunc(*fpImage, _footPrintPlaneName);
     measureFunc.init();

     fpImage->processPixels(measureFunc);

     float xCentroid = fpImage->getOffsetCols() + measureFunc.getXCentroid();
     float yCentroid = fpImage->getOffsetRows() + measureFunc.getYCentroid();
     float flux = measureFunc.getFlux();

     lsst::pex::logging::Trace("detection.Measure", 1,
			     boost::format("nPix, flux, xCen, yCen: %d %f %f %f") 
			     %  measureFunc.getNumPix() %  measureFunc.getFlux()
			     % xCentroid % yCentroid);

     lsst::pex::logging::Trace("detection.Measure", 2,
			     boost::format("(x,y)-(x,y) nPix(fp), nPi: %f %f %f %f %d %d") 
			     % bbMin[0] % bbMin[1] % bbMax[0] % bbMax[1]
			     % fpPtr->getNpix() %  measureFunc.getNumPix());

     pDia->setColc(xCentroid);
     pDia->setRowc(yCentroid);
     pDia->setFlux(flux);
     pDia->setFlag4detection(measureFunc.getNumPix());

     lsst::pex::logging::Trace("detection.Measure", 1,
			     boost::format("nPix, flag: %d %d") 
			     %  measureFunc.getNumPix() %  pDia->getFlag4detection());
}
