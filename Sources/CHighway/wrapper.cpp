#include "wrapper.h"          // exposes the C API
#include "hwy/highway.h"      // internal; Swift never sees this


namespace hn = hwy::HWY_NAMESPACE;

// Float Add

extern "C" void hwy_add_f32x2(const float *a, const float *b, float *out) {
    hn::FixedTag<float, 2> d;
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Add(va, vb), d, out);
}
extern "C" void hwy_add_f32x3(const float *a, const float *b, float *out) {
    hn::FixedTag<float, 4> d;
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::StoreN(hn::Add(va, vb), d, out, 3);
}
extern "C" void hwy_add_f32x4(const float *a, const float *b, float *out) {
    hn::FixedTag<float, 4> d;
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Add(va, vb), d, out);
}

extern "C" void hwy_add_f32x8(const float *a, const float *b, float *out) {
    hn::CappedTag<float, 8> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Add(va, vb), d, out);
    if (lanes < 8) {
        va = hn::Load(d, a + lanes);
        vb = hn::Load(d, b + lanes);
        hn::Store(hn::Add(va, vb), d, out + lanes);
    }
}

extern "C" void hwy_add_f32x16(const float *a, const float *b, float *out) {
    hn::CappedTag<float, 16> d;
    const size_t lanes = hn::Lanes(d);
    auto va = hn::Load(d, a);
    auto vb = hn::Load(d, b);
    hn::Store(hn::Add(va, vb), d, out);
    if (lanes < 16) {
        va = hn::Load(d, a + lanes);
        vb = hn::Load(d, b + lanes);
        hn::Store(hn::Add(va, vb), d, out + lanes);
    }
    if (lanes < 8) {
        va = hn::Load(d, a + 8);
        vb = hn::Load(d, b + 8);
        hn::Store(hn::Add(va, vb), d, out + 8);
        va = hn::Load(d, a + 12);
        vb = hn::Load(d, b + 12);
        hn::Store(hn::Add(va, vb), d, out + 12);
    }
}

extern "C" void hwy_add_f32(const float *a, const float *b, float *out, const size_t count) {
    hn::ScalableTag<float> d;
    const size_t lanes = hn::Lanes(d);
    size_t i = 0;
    for(; i + lanes <= count; i += lanes) {
        auto va = hn::LoadU(d, a + i);
        auto vb = hn::LoadU(d, b + i);
        hn::StoreU(hn::Add(va, vb), d, out + i);
    }
    for (; i < count; ++i) out[i] = a[i] + b[i];
}

// Double Add

