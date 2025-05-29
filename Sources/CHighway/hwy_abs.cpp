#include "hwy_abs.h"
#include "hwy/highway.h"


namespace hn = hwy::HWY_NAMESPACE;

// Float Add

extern "C" void hwy_abs_f32x2(const float *a, float *out) {
    hn::FixedTag<float, 2> d;
    auto va = hn::Load(d, a);
    hn::Store(hn::Abs(va), d, out);
}
extern "C" void hwy_abs_f32x3(const float *a, float *out) {
    hn::FixedTag<float, 4> d;
    auto va = hn::Load(d, a);
    hn::StoreN(hn::Abs(va), d, out, 3);
}
extern "C" void hwy_abs_f32x4(const float *a, float *out) {
    hn::FixedTag<float, 4> d;
    auto va = hn::Load(d, a);
    hn::Store(hn::Abs(va), d, out);
}

extern "C" void hwy_abs_f32x8(const float *a, float *out) {
    hn::CappedTag<float, 8> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    hn::Store(hn::Abs(va), d, out);
    if (lanes < 8) {
        va = hn::Load(d, a + lanes);
        hn::Store(hn::Abs(va), d, out + lanes);
    }
}

extern "C" void hwy_abs_f32x16(const float *a, float *out) {
    hn::CappedTag<float, 16> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    hn::Store(hn::Abs(va), d, out);
    if (lanes < 16) {
        va = hn::Load(d, a + lanes);
        hn::Store(hn::Abs(va), d, out + lanes);
    }
    if (lanes < 8) {
        va = hn::Load(d, a + 8);
        hn::Store(hn::Abs(va), d, out + 8);
        va = hn::Load(d, a + 12);
        hn::Store(hn::Abs(va), d, out + 12);
    }
}

extern "C" void hwy_abs_f32(const float *a, float *out, const size_t count) {
    hn::ScalableTag<float> d;
    const size_t lanes = hn::Lanes(d);
    size_t i = 0;
    for(; i + lanes <= count; i += lanes) {
        auto va = hn::LoadU(d, a + i);
        hn::StoreU(hn::Abs(va), d, out + i);
    }
    for (; i < count; ++i) {
        if (a[i] < 0.0) {
            out[i] = -a[i];
        } else {
            out[i] = a[i];
        }
    }
}

// Double Add

extern "C" void hwy_abs_f64x2(const double *a, double *out) {
    hn::FixedTag<double, 2> d;
    auto va = hn::Load(d, a);
    hn::Store(hn::Abs(va), d, out);
}
extern "C" void hwy_abs_f64x3(const double *a, double *out) {
    hn::CappedTag<double, 4> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    hn::StoreN(hn::Abs(va), d, out, 3);
    if (lanes < 3) {
        if (a[2] < 0.0) {
            out[2] = -a[2];
        } else {
            out[2] = a[2];
        }
    }
}
extern "C" void hwy_abs_f64x4(const double *a, double *out) {
    hn::CappedTag<double, 4> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    hn::Store(hn::Abs(va), d, out);
    if (lanes < 4) {
        va = hn::Load(d, a + 2);
        hn::Store(hn::Abs(va), d, out + 2);
    }
}

extern "C" void hwy_abs_f64x8(const double *a, double *out) {
    hn::CappedTag<double, 8> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    hn::Store(hn::Abs(va), d, out);
    if (lanes < 8) {
        va = hn::Load(d, a + lanes);
        hn::Store(hn::Abs(va), d, out + lanes);
    }
    if (lanes < 4) {
        va = hn::Load(d, a + 4);
        hn::Store(hn::Abs(va), d, out + 4);
        va = hn::Load(d, a + 6);
        hn::Store(hn::Abs(va), d, out + 6);
    }
}

extern "C" void hwy_abs_f64(const double *a, double *out, const size_t count) {
    hn::ScalableTag<double> d;
    const size_t lanes = hn::Lanes(d);
    size_t i = 0;
    for(; i + lanes <= count; i += lanes) {
        auto va = hn::LoadU(d, a + i);
        hn::StoreU(hn::Abs(va), d, out + i);
    }
    for (; i < count; ++i) {
        if (a[i] < 0.0) {
            out[i] = -a[i];
        } else {
            out[i] = a[i];
        }
    }
}