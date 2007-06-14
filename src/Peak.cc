/*****************************************************************************/
/*
 * Handle Peaks
 */
#include <cassert>
#include <string>
#include <typeinfo>
#include <boost/format.hpp>
#include "lsst/fw/Trace.h"
#include "lsst/fw/Exception.h"
#include "lsst/detection/Peak.h"

using namespace lsst::detection;

int Peak::id = 0;                       //!< Counter for Peak IDs

/**
 * Return a string-representation of a Peak
 */
std::string Peak::toString() {
    return (boost::format("%d: (%d,%d)  (%.3f, %.3f)") % _id % _ix % _iy % _fx % _fy).str();
}
