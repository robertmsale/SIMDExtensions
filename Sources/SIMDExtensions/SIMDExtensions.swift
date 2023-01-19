import simd
import Accelerate
import Foundation
extension SIMD2<Float> {
    /// Returns the distance between `self` and `to`
    public func distance(to: SIMD2<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    public func distanceFast(to: SIMD2<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    public func distancePrecise(to: SIMD2<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    public var length: Float { simd_length(self) }
    /// The vector where all fields are the absolute value
    public var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    public func clamp(min: SIMD2<Float>, max: SIMD2<Float>) -> SIMD2<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    public func clamp(min: Float, max: Float) -> SIMD2<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    public var fract: Self { simd_fract(self) }
    /// The sign of each element
    public var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    public var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    public var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    public var min: Float { simd_reduce_max(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD2<Float>, by alpha: SIMD2<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD2<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    public func smoothstep(with: SIMD2<Float>, by alpha: SIMD2<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    public var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    public var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    public var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    public var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    public var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    public var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    public var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    public var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    public var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    public var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    public var log1p: Self { simd.log1p(self) }
    /// Cross product of two vectors
    public func cross(with: Self) -> SIMD3<Float> { simd_cross(self, with) }
    /// Dot product of two vectors
    public func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    public var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    public var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    public var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    public func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    public func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    public func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    public func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    public func refract(on normal: Self, idx of: Float) -> Self { simd_refract(self, normal, of) }
    /// Length Squared of vector
    public var lengthSquared: Float { simd_length_squared(self) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    public var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    public var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    public var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    public var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    public var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    public var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    public var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    public var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    public var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    public var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    public var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    public func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    public func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    public var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    public var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    public var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    public var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    public var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    public var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    public var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    public var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    public var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    public var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    public var tanpi: Self { simd.tanpi(self) }
    public var asArray: [Float] {
        return [
            x,
            y,
        ]
    }
}
extension SIMD3<Float> {
    /// Returns the distance between `self` and `to`
    public func distance(to: SIMD3<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    public func distanceFast(to: SIMD3<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    public func distancePrecise(to: SIMD3<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    public var length: Float { simd_length(self) }
    /// The vector where all fields are the absolute value
    public var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    public func clamp(min: SIMD3<Float>, max: SIMD3<Float>) -> SIMD3<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    public func clamp(min: Float, max: Float) -> SIMD3<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    public var fract: Self { simd_fract(self) }
    /// The sign of each element
    public var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    public var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    public var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    public var min: Float { simd_reduce_max(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD3<Float>, by alpha: SIMD3<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD3<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    public func smoothstep(with: SIMD3<Float>, by alpha: SIMD3<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    public var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    public var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    public var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    public var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    public var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    public var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    public var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    public var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    public var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    public var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    public var log1p: Self { simd.log1p(self) }
    /// Cross product of two vectors
    public func cross(with: Self) -> SIMD3<Float> { simd_cross(self, with) }
    /// Dot product of two vectors
    public func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    public var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    public var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    public var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    public func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    public func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    public func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    public func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    public func refract(on normal: Self, idx of: Float) -> Self { simd_refract(self, normal, of) }
    /// Length Squared of vector
    public var lengthSquared: Float { simd_length_squared(self) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    public var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    public var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    public var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    public var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    public var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    public var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    public var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    public var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    public var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    public var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    public var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    public func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    public func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    public var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    public var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    public var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    public var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    public var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    public var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    public var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    public var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    public var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    public var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    public var tanpi: Self { simd.tanpi(self) }
    public var asArray: [Float] {
        return [
            x,
            y,
            z,
        ]
    }
}
extension SIMD4<Float> {
    /// Returns the distance between `self` and `to`
    public func distance(to: SIMD4<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    public func distanceFast(to: SIMD4<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    public func distancePrecise(to: SIMD4<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    public var length: Float { simd_length(self) }
    /// The vector where all fields are the absolute value
    public var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    public func clamp(min: SIMD4<Float>, max: SIMD4<Float>) -> SIMD4<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    public func clamp(min: Float, max: Float) -> SIMD4<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    public var fract: Self { simd_fract(self) }
    /// The sign of each element
    public var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    public var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    public var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    public var min: Float { simd_reduce_max(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD4<Float>, by alpha: SIMD4<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD4<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    public func smoothstep(with: SIMD4<Float>, by alpha: SIMD4<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    public var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    public var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    public var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    public var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    public var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    public var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    public var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    public var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    public var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    public var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    public var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    public func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    public var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    public var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    public var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    public func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    public func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    public func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    public func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    public func refract(on normal: Self, idx of: Float) -> Self { simd_refract(self, normal, of) }
    /// Length Squared of vector
    public var lengthSquared: Float { simd_length_squared(self) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    public var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    public var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    public var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    public var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    public var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    public var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    public var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    public var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    public var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    public var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    public var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    public func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    public func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    public var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    public var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    public var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    public var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    public var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    public var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    public var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    public var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    public var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    public var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    public var tanpi: Self { simd.tanpi(self) }
    public var asArray: [Float] {
        return [
            x,
            y,
            z,
            w,
        ]
    }
    public init(axis: SIMD3<Float>, rad: Float) {
        let halfAngle = rad / 2
        let s = Foundation.sin( halfAngle )
        self.init(axis.x * s, axis.y * s, axis.z * s, Foundation.cos( halfAngle ))
    }
    public init(euler: SIMD3<Float>, order: EulerOrder) {
        let c1 = Foundation.cos( euler.x / 2 )
        let c2 = Foundation.cos( euler.y / 2 )
        let c3 = Foundation.cos( euler.z / 2 )
        let s1 = Foundation.sin( euler.x / 2 )
        let s2 = Foundation.sin( euler.y / 2 )
        let s3 = Foundation.sin( euler.z / 2 )
        switch order {
        case .XYZ: self.init(
            s1 * c2 * c3 + c1 * s2 * s3,
            c1 * s2 * c3 - s1 * c2 * s3,
            c1 * c2 * s3 + s1 * s2 * c3,
            c1 * c2 * c3 - s1 * s2 * s3
            )
        case .YXZ: self.init(
            s1 * c2 * c3 + c1 * s2 * s3,
            c1 * s2 * c3 - s1 * c2 * s3,
            c1 * c2 * s3 - s1 * s2 * c3,
            c1 * c2 * c3 + s1 * s2 * s3
            )
        case .ZXY: self.init(
            s1 * c2 * c3 - c1 * s2 * s3,
            c1 * s2 * c3 + s1 * c2 * s3,
            c1 * c2 * s3 + s1 * s2 * c3,
            c1 * c2 * c3 - s1 * s2 * s3
            )
        case .ZYX: self.init(
            s1 * c2 * c3 - c1 * s2 * s3,
            c1 * s2 * c3 + s1 * c2 * s3,
            c1 * c2 * s3 - s1 * s2 * c3,
            c1 * c2 * c3 + s1 * s2 * s3
            )
        case .YZX: self.init(
            s1 * c2 * c3 + c1 * s2 * s3,
            c1 * s2 * c3 + s1 * c2 * s3,
            c1 * c2 * s3 - s1 * s2 * c3,
            c1 * c2 * c3 - s1 * s2 * s3
            )
        case .XZY: self.init(
            s1 * c2 * c3 - c1 * s2 * s3,
            c1 * s2 * c3 - s1 * c2 * s3,
            c1 * c2 * s3 + s1 * s2 * c3,
            c1 * c2 * c3 + s1 * s2 * s3
            )
        }
    }
    public init(matrix: simd_float3x3) {
        let m11 = matrix.columns.0.x
        let m12 = matrix.columns.0.y
        let m13 = matrix.columns.0.z
        let m21 = matrix.columns.1.x
        let m22 = matrix.columns.1.y
        let m23 = matrix.columns.1.z
        let m31 = matrix.columns.2.x
        let m32 = matrix.columns.2.y
        let m33 = matrix.columns.2.z
        let trace = m11 + m22 + m33
        if trace > 0 {
            let s = Float(0.5) / Foundation.sqrt(trace + Float(1.0))
            self.init( (m32 - m23) * s, (m13 - m31) * s, (m21 - m12) * s, Float(0.25) / s )
        } else if m11 > m22 && m11 > m33 {
            let s = Float(2.0) * Foundation.sqrt( Float(1.0) + m11 - m22 - m33)
            self.init( Float(0.25) * s, (m12 + m21) / s, (m13 + m31) / s, (m32 - m23) / s )
        } else if m22 > m33 {
            let s = Float(2.0) * Foundation.sqrt( Float(1.0) + m22 - m11 - m33)
            self.init( (m12 + m21) / s, Float(0.25) * s, (m32 + m23) / s, (m13 - m31) / s )
        } else {
            let s = Float(2.0) * Foundation.sqrt( Float(1.0) + m33 - m11 - m22)
            self.init( (m13 + m31) / s, (m32 + m23) / s, Float(0.25) * s, (m12 - m21) / s )
        }
    }
    public init(from: SIMD3<Float>, to: SIMD3<Float>) {
        var r = from.dot(with: to) + 1
        if r < Float.ulpOfOne {
            r = 0
            if (Swift.abs(from.x) > Swift.abs(from.z)) {
                self.init(-from.y, from.x, 0, r)
            } else {
                self.init(0, -from.z, from.y, r)
            }
        } else {
            self.init(from.y * to.z - from.z * to.y, from.z * to.x - from.x * to.z, from.x * to.y - from.y * to.x, r)
        }
        self = normalized
    }
    public func angle(to: Self) -> Float {
        2 * Foundation.acos(Swift.abs((self.dot(with: to)).clamp(-1, 1)))
    }
    public func rotate(towards: Self, step: Float) -> Self {
        let ang = angle(to: towards)
        if (ang == 0) {return self}
        let t = Swift.min(1, step / ang)
        return slerp( quat: towards, t: t )
    }
    public func slerp(quat: Self, t: Float) -> Self {
        if t == 0 {return self}
        if t == 1 {return quat}
        var cosHalfTheta = w * quat.w + x * quat.x + y * quat.y + z * quat.z
        var rv = quat
        if cosHalfTheta < 0 {
            cosHalfTheta = -cosHalfTheta
            rv = quat * -Float(1.0)
        }
        if cosHalfTheta >= 1.0 {
           return self
        }
        let sqrSinHalfTheta = Float(1.0) - cosHalfTheta * cosHalfTheta
        if sqrSinHalfTheta <= Float.ulpOfOne {
            let s = 1 - t
            rv.w = s * w + t * rv.w
            rv.x = s * x + t * rv.x
            rv.y = s * y + t * rv.y
            rv.z = s * z + t * rv.z
            rv = rv.normalized
            return rv
        }
        let sinHalfTheta = Foundation.sqrt( sqrSinHalfTheta )
        let halfTheta = Foundation.atan2( sinHalfTheta, cosHalfTheta )
        let ratioA = Foundation.sin( (1 - t) * halfTheta ) / sinHalfTheta
        let ratioB = Foundation.sin( t * halfTheta ) / sinHalfTheta
        return (self * ratioA + rv * ratioB)
    }
    public var invert: Self { Self(-x, -y, -z, w) }
    public func multiply(by: Self) -> Self {
        let v1 = Self(repeating: by.w)
        let v2 = Self(self.w, self.w, self.w, -self.x)
        let v3 = Self(by.x, by.y, by.z, by.x)
        let v4 = Self(self.y, self.z, self.x, -self.y)
        let v5 = Self(by.z, by.x, by.y, by.y)
        let v6 = -Self(self.z, self.x, self.y, self.z)
        let v7 = Self(by.y, by.z, by.x, by.z)
        return self * v1 + v2 * v3 + v4 * v5 + v6 * v7
    }
}
extension SIMD8<Float> {
    /// Returns the distance between `self` and `to`
    public func distance(to: SIMD8<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    public func distanceFast(to: SIMD8<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    public func distancePrecise(to: SIMD8<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    public var length: Float { simd_length(self) }
    /// The vector where all fields are the absolute value
    public var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    public func clamp(min: SIMD8<Float>, max: SIMD8<Float>) -> SIMD8<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    public func clamp(min: Float, max: Float) -> SIMD8<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    public var fract: Self { simd_fract(self) }
    /// The sign of each element
    public var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    public var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    public var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    public var min: Float { simd_reduce_max(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD8<Float>, by alpha: SIMD8<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD8<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    public func smoothstep(with: SIMD8<Float>, by alpha: SIMD8<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    public var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    public var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    public var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    public var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    public var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    public var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    public var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    public var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    public var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    public var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    public var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    public func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    public var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    public var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    public var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    public func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    public func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    public func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    /// Length Squared of vector
    public var lengthSquared: Float { simd_length_squared(self) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    public var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    public var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    public var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    public var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    public var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    public var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    public var cbrt: Self { simd.cbrt(self) }
    /// Error function of each element
    @available(iOS 15, *)
    public var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    public var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    public func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    public func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    public var rounded: Self { simd.round(self) }
    @available(iOS 15, *)
    public var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    public var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    public var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    public var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    public var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    public var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    public var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    public var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    public var tanpi: Self { simd.tanpi(self) }
    public var asArray: [Float] {
        return [
            lowHalf.x,
            lowHalf.y,
            lowHalf.z,
            lowHalf.w,
            highHalf.x,
            highHalf.y,
            highHalf.z,
            highHalf.w,
        ]
    }
}
extension SIMD16<Float> {
    /// Returns the distance between `self` and `to`
    public func distance(to: SIMD16<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    public func distanceFast(to: SIMD16<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    public func distancePrecise(to: SIMD16<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    public var length: Float { simd_length(self) }
    /// The vector where all fields are the absolute value
    public var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    public func clamp(min: SIMD16<Float>, max: SIMD16<Float>) -> SIMD16<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    public func clamp(min: Float, max: Float) -> SIMD16<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    public var fract: Self { simd_fract(self) }
    /// The sign of each element
    public var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    public var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    public var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    public var min: Float { simd_reduce_max(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD16<Float>, by alpha: SIMD16<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD16<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    public func smoothstep(with: SIMD16<Float>, by alpha: SIMD16<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    public var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    public var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    public var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    public var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    public var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    public var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    public var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    public var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    public var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    public var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    public var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    public func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    public var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    public var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    public var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    public func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    public func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    public func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    /// Length Squared of vector
    public var lengthSquared: Float { simd_length_squared(self) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    public var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    public var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    public var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    public var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    public var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    public var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    public var cbrt: Self { simd.cbrt(self) }
    /// Error function of each element
    @available(iOS 15, *)
    public var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    public var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    public func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    public func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    public var rounded: Self { simd.round(self) }
    @available(iOS 15, *)
    public var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    public var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    public var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    public var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    public var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    public var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    public var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    public var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    public var tanpi: Self { simd.tanpi(self) }
    public var asArray: [Float] {
        return [
            lowHalf.lowHalf.x,
            lowHalf.lowHalf.y,
            lowHalf.lowHalf.z,
            lowHalf.lowHalf.w,
            lowHalf.highHalf.x,
            lowHalf.highHalf.y,
            lowHalf.highHalf.z,
            lowHalf.highHalf.w,
            highHalf.lowHalf.x,
            highHalf.lowHalf.y,
            highHalf.lowHalf.z,
            highHalf.lowHalf.w,
            highHalf.highHalf.x,
            highHalf.highHalf.y,
            highHalf.highHalf.z,
            highHalf.highHalf.w,
        ]
    }
}
extension SIMD2<Double> {
    /// Returns the distance between `self` and `to`
    public func distance(to: SIMD2<Double>) -> Double {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    public func distanceFast(to: SIMD2<Double>) -> Double {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    public func distancePrecise(to: SIMD2<Double>) -> Double {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    public var length: Double { simd_length(self) }
    /// The vector where all fields are the absolute value
    public var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    public func clamp(min: SIMD2<Double>, max: SIMD2<Double>) -> SIMD2<Double> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    public func clamp(min: Double, max: Double) -> SIMD2<Double> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    public var fract: Self { simd_fract(self) }
    /// The sign of each element
    public var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    public var reduceAdd: Double { simd_reduce_add(self) }
    /// The max of all elements in the vector
    public var max: Double { simd_reduce_max(self) }
    /// The min of all elements in the vector
    public var min: Double { simd_reduce_max(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD2<Double>, by alpha: SIMD2<Double>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD2<Double>, by alpha: Double) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    public func smoothstep(with: SIMD2<Double>, by alpha: SIMD2<Double>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    public var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    public var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    public var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    public var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    public var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    public var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    public var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    public var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    public var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    public var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    public var log1p: Self { simd.log1p(self) }
    /// Cross product of two vectors
    public func cross(with: Self) -> SIMD3<Double> { simd_cross(self, with) }
    /// Dot product of two vectors
    public func dot(with: Self) -> Double { simd_dot(self, with) }
    /// Normalized vector
    public var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    public var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    public var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    public func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    public func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    public func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    public func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    public func refract(on normal: Self, idx of: Double) -> Self { simd_refract(self, normal, of) }
    /// Length Squared of vector
    public var lengthSquared: Double { simd_length_squared(self) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    public var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    public var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    public var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    public var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    public var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    public var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    public var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    public var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    public var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    public var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    public var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    public func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    public func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    public var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    public var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    public var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    public var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    public var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    public var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    public var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    public var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    public var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    public var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    public var tanpi: Self { simd.tanpi(self) }
    public var asArray: [Double] {
        return [
            x,
            y,
        ]
    }
}
extension SIMD3<Double> {
    /// Returns the distance between `self` and `to`
    public func distance(to: SIMD3<Double>) -> Double {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    public func distanceFast(to: SIMD3<Double>) -> Double {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    public func distancePrecise(to: SIMD3<Double>) -> Double {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    public var length: Double { simd_length(self) }
    /// The vector where all fields are the absolute value
    public var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    public func clamp(min: SIMD3<Double>, max: SIMD3<Double>) -> SIMD3<Double> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    public func clamp(min: Double, max: Double) -> SIMD3<Double> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    public var fract: Self { simd_fract(self) }
    /// The sign of each element
    public var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    public var reduceAdd: Double { simd_reduce_add(self) }
    /// The max of all elements in the vector
    public var max: Double { simd_reduce_max(self) }
    /// The min of all elements in the vector
    public var min: Double { simd_reduce_max(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD3<Double>, by alpha: SIMD3<Double>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD3<Double>, by alpha: Double) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    public func smoothstep(with: SIMD3<Double>, by alpha: SIMD3<Double>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    public var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    public var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    public var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    public var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    public var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    public var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    public var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    public var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    public var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    public var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    public var log1p: Self { simd.log1p(self) }
    /// Cross product of two vectors
    public func cross(with: Self) -> SIMD3<Double> { simd_cross(self, with) }
    /// Dot product of two vectors
    public func dot(with: Self) -> Double { simd_dot(self, with) }
    /// Normalized vector
    public var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    public var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    public var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    public func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    public func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    public func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    public func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    public func refract(on normal: Self, idx of: Double) -> Self { simd_refract(self, normal, of) }
    /// Length Squared of vector
    public var lengthSquared: Double { simd_length_squared(self) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    public var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    public var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    public var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    public var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    public var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    public var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    public var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    public var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    public var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    public var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    public var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    public func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    public func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    public var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    public var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    public var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    public var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    public var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    public var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    public var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    public var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    public var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    public var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    public var tanpi: Self { simd.tanpi(self) }
    public var asArray: [Double] {
        return [
            x,
            y,
            z,
        ]
    }
}
extension SIMD4<Double> {
    /// Returns the distance between `self` and `to`
    public func distance(to: SIMD4<Double>) -> Double {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    public func distanceFast(to: SIMD4<Double>) -> Double {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    public func distancePrecise(to: SIMD4<Double>) -> Double {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    public var length: Double { simd_length(self) }
    /// The vector where all fields are the absolute value
    public var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    public func clamp(min: SIMD4<Double>, max: SIMD4<Double>) -> SIMD4<Double> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    public func clamp(min: Double, max: Double) -> SIMD4<Double> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    public var fract: Self { simd_fract(self) }
    /// The sign of each element
    public var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    public var reduceAdd: Double { simd_reduce_add(self) }
    /// The max of all elements in the vector
    public var max: Double { simd_reduce_max(self) }
    /// The min of all elements in the vector
    public var min: Double { simd_reduce_max(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD4<Double>, by alpha: SIMD4<Double>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD4<Double>, by alpha: Double) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    public func smoothstep(with: SIMD4<Double>, by alpha: SIMD4<Double>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    public var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    public var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    public var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    public var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    public var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    public var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    public var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    public var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    public var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    public var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    public var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    public func dot(with: Self) -> Double { simd_dot(self, with) }
    /// Normalized vector
    public var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    public var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    public var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    public func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    public func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    public func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    public func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    public func refract(on normal: Self, idx of: Double) -> Self { simd_refract(self, normal, of) }
    /// Length Squared of vector
    public var lengthSquared: Double { simd_length_squared(self) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    public var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    public var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    public var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    public var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    public var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    public var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    public var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    public var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    public var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    public var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    public var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    public func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    public func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    public var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    public var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    public var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    public var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    public var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    public var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    public var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    public var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    public var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    public var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    public var tanpi: Self { simd.tanpi(self) }
    public var asArray: [Double] {
        return [
            x,
            y,
            z,
            w,
        ]
    }
    public init(axis: SIMD3<Double>, rad: Double) {
        let halfAngle = rad / 2
        let s = Foundation.sin( halfAngle )
        self.init(axis.x * s, axis.y * s, axis.z * s, Foundation.cos( halfAngle ))
    }
    public init(euler: SIMD3<Double>, order: EulerOrder) {
        let c1 = Foundation.cos( euler.x / 2 )
        let c2 = Foundation.cos( euler.y / 2 )
        let c3 = Foundation.cos( euler.z / 2 )
        let s1 = Foundation.sin( euler.x / 2 )
        let s2 = Foundation.sin( euler.y / 2 )
        let s3 = Foundation.sin( euler.z / 2 )
        switch order {
        case .XYZ: self.init(
            s1 * c2 * c3 + c1 * s2 * s3,
            c1 * s2 * c3 - s1 * c2 * s3,
            c1 * c2 * s3 + s1 * s2 * c3,
            c1 * c2 * c3 - s1 * s2 * s3
            )
        case .YXZ: self.init(
            s1 * c2 * c3 + c1 * s2 * s3,
            c1 * s2 * c3 - s1 * c2 * s3,
            c1 * c2 * s3 - s1 * s2 * c3,
            c1 * c2 * c3 + s1 * s2 * s3
            )
        case .ZXY: self.init(
            s1 * c2 * c3 - c1 * s2 * s3,
            c1 * s2 * c3 + s1 * c2 * s3,
            c1 * c2 * s3 + s1 * s2 * c3,
            c1 * c2 * c3 - s1 * s2 * s3
            )
        case .ZYX: self.init(
            s1 * c2 * c3 - c1 * s2 * s3,
            c1 * s2 * c3 + s1 * c2 * s3,
            c1 * c2 * s3 - s1 * s2 * c3,
            c1 * c2 * c3 + s1 * s2 * s3
            )
        case .YZX: self.init(
            s1 * c2 * c3 + c1 * s2 * s3,
            c1 * s2 * c3 + s1 * c2 * s3,
            c1 * c2 * s3 - s1 * s2 * c3,
            c1 * c2 * c3 - s1 * s2 * s3
            )
        case .XZY: self.init(
            s1 * c2 * c3 - c1 * s2 * s3,
            c1 * s2 * c3 - s1 * c2 * s3,
            c1 * c2 * s3 + s1 * s2 * c3,
            c1 * c2 * c3 + s1 * s2 * s3
            )
        }
    }
    public init(matrix: simd_double3x3) {
        let m11 = matrix.columns.0.x
        let m12 = matrix.columns.0.y
        let m13 = matrix.columns.0.z
        let m21 = matrix.columns.1.x
        let m22 = matrix.columns.1.y
        let m23 = matrix.columns.1.z
        let m31 = matrix.columns.2.x
        let m32 = matrix.columns.2.y
        let m33 = matrix.columns.2.z
        let trace = m11 + m22 + m33
        if trace > 0 {
            let s = Double(0.5) / Foundation.sqrt(trace + Double(1.0))
            self.init( (m32 - m23) * s, (m13 - m31) * s, (m21 - m12) * s, Double(0.25) / s )
        } else if m11 > m22 && m11 > m33 {
            let s = Double(2.0) * Foundation.sqrt( Double(1.0) + m11 - m22 - m33)
            self.init( Double(0.25) * s, (m12 + m21) / s, (m13 + m31) / s, (m32 - m23) / s )
        } else if m22 > m33 {
            let s = Double(2.0) * Foundation.sqrt( Double(1.0) + m22 - m11 - m33)
            self.init( (m12 + m21) / s, Double(0.25) * s, (m32 + m23) / s, (m13 - m31) / s )
        } else {
            let s = Double(2.0) * Foundation.sqrt( Double(1.0) + m33 - m11 - m22)
            self.init( (m13 + m31) / s, (m32 + m23) / s, Double(0.25) * s, (m12 - m21) / s )
        }
    }
    public init(from: SIMD3<Double>, to: SIMD3<Double>) {
        var r = from.dot(with: to) + 1
        if r < Double.ulpOfOne {
            r = 0
            if (Swift.abs(from.x) > Swift.abs(from.z)) {
                self.init(-from.y, from.x, 0, r)
            } else {
                self.init(0, -from.z, from.y, r)
            }
        } else {
            self.init(from.y * to.z - from.z * to.y, from.z * to.x - from.x * to.z, from.x * to.y - from.y * to.x, r)
        }
        self = normalized
    }
    public func angle(to: Self) -> Double {
        2 * Foundation.acos(Swift.abs((self.dot(with: to)).clamp(-1, 1)))
    }
    public func rotate(towards: Self, step: Double) -> Self {
        let ang = angle(to: towards)
        if (ang == 0) {return self}
        let t = Swift.min(1, step / ang)
        return slerp( quat: towards, t: t )
    }
    public func slerp(quat: Self, t: Double) -> Self {
        if t == 0 {return self}
        if t == 1 {return quat}
        var cosHalfTheta = w * quat.w + x * quat.x + y * quat.y + z * quat.z
        var rv = quat
        if cosHalfTheta < 0 {
            cosHalfTheta = -cosHalfTheta
            rv = quat * -Double(1.0)
        }
        if cosHalfTheta >= 1.0 {
           return self
        }
        let sqrSinHalfTheta = Double(1.0) - cosHalfTheta * cosHalfTheta
        if sqrSinHalfTheta <= Double.ulpOfOne {
            let s = 1 - t
            rv.w = s * w + t * rv.w
            rv.x = s * x + t * rv.x
            rv.y = s * y + t * rv.y
            rv.z = s * z + t * rv.z
            rv = rv.normalized
            return rv
        }
        let sinHalfTheta = Foundation.sqrt( sqrSinHalfTheta )
        let halfTheta = Foundation.atan2( sinHalfTheta, cosHalfTheta )
        let ratioA = Foundation.sin( (1 - t) * halfTheta ) / sinHalfTheta
        let ratioB = Foundation.sin( t * halfTheta ) / sinHalfTheta
        return (self * ratioA + rv * ratioB)
    }
    public var invert: Self { Self(-x, -y, -z, w) }
    public func multiply(by: Self) -> Self {
        let v1 = Self(repeating: by.w)
        let v2 = Self(self.w, self.w, self.w, -self.x)
        let v3 = Self(by.x, by.y, by.z, by.x)
        let v4 = Self(self.y, self.z, self.x, -self.y)
        let v5 = Self(by.z, by.x, by.y, by.y)
        let v6 = -Self(self.z, self.x, self.y, self.z)
        let v7 = Self(by.y, by.z, by.x, by.z)
        return self * v1 + v2 * v3 + v4 * v5 + v6 * v7
    }
}
extension SIMD8<Double> {
    /// Returns the distance between `self` and `to`
    public func distance(to: SIMD8<Double>) -> Double {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    public func distanceFast(to: SIMD8<Double>) -> Double {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    public func distancePrecise(to: SIMD8<Double>) -> Double {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    public var length: Double { simd_length(self) }
    /// The vector where all fields are the absolute value
    public var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    public func clamp(min: SIMD8<Double>, max: SIMD8<Double>) -> SIMD8<Double> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    public func clamp(min: Double, max: Double) -> SIMD8<Double> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    public var fract: Self { simd_fract(self) }
    /// The sign of each element
    public var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    public var reduceAdd: Double { simd_reduce_add(self) }
    /// The max of all elements in the vector
    public var max: Double { simd_reduce_max(self) }
    /// The min of all elements in the vector
    public var min: Double { simd_reduce_max(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD8<Double>, by alpha: SIMD8<Double>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    public func lerp(with: SIMD8<Double>, by alpha: Double) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    public func smoothstep(with: SIMD8<Double>, by alpha: SIMD8<Double>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    public var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    public var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    public var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    public var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    public var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    public var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    public var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    public var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    public var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    public var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    public var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    public var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    public func dot(with: Self) -> Double { simd_dot(self, with) }
    /// Normalized vector
    public var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    public var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    public var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    public func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    public func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    public func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    /// Length Squared of vector
    public var lengthSquared: Double { simd_length_squared(self) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    public var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    public var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    public var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    public var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    public var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    public var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    public var cbrt: Self { simd.cbrt(self) }
    /// Error function of each element
    @available(iOS 15, *)
    public var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    public var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    public func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    public func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    public var rounded: Self { simd.round(self) }
    @available(iOS 15, *)
    public var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    public var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    public var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    public var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    public var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    public var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    public var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    public var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    public var tanpi: Self { simd.tanpi(self) }
    public var asArray: [Double] {
        return [
            lowHalf.x,
            lowHalf.y,
            lowHalf.z,
            lowHalf.w,
            highHalf.x,
            highHalf.y,
            highHalf.z,
            highHalf.w,
        ]
    }
}
