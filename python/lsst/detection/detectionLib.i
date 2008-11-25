// -*- lsst-c++ -*-
%define oldDetectionlib_DOCSTRING
"
Python bindings for detection module
"
%enddef

%feature("autodoc", "1");
%module(package="detection",docstring=oldDetectionlib_DOCSTRING) detectionLib

// Suppress swig complaints
// I had trouble getting %warnfilter to work; hence the pragmas
#pragma SWIG nowarn=314                 // print is a python keyword (--> _print)
#pragma SWIG nowarn=362                 // operator=  ignored

%{
#   include <exception>
#   include <list>
#   include <map>
#   include <boost/cstdint.hpp>
#   include <boost/shared_ptr.hpp>
#   include "lsst/afw/image.h"
#if 0
#   include "lsst/afw/detection.h"         // requires afw > 3.2
#else
#   include "lsst/afw/detection/Footprint.h"
#   include "lsst/afw/detection/Source.h"
#endif
#   include "lsst/detection/CR.h"
#   include "lsst/detection/Interp.h"
#   include "lsst/detection/PSF.h"
#   include "lsst/detection/Measure.h"
%}

%inline %{
namespace boost { namespace filesystem { } }
namespace lsst { namespace afw {
        namespace detection { }
        namespace image { }
} }
namespace lsst { namespace detection { namespace interp {}} }
namespace lsst { namespace daf { namespace data { } } }
    
using namespace lsst;
using namespace lsst::afw::image;
using namespace lsst::afw::detection;
using namespace lsst::detection;
using namespace lsst::detection::interp;
using namespace lsst::daf::data;
%}

%init %{
%}

%include "lsst/p_lsstSwig.i"

%import "lsst/daf/base/baseLib.i"
%import "lsst/pex/policy/policyLib.i"
%import "lsst/daf/persistence/persistenceLib.i"
%import "lsst/daf/data/dataLib.i"
%import "lsst/afw/image/imageLib.i"
%import "lsst/afw/detection/detectionLib.i"

%lsst_exceptions();

%include "lsst/afw/image/lsstImageTypes.i"     // Image/Mask types and typedefs

%pythoncode %{
def version(HeadURL = r"$HeadURL$"):
    """Return a version given a HeadURL string; default: afw's version"""
    return guessSvnVersion(HeadURL)

%}

/************************************************************************************************************/

SWIG_SHARED_PTR_DERIVED(PSFPtrT, lsst::daf::data::LsstBase, lsst::detection::PSF);
SWIG_SHARED_PTR_DERIVED(dgPSFPtrT, lsst::detection::PSF, lsst::detection::dgPSF);

%include "lsst/detection/PSF.h"
%include "lsst/detection/CR.h"

%template(findCosmicRays) findCosmicRays<lsst::afw::image::MaskedImage<float, lsst::afw::image::MaskPixel> >;
%template(findCosmicRays) findCosmicRays<lsst::afw::image::MaskedImage<double, lsst::afw::image::MaskPixel> >;

/************************************************************************************************************/

SWIG_SHARED_PTR(DefectPtrT, lsst::detection::Defect);
SWIG_SHARED_PTR(DefectListT,  std::vector<lsst::detection::Defect::Ptr>);

%include "lsst/detection/Interp.h"

%template(DefectListT) std::vector<lsst::detection::Defect::Ptr>;

%template(interpolateOverDefects) interpolateOverDefects<lsst::afw::image::MaskedImage<float, lsst::afw::image::MaskPixel> >;
%template(interpolateOverDefects) interpolateOverDefects<lsst::afw::image::MaskedImage<double, lsst::afw::image::MaskPixel> >;

/************************************************************************************************************/

SWIG_SHARED_PTR(MeasureD, lsst::detection::Measure<lsst::afw::image::MaskedImage<double> >);
SWIG_SHARED_PTR(MeasureF, lsst::detection::Measure<lsst::afw::image::MaskedImage<float> >);

%include "lsst/detection/Measure.h"

%template(MeasureF) lsst::detection::Measure<lsst::afw::image::MaskedImage<float> >;
%template(MeasureD) lsst::detection::Measure<lsst::afw::image::MaskedImage<double> >;

/******************************************************************************/
// Local Variables: ***
// eval: (setq indent-tabs-mode nil) ***
// End: ***
