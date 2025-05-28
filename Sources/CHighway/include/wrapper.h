#pragma once
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

void hwy_add_f32x2(const float *a,
                   const float *b,
                   float *out);

void hwy_add_f32x3(const float *a,
                   const float *b,
                   float *out);

void hwy_add_f32x4(const float *a,
                   const float *b,
                   float *out);

void hwy_add_f32x8(const float *a,
                   const float *b,
                   float *out);

void hwy_add_f32x16(const float *a,
                   const float *b,
                   float *out);

void hwy_add_f32(const float *a,
                    const float *b,
                    float *out,
                    const size_t count);

#ifdef __cplusplus
} // extern "C"
#endif