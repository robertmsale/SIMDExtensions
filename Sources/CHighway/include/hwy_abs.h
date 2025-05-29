#pragma once
#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

void hwy_abs_f32x2(const float *a,
                   float *out);

void hwy_abs_f32x3(const float *a,
                   float *out);

void hwy_abs_f32x4(const float *a,
                   float *out);

void hwy_abs_f32x8(const float *a,
                   float *out);

void hwy_abs_f32x16(const float *a,
                   float *out);

void hwy_abs_f32(const float *a,
                    float *out,
                    const size_t count);

void hwy_abs_f64x2(const double *a,
                   double *out);

void hwy_abs_f64x3(const double *a,
                   double *out);

void hwy_abs_f64x4(const double *a,
                   double *out);

void hwy_abs_f64x8(const double *a,
                   double *out);

void hwy_abs_f64(const double *a,
                    double *out,
                    const size_t count);

#ifdef __cplusplus
} // extern "C"
#endif
