// -*- lsst-c++ -*-
%define detectionLib_DOCSTRING
"
Python bindings for detection module
"
%enddef

%feature("autodoc", "1");
%module(docstring=detectionLib_DOCSTRING) detectionLib

%{
#   include <exception>
#   include <list>
#   include <map>
#   include <boost/cstdint.hpp>
#   include <boost/shared_ptr.hpp>
#   include "lsst/detection/Footprint.h"
%}

%inline %{
namespace lsst { namespace fw { } }
namespace lsst { namespace detection { } }
namespace vw {}
    
using namespace lsst;
using namespace lsst::fw;
using namespace lsst::detection;
using namespace vw;
%}

%init %{
%}

%include "lsst/fw/Core/p_lsstSwig.i"

%pythoncode %{
def version(HeadURL = r"$HeadURL: svn+ssh://svn.lsstcorp.org/DC2/fw/trunk/python/lsst/fw/Core/detectionLib.i $"):
    """Return a version given a HeadURL string; default: fw's version"""
    return guessSvnVersion(HeadURL)

%}

%include "lsst/detection/Peak.h"
%include "lsst/detection/Footprint.h"

%include <vw/Math/BBox.h>

%template(PeakPtrT) boost::shared_ptr<Peak>;
%template(PeakContainerT) std::vector<PeakPtrT>;

%template(SpanPtrT) boost::shared_ptr<Span>;
%template(SpanContainerT) std::vector<SpanPtrT>;

%template(FootprintPtrT) boost::shared_ptr<Footprint>;
%template(FootprintContainerT) std::vector<FootprintPtrT>;

%template(DetectionSetD) DetectionSet<ImagePixelType, MaskPixelType>;

#if 0
/******************************************************************************/

%ignore vw::ImageView<ImagePixelType>::origin;
%ignore vw::ImageView<MaskPixelType>::origin;
%ignore operator vw::ImageView::unspecified_bool_type;
%ignore operator lsst::Mask::operator()(int, int); // RHL can't get this to work

%import <vw/Core/FundamentalTypes.h>

%include <vw/Image/ImageViewBase.h>
%include <vw/Image/ImageView.h>
%include <vw/Image/PixelTypeInfo.h>
%include <vw/Image/PixelTypes.h>
%include <vw/Image/ImageResource.h>
%include <vw/Math/BBox.h>

%import <vw/FileIO/DiskImageResource.h>
%include "lsst/fw/DiskImageResourceFITS.h"

/******************************************************************************/
// Citizens, Trace, etc.
%include "lsst/fw/Citizen.h"
%include "lsst/fw/Trace.h"
%include "lsst/fw/DataProperty.h"

#if 0                                   // doesn't work (yet)
typedef boost::shared_ptr<DataProperty> DataPropertyPtr;

%contract DataPropertyPtr::DataPropertyPtr {
ensure:
    DataPropertyPtr_ptr.get() > 0;
}
#endif
    
%template(DataPropertyPtrT) boost::shared_ptr<DataProperty>;
%template(DataPropertyContainerT) std::list<DataPropertyPtrT>;

%extend lsst::fw::DataProperty {
    %exception {
        try {
            $action;
        } catch(boost::bad_any_cast &e) {
            SWIG_exception(SWIG_RuntimeError, e.what());
        }
    }
    
    DataProperty(std::string name, int val) {
        return new DataProperty(name, val);
    }
    DataProperty(std::string name, std::string val) {
        return new DataProperty(name, val);
    }

    int getValueInt() {
        return boost::any_cast<const int>(self->getValue());
    }
    std::string getValueString() {
        return boost::any_cast<const std::string>(self->getValue());
    }

    DataPropertyPtrT match(const std::string &pattern, bool reset=true) {
        boost::regex re(pattern);
        return self->find(re, reset);
    }
}

/******************************************************************************/
// Masks and MaskedImages
%newobject getMaskPlaneMetaData;
%clear int &;
%template(pairIntString) std::pair<int,std::string>;
%template(mapIntString)  std::map<int,std::string>;
%apply int &OUTPUT { int & };

%include "lsst/fw/Mask.h"
%include "lsst/fw/MaskedImage.h"

%template(ImageBaseFloat) vw::ImageViewBase<vw::ImageView<ImagePixelType> >;
%template(ImageFloat)     vw::ImageView<ImagePixelType>;

%template(ImageBaseMask)  vw::ImageViewBase<vw::ImageView<MaskPixelType> >;
%template(ImageMask)      vw::ImageView<MaskPixelType>;

%template(MaskD)          lsst::fw::Mask<MaskPixelType>;
%template(MaskedImageD)   lsst::fw::MaskedImage<ImagePixelType, MaskPixelType>;
%template(MaskDPtr)       boost::shared_ptr<lsst::fw::Mask<MaskPixelType> >;
%template(BBox2i)	  BBox<int32, 2>;

%extend_smart_pointer(boost::shared_ptr<vw::ImageView<MaskPixelType> >);
//%delobject boost::shared_ptr<vw::ImageView<MaskPixelType> >::shared_ptr;
//%apply SWIGTYPE *DISOWN {Foo *foo};
%template(MaskIVwPtrT) boost::shared_ptr<vw::ImageView<MaskPixelType> >;

%pythoncode %{
def ImageMaskPtr(*args):
    """Return an MaskIVwPtrT that owns its ImageMask"""

    Trace("fw.memory", 5, "creating maskImagePtr")

    im = ImageMask(*args)
    im.this.disown()
    maskImagePtr = MaskIVwPtrT(im)

    Trace("fw.memory", 5, "returning maskImagePtr")
        
    return maskImagePtr

def DataPropertyPtr(*args):
    """Return an DataPropertyPtrT that owns its DataProperty"""

    Trace("fw.memory", 5, "creating DataPropertyPtrT")

    md = DataProperty(*args)
    md.this.disown()
    DataPropertyPtr = DataPropertyPtrT(md)

    Trace("fw.memory", 5, "returning DataPropertyPtr")
        
    return DataPropertyPtr
%}

%template(listPixelCoord)  std::list<lsst::fw::PixelCoord>;
#endif

/******************************************************************************/
// Local Variables: ***
// eval: (setq indent-tabs-mode nil) ***
// End: ***
