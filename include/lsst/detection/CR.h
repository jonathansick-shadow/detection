#if !defined(LSST_DETECTION_CR_H)
#define LSST_DETECTION_CR_H
//!
// Handle cosmic rays in a MaskedImage
//
#include <vector>
#include <lsst/fw/MaskedImage.h>
#include "lsst/detection/PSF.h"
#include "lsst/detection/Footprint.h"

class lsst::mwi::policy::Policy;

namespace lsst { namespace detection {

template <typename ImageT, typename MaskT>
std::vector<lsst::detection::Footprint::PtrType>
findCosmicRays(lsst::fw::MaskedImage<ImageT, MaskT> &image,
               lsst::detection::PSF const &psf,
               float const bkgd,
               lsst::mwi::policy::Policy const& policy,
               bool const keep = false
              );

}}

#endif
