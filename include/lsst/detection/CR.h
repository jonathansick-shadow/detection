#if !defined(LSST_DETECTION_CR_H)
#define LSST_DETECTION_CR_H
//!
// Handle cosmic rays in a MaskedImage
//
#include <vector>
#include <lsst/afw/image/MaskedImage.h>
#include "lsst/detection/PSF.h"
#include "lsst/detection/Footprint.h"

class lsst::pex::policy::Policy;

namespace lsst { namespace detection {

template <typename ImageT, typename MaskT>
std::vector<lsst::detection::Footprint::PtrType>
findCosmicRays(lsst::afw::image::MaskedImage<ImageT, MaskT> &image,
               lsst::detection::PSF const &psf,
               float const bkgd,
               lsst::pex::policy::Policy const& policy,
               bool const keep = false
              );

}}

#endif
