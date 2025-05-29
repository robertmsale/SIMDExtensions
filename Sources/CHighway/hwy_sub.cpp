#include "hwy_add.h"
#include "hwy/highway.h"


namespace hn = hwy::HWY_NAMESPACE;

// Float Sub

extern "C" void hwy_sub_f32x2(const float *a, const float *b, float *out) {
    hn::FixedTag<float, 2> d;
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Sub(va, vb), d, out);
}
extern "C" void hwy_sub_f32x3(const float *a, const float *b, float *out) {
    hn::FixedTag<float, 4> d;
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::StoreN(hn::Sub(va, vb), d, out, 3);
}
extern "C" void hwy_sub_f32x4(const float *a, const float *b, float *out) {
    hn::FixedTag<float, 4> d;
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Sub(va, vb), d, out);
}

extern "C" void hwy_sub_f32x8(const float *a, const float *b, float *out) {
    hn::CappedTag<float, 8> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Sub(va, vb), d, out);
    if (lanes < 8) {
        va = hn::Load(d, a + lanes);
        vb = hn::Load(d, b + lanes);
        hn::Store(hn::Sub(va, vb), d, out + lanes);
    }
}

extern "C" void hwy_sub_f32x16(const float *a, const float *b, float *out) {
    hn::CappedTag<float, 16> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Sub(va, vb), d, out);
    if (lanes < 16) {
        va = hn::Load(d, a + lanes);
        vb = hn::Load(d, b + lanes);
        hn::Store(hn::Sub(va, vb), d, out + lanes);
    }
    if (lanes < 8) {
        va = hn::Load(d, a + 8);
        vb = hn::Load(d, b + 8);
        hn::Store(hn::Sub(va, vb), d, out + 8);
        va = hn::Load(d, a + 12);
        vb = hn::Load(d, b + 12);
        hn::Store(hn::Sub(va, vb), d, out + 12);
    }
}

extern "C" void hwy_sub_f32(const float *a, const float *b, float *out, const size_t count) {
    hn::ScalableTag<float> d;
    const size_t lanes = hn::Lanes(d);
    size_t i = 0;
    for(; i + lanes <= count; i += lanes) {
        auto va = hn::LoadU(d, a + i);
        auto vb = hn::LoadU(d, b + i);
        hn::StoreU(hn::Sub(va, vb), d, out + i);
    }
    for (; i < count; ++i) out[i] = a[i] + b[i];
}

// Double Sub

extern "C" void hwy_sub_f64x2(const double *a, const double *b, double *out) {
    hn::FixedTag<double, 2> d;
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Sub(va, vb), d, out);
}
extern "C" void hwy_sub_f64x3(const double *a, const double *b, double *out) {
    hn::CappedTag<double, 4> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::StoreN(hn::Sub(va, vb), d, out, 3);
    if (lanes < 3) {
        out[2] = a[2] + b[2];
    }
}
extern "C" void hwy_sub_f64x4(const double *a, const double *b, double *out) {
    hn::CappedTag<double, 4> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Sub(va, vb), d, out);
    if (lanes < 4) {
        va = hn::Load(d, a + 2);
        vb = hn::Load(d, b + 2);
        hn::Store(hn::Sub(va, vb), d, out + 2);
    }
}

extern "C" void hwy_sub_f64x8(const double *a, const double *b, double *out) {
    hn::CappedTag<double, 8> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Sub(va, vb), d, out);
    if (lanes < 8) {
        va = hn::Load(d, a + lanes);
        vb = hn::Load(d, b + lanes);
        hn::Store(hn::Sub(va, vb), d, out + lanes);
    }
    if (lanes < 4) {
        va = hn::Load(d, a + 4);
        vb = hn::Load(d, b + 4);
        hn::Store(hn::Sub(va, vb), d, out + 4);
        va = hn::Load(d, a + 6);
        vb = hn::Load(d, b + 6);
        hn::Store(hn::Sub(va, vb), d, out + 6);
    }
}

extern "C" void hwy_sub_f64(const double *a, const double *b, double *out, const size_t count) {
    hn::ScalableTag<double> d;
    const size_t lanes = hn::Lanes(d);
    size_t i = 0;
    for(; i + lanes <= count; i += lanes) {
        auto va = hn::LoadU(d, a + i);
        auto vb = hn::LoadU(d, b + i);
        hn::StoreU(hn::Sub(va, vb), d, out + i);
    }
    for (; i < count; ++i) out[i] = a[i] + b[i];
}