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

%include "lsst/mwi/p_lsstSwig.i"
%include "lsst/fw/Core/lsstImageTypes.i"     // vw and Image/Mask types and typedefs

%pythoncode %{
def version(HeadURL = r"$HeadURL: svn+ssh://svn.lsstcorp.org/DC2/fw/trunk/python/lsst/fw/Core/detectionLib.i $"):
    """Return a version given a HeadURL string; default: fw's version"""
    return guessSvnVersion(HeadURL)

%}

%include "lsst/detection/Peak.h"
%include "lsst/detection/Footprint.h"

%include <vw/Math/BBox.h>

%template(PeakPtrT) boost::shared_ptr<Peak>;
%template(PeakContainerT) std::vector<lsst::detection::Peak::PtrType>;

%template(SpanPtrT) boost::shared_ptr<Span>;
%template(SpanContainerT) std::vector<lsst::detection::Span::PtrType>;

%template(FootprintPtrT) boost::shared_ptr<Footprint>;
%template(FootprintContainerT) std::vector<lsst::detection::Footprint::PtrType>;

%template(DetectionSetD) DetectionSet<ImagePixelType, MaskPixelType>;

/******************************************************************************/
// Local Variables: ***
// eval: (setq indent-tabs-mode nil) ***
// End: ***
