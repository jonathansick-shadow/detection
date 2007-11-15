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
%import "lsst/fw/Core/lsstImageTypes.i"     // vw and Image/Mask types and typedefs

%pythoncode %{
def version(HeadURL = r"$HeadURL: svn+ssh://svn.lsstcorp.org/DC2/fw/trunk/python/lsst/fw/Core/detectionLib.i $"):
    """Return a version given a HeadURL string; default: fw's version"""
    return guessSvnVersion(HeadURL)

%}

// Suppress swig complaints
// I had trouble getting %warnfilter to work; hence the pragmas
#pragma SWIG nowarn=314                 // print is a python keyword (--> _print)
#pragma SWIG nowarn=362                 // operator=  ignored

%import "lsst/mwi/data/Citizen.h"
%import "lsst/mwi/policy/Policy.h"
%import "lsst/mwi/data/LsstData.h"
%import "lsst/mwi/data/LsstImpl_DC2.h"
%import "lsst/mwi/data/LsstBase.h"

%import "lsst/fw/Image.h"
%import "lsst/fw/Mask.h"
%import "lsst/fw/MaskedImage.h"

%include "lsst/detection/BCircle.h"
%include "lsst/detection/Peak.h"
%include "lsst/detection/Footprint.h"

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
%template(Vector2i)             vw::Vector<int32, 2>;

%template(PeakPtrT) boost::shared_ptr<Peak>;
%template(PeakContainerT) std::vector<lsst::detection::Peak::PtrType>;

%template(SpanPtrT) boost::shared_ptr<Span>;
%template(SpanContainerT) std::vector<lsst::detection::Span::PtrType>;

%template(FootprintPtrT) boost::shared_ptr<Footprint>;
%template(FootprintContainerT) std::vector<lsst::detection::Footprint::PtrType>;

%template(DetectionSetF) lsst::detection::DetectionSet<float, lsst::fw::maskPixelType>;
%template(DetectionSetD) lsst::detection::DetectionSet<double, lsst::fw::maskPixelType>;
%boost_shared_ptr(DetectionSetDPtr, lsst::detection::DetectionSet<double, lsst::fw::maskPixelType>);

/******************************************************************************/
// Local Variables: ***
// eval: (setq indent-tabs-mode nil) ***
// End: ***
