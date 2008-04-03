// -*- lsst-c++ -*-
%define detectionLib_DOCSTRING
"
Python bindings for detection module
"
%enddef

%feature("autodoc", "1");
%module(docstring=detectionLib_DOCSTRING) detectionLib

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
#   include "lsst/detection/CR.h"
#   include "lsst/detection/Footprint.h"
#   include "lsst/detection/Interp.h"
#   include "lsst/detection/Measure.h"
#   include "lsst/detection/PSF.h"
%}

%inline %{
namespace boost { namespace filesystem { } }
namespace lsst { namespace afw { } }
namespace lsst { namespace detection { } }
namespace vw {}
    
using namespace lsst;
using namespace lsst::afw;
using namespace lsst::detection;
using namespace vw;
%}

%init %{
%}

%include "lsst/base/p_lsstSwig.i"

%import "lsst/daf/data/LsstData.h"
%import "lsst/daf/base/Citizen.h"
%import "lsst/daf/data/LsstImpl_DC2.h"
%import "lsst/daf/data/LsstBase.h"
%import "lsst/pex/policy/Policy.h"

%include "lsst/afw/Core/lsstImageTypes.i"     // vw and Image/Mask types and typedefs

%pythoncode %{
def version(HeadURL = r"$HeadURL: svn+ssh://svn.lsstcorp.org/DMS/afw/trunk/python/lsst/afw/Core/detectionLib.i $"):
    """Return a version given a HeadURL string; default: afw's version"""
    return guessSvnVersion(HeadURL)

%}

%import "lsst/afw/DiaSource.h"
%ignore lsst::afw::Mask::origin;         // no need to swig origin (and the _wrap.cc file is invalid)
%import "lsst/afw/Mask.h"

%include "lsst/detection/BCircle.h"
%include "lsst/detection/Peak.h"
%include "lsst/detection/Footprint.h"
%include "lsst/detection/Measure.h"

%include <vw/Math/BBox.h>
#if 0
%   include <vw/Math/Vector.h>             // swig doesn't like "const static int value = 0;"
#else
    template <class ElemT, int SizeN = 0>
    class Vector {
        boost::array<ElemT,SizeN> core_;
    public:
        Vector() {
            for( unsigned i=0; i<SizeN; ++i ) (*this)[i] = ElemT();
        }
        
        Vector( ElemT e1, ElemT e2 ) {
            BOOST_STATIC_ASSERT( SizeN >= 2 );
            (*this)[0] = e1; (*this)[1] = e2;
            for( unsigned i=2; i<SizeN; ++i ) (*this)[i] = ElemT();
        }

        ElemT x() {
            BOOST_STATIC_ASSERT( SizeN >= 1 );
            return core_[0];
        }
        
        ElemT y() {
            BOOST_STATIC_ASSERT( SizeN >= 2 );
            return core_[1];
        }
    };
#endif

%template(BCircle2i) lsst::detection::BCircle<int32, 2>;
%template(Vector2i)  vw::Vector<int32, 2>;

%boost_shared_ptr(PeakPtrT, Peak);
%template(PeakContainerT) std::vector<lsst::detection::Peak::PtrType>;

%boost_shared_ptr(SpanPtrT, Span);
%template(SpanContainerT) std::vector<lsst::detection::Span::PtrType>;

%boost_shared_ptr(FootprintPtrT, Footprint);
%template(FootprintContainerT) std::vector<lsst::detection::Footprint::PtrType>;

%template(DetectionSetF) lsst::detection::DetectionSet<float, lsst::afw::maskPixelType>;
%template(DetectionSetD) lsst::detection::DetectionSet<double, lsst::afw::maskPixelType>;

%template(MeasureF) lsst::detection::Measure<float, lsst::afw::maskPixelType>;
%template(MeasureD) lsst::detection::Measure<double, lsst::afw::maskPixelType>;

%template(MaskU) lsst::afw::Mask<maskPixelType>;
%template(setMaskFromFootprint) setMaskFromFootprint<lsst::afw::maskPixelType>;
%template(setMaskFromFootprintList) setMaskFromFootprintList<lsst::afw::maskPixelType>;

/************************************************************************************************************/

%include "lsst/detection/PSF.h"
%include "lsst/detection/CR.h"

%template(findCosmicRays) findCosmicRays<float, lsst::afw::maskPixelType>;
%template(findCosmicRays) findCosmicRays<double, lsst::afw::maskPixelType>;

/************************************************************************************************************/

%include "lsst/detection/Interp.h"

%boost_shared_ptr(DefectPtrT, Defect);
%template(DefectListT) std::vector<lsst::detection::Defect::PtrT>;

%template(interpolateOverDefects) interpolateOverDefects<float, lsst::afw::maskPixelType>;
%template(interpolateOverDefects) interpolateOverDefects<double, lsst::afw::maskPixelType>;

/******************************************************************************/
// Local Variables: ***
// eval: (setq indent-tabs-mode nil) ***
// End: ***
