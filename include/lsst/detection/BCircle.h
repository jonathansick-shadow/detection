#if !defined(LSST_DETECTION_BCIRCLE_H)
#define LSST_DETECTION_BCIRCLE_H

#include  <vw/Core/FundamentalTypes.h>

namespace lsst { namespace detection {

/**
 * \brief A BCircle (named by analogy to vw::BBox) is used to describe a circle
 *
 * N.b. accessor functions are named, again by analogy to BBox, without the "get"
 */
template<typename T, int DIMEN>
class BCircle {
public:
    /// Create a BCircle given centre and radius
    BCircle(vw::Vector<T, DIMEN> center, //!< Centre of circle
            float r)                     //!< Radius of circle
        : _center(center), _radius(r) {}

    /// Create a BCircle given centre and radius (only in 2-D case)
    BCircle(T x,                        //!< column-centre of circle
            T y,                        //!< row-centre of circle
            float r)                     //!< radius of circle
        : _center(vw::Vector<T,DIMEN>(x, y)), _radius(r) {
      BOOST_STATIC_ASSERT(DIMEN == 2);
    }

    /// Return the circle's centre
    vw::Vector<T, DIMEN> const& center() const { return _center; }
    /// Return the circle's radius
    float radius() const { return _radius; }
        
private:
    vw::Vector<T, DIMEN> const _center;
    float _radius;
};

typedef BCircle<vw::int32, 2> BCircle2i;

}}
#endif
