#if !defined(LSST_DETECTION_PEAK_H)
#define LSST_DETECTION_PEAK_H
    
#include <list>
#include <cmath>
#include <boost/shared_ptr.hpp>
#include <lsst/fw/LsstBase.h>
#include <lsst/detection/Peak.h>

namespace lsst { namespace detection {

class Peak : private lsst::fw::Citizen {
public:
    explicit Peak(int ix,               //!< column pixel
                  int iy)               //!< row pixel
        : lsst::fw::Citizen(typeid(*this)),
          _id(++id),
          _ix(ix), _iy(iy), _fx(ix), _fy(iy) {};
    explicit Peak(float fx = NAN,       //!< column centre
                  float fy = NAN)       //!< row centre
        : lsst::fw::Citizen(typeid(*this)),
          _id(++id),
          _ix(fx > 0 ? static_cast<int>(fx) : -static_cast<int>(-fx) - 1),
          _iy(fy > 0 ? static_cast<int>(fy) : -static_cast<int>(-fy) - 1),
          _fx(fx), _fy(fy) {};
    ~Peak() {};

    int getId() { return _id; }         //!< Return the Peak's unique ID

    int getIx() { return _ix; }         //!< Return the column pixel position
    int getIy() { return _iy; }         //!< Return the row pixel position
    float getFx() { return _fx; }       //!< Return the column centroid
    float getFy() { return _fy; }       //!< Return the row centroid

    std::string toString();    
private:
    //Peak(const Peak &) {}             // XXX How do we manage Citizen's copy constructor?
    static int id;
    mutable int _id;                    //!< unique ID for this peak
    int _ix;                            //!< column-position of peak pixel
    int _iy;                            //!< row-position of peak pixel
    float _fx;                          //!< column-position of peak
    float _fy;                          //!< row-position of peak
};

typedef boost::shared_ptr<Peak> PeakPtrT;

}}
#endif
