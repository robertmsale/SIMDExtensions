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

void hwy_add_f64x2(const double *a,
                   const double *b,
                   double *out);

void hwy_add_f64x3(const double *a,
                   const double *b,
                   double *out);

void hwy_add_f64x4(const double *a,
                   const double *b,
                   double *out);

void hwy_add_f64x8(const double *a,
                   const double *b,
                   double *out);

void hwy_add_f64(const double *a,
                    const double *b,
                    double *out,
                    const size_t count);

#ifdef __cplusplus
} // extern "C"
#endif
