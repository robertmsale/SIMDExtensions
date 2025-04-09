import simd
import Accelerate
import Foundation
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(SceneKit)
import SceneKit
#endif
public extension SIMD2<Float> {
    /// Returns the distance between `self` and `to`
    @inlinable func distance(to: SIMD2<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    @inlinable func distanceFast(to: SIMD2<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    @inlinable func distancePrecise(to: SIMD2<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    @inlinable var length: Float { simd_length(self) }
    /// the length squared of `self`
    @inlinable var lengthSquared: Float { simd_length_squared(self) }
    /// The vector where all fields are the absolute value
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    @inlinable func clamp(min: SIMD2<Float>, max: SIMD2<Float>) -> SIMD2<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    @inlinable func clamp(min: Float, max: Float) -> SIMD2<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    @inlinable var fract: Self { simd_fract(self) }
    /// The sign of each element
    @inlinable var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    @inlinable var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    @inlinable var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    @inlinable var min: Float { simd_reduce_min(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD2<Float>, by alpha: SIMD2<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD2<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    @inlinable func smoothstep(with: SIMD2<Float>, by alpha: SIMD2<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    @inlinable var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    @inlinable var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    @inlinable var log1p: Self { simd.log1p(self) }
    /// Cross product of two vectors
    @inlinable func cross(with: Self) -> SIMD3<Float> { simd_cross(self, with) }
    /// Dot product of two vectors
    @inlinable func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    @inlinable func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    @inlinable func refract(on normal: Self, idx of: Float) -> Self { simd_refract(self, normal, of) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    @inlinable var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    @inlinable var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    @inlinable var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    @inlinable func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    @inlinable func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    @inlinable var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    @inlinable var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    @inlinable var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    @inlinable var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    @inlinable var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    @inlinable var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    @inlinable var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    @inlinable var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    @inlinable var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    @inlinable var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    @inlinable var tanpi: Self { simd.tanpi(self) }
    /// Setting this computed property is safe from crashes
    @inlinable var asArray: [Float] {
        get {[
            x,
            y,
        ]} set(v) {
            if v.count == 0 { return }
            let sm1 = v.count - 1
            x = v[0]; if sm1 == 0 { return }
            y = v[1]; if sm1 == 1 { return }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Manhattan distance of `self` to `to`
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    @inlinable init(array: [Float]) {
        self.init()
        asArray = array
    }
    @inlinable func rotate(around center: Self, angle: Float) -> Self {
        let c = Foundation.cos(angle)
        let s = Foundation.sin(angle)
        let xy = self - center
        let v1 = Self(xy.x, xy.x)
        let v2 = Self(c, s)
        let v3 = Self(-xy.y, xy.y)
        let v4 = Self(s, c)
        return v1 * v2 + v3 * v4 + center
    }
#if canImport(CoreGraphics)
    @inlinable var asCGPoint: CGPoint { CGPoint(x: CGFloat(x), y: CGFloat(y)) }
    @inlinable var asCGSize: CGSize { CGSize(width: CGFloat(x), height: CGFloat(y)) }
#endif
}
public extension SIMD3<Float> {
    /// Returns the distance between `self` and `to`
    @inlinable func distance(to: SIMD3<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    @inlinable func distanceFast(to: SIMD3<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    @inlinable func distancePrecise(to: SIMD3<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    @inlinable var length: Float { simd_length(self) }
    /// the length squared of `self`
    @inlinable var lengthSquared: Float { simd_length_squared(self) }
    /// The vector where all fields are the absolute value
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    @inlinable func clamp(min: SIMD3<Float>, max: SIMD3<Float>) -> SIMD3<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    @inlinable func clamp(min: Float, max: Float) -> SIMD3<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    @inlinable var fract: Self { simd_fract(self) }
    /// The sign of each element
    @inlinable var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    @inlinable var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    @inlinable var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    @inlinable var min: Float { simd_reduce_min(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD3<Float>, by alpha: SIMD3<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD3<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    @inlinable func smoothstep(with: SIMD3<Float>, by alpha: SIMD3<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    @inlinable var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    @inlinable var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    @inlinable var log1p: Self { simd.log1p(self) }
    /// Cross product of two vectors
    @inlinable func cross(with: Self) -> SIMD3<Float> { simd_cross(self, with) }
    /// Dot product of two vectors
    @inlinable func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    @inlinable func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    @inlinable func refract(on normal: Self, idx of: Float) -> Self { simd_refract(self, normal, of) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    @inlinable var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    @inlinable var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    @inlinable var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    @inlinable func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    @inlinable func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    @inlinable var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    @inlinable var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    @inlinable var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    @inlinable var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    @inlinable var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    @inlinable var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    @inlinable var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    @inlinable var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    @inlinable var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    @inlinable var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    @inlinable var tanpi: Self { simd.tanpi(self) }
    /// Setting this computed property is safe from crashes
    @inlinable var asArray: [Float] {
        get {[
            x,
            y,
            z,
        ]} set(v) {
            if v.count == 0 { return }
            let sm1 = v.count - 1
            x = v[0]; if sm1 == 0 { return }
            y = v[1]; if sm1 == 1 { return }
            z = v[2]; if sm1 == 2 { return }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Manhattan distance of `self` to `to`
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    @inlinable init(array: [Float]) {
        self.init()
        asArray = array
    }
    @inlinable func project(vec on: Self) -> Self {
        let denom = self.lengthSquared
        if denom == 0 { return Self() }
        let scalar = on.dot(with: self) / denom
        return on * scalar
    }
#if canImport(SwiftUI)
    @available(iOS 13, *)
    @inlinable var asColor: Color {
        let norm = normalized
        return Color(red: Double(norm.x), green: Double(norm.y), blue: Double(norm.z))
    }
#endif
#if canImport(CoreGraphics)
    @inlinable var asUIColor: UIColor {
        let norm = normalized
        return UIColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: 1.0)
    }
    @available(iOS 13, *)
    @inlinable var asCGColor: CGColor {
        let norm = normalized
        return CGColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: 1.0)
    }
#endif
#if canImport(SceneKit)
    @inlinable var asSCNV3: SCNVector3 {
        SCNVector3(Float(x), Float(y), Float(z))
    }
#endif
}
public extension SIMD4<Float> {
    /// Returns the distance between `self` and `to`
    @inlinable func distance(to: SIMD4<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    @inlinable func distanceFast(to: SIMD4<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    @inlinable func distancePrecise(to: SIMD4<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    @inlinable var length: Float { simd_length(self) }
    /// the length squared of `self`
    @inlinable var lengthSquared: Float { simd_length_squared(self) }
    /// The vector where all fields are the absolute value
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    @inlinable func clamp(min: SIMD4<Float>, max: SIMD4<Float>) -> SIMD4<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    @inlinable func clamp(min: Float, max: Float) -> SIMD4<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    @inlinable var fract: Self { simd_fract(self) }
    /// The sign of each element
    @inlinable var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    @inlinable var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    @inlinable var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    @inlinable var min: Float { simd_reduce_min(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD4<Float>, by alpha: SIMD4<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD4<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    @inlinable func smoothstep(with: SIMD4<Float>, by alpha: SIMD4<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    @inlinable var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    @inlinable var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    @inlinable var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    @inlinable func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    @inlinable func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    @inlinable func refract(on normal: Self, idx of: Float) -> Self { simd_refract(self, normal, of) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    @inlinable var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    @inlinable var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    @inlinable var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    @inlinable func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    @inlinable func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    @inlinable var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    @inlinable var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    @inlinable var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    @inlinable var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    @inlinable var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    @inlinable var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    @inlinable var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    @inlinable var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    @inlinable var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    @inlinable var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    @inlinable var tanpi: Self { simd.tanpi(self) }
    /// Setting this computed property is safe from crashes
    @inlinable var asArray: [Float] {
        get {[
            x,
            y,
            z,
            w,
        ]} set(v) {
            if v.count == 0 { return }
            let sm1 = v.count - 1
            x = v[0]; if sm1 == 0 { return }
            y = v[1]; if sm1 == 1 { return }
            z = v[2]; if sm1 == 2 { return }
            w = v[3]; if sm1 == 3 { return }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Manhattan distance of `self` to `to`
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    @inlinable init(array: [Float]) {
        self.init()
        asArray = array
    }
    init(axis: SIMD3<Float>, rad: Float) {
        let halfAngle = rad / 2
        let s = Foundation.sin( halfAngle )
        self.init(axis.x * s, axis.y * s, axis.z * s, Foundation.cos( halfAngle ))
    }
    init(euler: SIMD3<Float>, order: EulerOrder) {
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
    init(matrix: simd_float3x3) {
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
    /// Initialize from Unit Vectors
    init(from: SIMD3<Float>, to: SIMD3<Float>) {
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
    @inlinable func angle(to: Self) -> Float {
        2 * Foundation.acos(Swift.abs((self.dot(with: to)).clamp(-1, 1)))
    }
    @inlinable func rotate(towards: Self, step: Float) -> Self {
        let ang = angle(to: towards)
        if (ang == 0) {return self}
        let t = Swift.min(1, step / ang)
        return slerp( quat: towards, t: t )
    }
    func slerp(quat: Self, t: Float) -> Self {
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
    @inlinable var invert: Self { Self(-x, -y, -z, w) }
    func multiply(by: Self) -> Self {
        let v1 = Self(repeating: by.w)
        let v2 = Self(self.w, self.w, self.w, -self.x)
        let v3 = Self(by.x, by.y, by.z, by.x)
        let v4 = Self(self.y, self.z, self.x, -self.y)
        let v5 = Self(by.z, by.x, by.y, by.y)
        let v6 = -Self(self.z, self.x, self.y, self.z)
        let v7 = Self(by.y, by.z, by.x, by.z)
        return self * v1 + v2 * v3 + v4 * v5 + v6 * v7
    }
    @inlinable func preMultiply(by: Self) -> Self {
        return by.multiply(by: self)
    }
#if canImport(SwiftUI)
    @available(iOS 13, *)
    @inlinable var asColor: Color {
        let norm = normalized
        return Color(red: Double(norm.x), green: Double(norm.y), blue: Double(norm.z), opacity: Double(norm.w))
    }
#endif
#if canImport(CoreGraphics)
    @inlinable var asUIColor: UIColor {
        let norm = normalized
        return UIColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: CGFloat(norm.w))
    }
    @available(iOS 13, *)
    @inlinable var asCGColor: CGColor {
        let norm = normalized
        return CGColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: CGFloat(norm.w))
    }
#endif
}
public extension SIMD8<Float> {
    /// Returns the distance between `self` and `to`
    @inlinable func distance(to: SIMD8<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    @inlinable func distanceFast(to: SIMD8<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    @inlinable func distancePrecise(to: SIMD8<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    @inlinable var length: Float { simd_length(self) }
    /// the length squared of `self`
    @inlinable var lengthSquared: Float { simd_length_squared(self) }
    /// The vector where all fields are the absolute value
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    @inlinable func clamp(min: SIMD8<Float>, max: SIMD8<Float>) -> SIMD8<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    @inlinable func clamp(min: Float, max: Float) -> SIMD8<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    @inlinable var fract: Self { simd_fract(self) }
    /// The sign of each element
    @inlinable var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    @inlinable var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    @inlinable var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    @inlinable var min: Float { simd_reduce_min(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD8<Float>, by alpha: SIMD8<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD8<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    @inlinable func smoothstep(with: SIMD8<Float>, by alpha: SIMD8<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    @inlinable var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    @inlinable var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    @inlinable var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    @inlinable func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    @inlinable var cbrt: Self { simd.cbrt(self) }
    /// Error function of each element
    @available(iOS 15, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    @inlinable func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    @inlinable func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    @inlinable var rounded: Self { simd.round(self) }
    @available(iOS 15, *)
    @inlinable var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    @inlinable var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    @inlinable var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    @inlinable var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    @inlinable var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    @inlinable var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    @inlinable var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    @inlinable var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    @inlinable var tanpi: Self { simd.tanpi(self) }
    /// Setting this computed property is safe from crashes
    @inlinable var asArray: [Float] {
        get {[
            lowHalf.x,
            lowHalf.y,
            lowHalf.z,
            lowHalf.w,
            highHalf.x,
            highHalf.y,
            highHalf.z,
            highHalf.w,
        ]} set(v) {
            if v.count == 0 { return }
            let sm1 = v.count - 1
            lowHalf.x = v[0]; if sm1 == 0 { return }
            lowHalf.y = v[1]; if sm1 == 1 { return }
            lowHalf.z = v[2]; if sm1 == 2 { return }
            lowHalf.w = v[3]; if sm1 == 3 { return }
            highHalf.x = v[4]; if sm1 == 4 { return }
            highHalf.y = v[5]; if sm1 == 5 { return }
            highHalf.z = v[6]; if sm1 == 6 { return }
            highHalf.w = v[7]; if sm1 == 7 { return }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Manhattan distance of `self` to `to`
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    @inlinable init(array: [Float]) {
        self.init()
        asArray = array
    }
}
public extension SIMD16<Float> {
    /// Returns the distance between `self` and `to`
    @inlinable func distance(to: SIMD16<Float>) -> Float {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    @inlinable func distanceFast(to: SIMD16<Float>) -> Float {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    @inlinable func distancePrecise(to: SIMD16<Float>) -> Float {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    @inlinable var length: Float { simd_length(self) }
    /// the length squared of `self`
    @inlinable var lengthSquared: Float { simd_length_squared(self) }
    /// The vector where all fields are the absolute value
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    @inlinable func clamp(min: SIMD16<Float>, max: SIMD16<Float>) -> SIMD16<Float> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    @inlinable func clamp(min: Float, max: Float) -> SIMD16<Float> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    @inlinable var fract: Self { simd_fract(self) }
    /// The sign of each element
    @inlinable var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    @inlinable var reduceAdd: Float { simd_reduce_add(self) }
    /// The max of all elements in the vector
    @inlinable var max: Float { simd_reduce_max(self) }
    /// The min of all elements in the vector
    @inlinable var min: Float { simd_reduce_min(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD16<Float>, by alpha: SIMD16<Float>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD16<Float>, by alpha: Float) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    @inlinable func smoothstep(with: SIMD16<Float>, by alpha: SIMD16<Float>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    @inlinable var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    @inlinable var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    @inlinable var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    @inlinable func dot(with: Self) -> Float { simd_dot(self, with) }
    /// Normalized vector
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    @inlinable var cbrt: Self { simd.cbrt(self) }
    /// Error function of each element
    @available(iOS 15, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    @inlinable func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    @inlinable func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    @inlinable var rounded: Self { simd.round(self) }
    @available(iOS 15, *)
    @inlinable var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    @inlinable var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    @inlinable var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    @inlinable var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    @inlinable var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    @inlinable var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    @inlinable var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    @inlinable var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    @inlinable var tanpi: Self { simd.tanpi(self) }
    /// Setting this computed property is safe from crashes
    @inlinable var asArray: [Float] {
        get {[
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
        ]} set(v) {
            if v.count == 0 { return }
            let sm1 = v.count - 1
            lowHalf.lowHalf.x = v[0]; if sm1 == 0 { return }
            lowHalf.lowHalf.y = v[1]; if sm1 == 1 { return }
            lowHalf.lowHalf.z = v[2]; if sm1 == 2 { return }
            lowHalf.lowHalf.w = v[3]; if sm1 == 3 { return }
            lowHalf.highHalf.x = v[4]; if sm1 == 4 { return }
            lowHalf.highHalf.y = v[5]; if sm1 == 5 { return }
            lowHalf.highHalf.z = v[6]; if sm1 == 6 { return }
            lowHalf.highHalf.w = v[7]; if sm1 == 7 { return }
            highHalf.lowHalf.x = v[8]; if sm1 == 8 { return }
            highHalf.lowHalf.y = v[9]; if sm1 == 9 { return }
            highHalf.lowHalf.z = v[10]; if sm1 == 10 { return }
            highHalf.lowHalf.w = v[11]; if sm1 == 11 { return }
            highHalf.highHalf.x = v[12]; if sm1 == 12 { return }
            highHalf.highHalf.y = v[13]; if sm1 == 13 { return }
            highHalf.highHalf.z = v[14]; if sm1 == 14 { return }
            highHalf.highHalf.w = v[15]; if sm1 == 15 { return }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Manhattan distance of `self` to `to`
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    @inlinable init(array: [Float]) {
        self.init()
        asArray = array
    }
}
public extension SIMD2<Double> {
    /// Returns the distance between `self` and `to`
    @inlinable func distance(to: SIMD2<Double>) -> Double {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    @inlinable func distanceFast(to: SIMD2<Double>) -> Double {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    @inlinable func distancePrecise(to: SIMD2<Double>) -> Double {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    @inlinable var length: Double { simd_length(self) }
    /// the length squared of `self`
    @inlinable var lengthSquared: Double { simd_length_squared(self) }
    /// The vector where all fields are the absolute value
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    @inlinable func clamp(min: SIMD2<Double>, max: SIMD2<Double>) -> SIMD2<Double> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    @inlinable func clamp(min: Double, max: Double) -> SIMD2<Double> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    @inlinable var fract: Self { simd_fract(self) }
    /// The sign of each element
    @inlinable var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    @inlinable var reduceAdd: Double { simd_reduce_add(self) }
    /// The max of all elements in the vector
    @inlinable var max: Double { simd_reduce_max(self) }
    /// The min of all elements in the vector
    @inlinable var min: Double { simd_reduce_min(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD2<Double>, by alpha: SIMD2<Double>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD2<Double>, by alpha: Double) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    @inlinable func smoothstep(with: SIMD2<Double>, by alpha: SIMD2<Double>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    @inlinable var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    @inlinable var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    @inlinable var log1p: Self { simd.log1p(self) }
    /// Cross product of two vectors
    @inlinable func cross(with: Self) -> SIMD3<Double> { simd_cross(self, with) }
    /// Dot product of two vectors
    @inlinable func dot(with: Self) -> Double { simd_dot(self, with) }
    /// Normalized vector
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    @inlinable func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    @inlinable func refract(on normal: Self, idx of: Double) -> Self { simd_refract(self, normal, of) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    @inlinable var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    @inlinable var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    @inlinable var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    @inlinable func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    @inlinable func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    @inlinable var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    @inlinable var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    @inlinable var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    @inlinable var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    @inlinable var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    @inlinable var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    @inlinable var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    @inlinable var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    @inlinable var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    @inlinable var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    @inlinable var tanpi: Self { simd.tanpi(self) }
    /// Setting this computed property is safe from crashes
    @inlinable var asArray: [Double] {
        get {[
            x,
            y,
        ]} set(v) {
            if v.count == 0 { return }
            let sm1 = v.count - 1
            x = v[0]; if sm1 == 0 { return }
            y = v[1]; if sm1 == 1 { return }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Manhattan distance of `self` to `to`
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    @inlinable init(array: [Double]) {
        self.init()
        asArray = array
    }
    @inlinable func rotate(around center: Self, angle: Double) -> Self {
        let c = Foundation.cos(angle)
        let s = Foundation.sin(angle)
        let xy = self - center
        let v1 = Self(xy.x, xy.x)
        let v2 = Self(c, s)
        let v3 = Self(-xy.y, xy.y)
        let v4 = Self(s, c)
        return v1 * v2 + v3 * v4 + center
    }
#if canImport(CoreGraphics)
    @inlinable var asCGPoint: CGPoint { CGPoint(x: CGFloat(x), y: CGFloat(y)) }
    @inlinable var asCGSize: CGSize { CGSize(width: CGFloat(x), height: CGFloat(y)) }
#endif
}
public extension SIMD3<Double> {
    /// Returns the distance between `self` and `to`
    @inlinable func distance(to: SIMD3<Double>) -> Double {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    @inlinable func distanceFast(to: SIMD3<Double>) -> Double {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    @inlinable func distancePrecise(to: SIMD3<Double>) -> Double {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    @inlinable var length: Double { simd_length(self) }
    /// the length squared of `self`
    @inlinable var lengthSquared: Double { simd_length_squared(self) }
    /// The vector where all fields are the absolute value
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    @inlinable func clamp(min: SIMD3<Double>, max: SIMD3<Double>) -> SIMD3<Double> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    @inlinable func clamp(min: Double, max: Double) -> SIMD3<Double> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    @inlinable var fract: Self { simd_fract(self) }
    /// The sign of each element
    @inlinable var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    @inlinable var reduceAdd: Double { simd_reduce_add(self) }
    /// The max of all elements in the vector
    @inlinable var max: Double { simd_reduce_max(self) }
    /// The min of all elements in the vector
    @inlinable var min: Double { simd_reduce_min(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD3<Double>, by alpha: SIMD3<Double>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD3<Double>, by alpha: Double) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    @inlinable func smoothstep(with: SIMD3<Double>, by alpha: SIMD3<Double>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    @inlinable var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    @inlinable var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    @inlinable var log1p: Self { simd.log1p(self) }
    /// Cross product of two vectors
    @inlinable func cross(with: Self) -> SIMD3<Double> { simd_cross(self, with) }
    /// Dot product of two vectors
    @inlinable func dot(with: Self) -> Double { simd_dot(self, with) }
    /// Normalized vector
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    @inlinable func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    @inlinable func refract(on normal: Self, idx of: Double) -> Self { simd_refract(self, normal, of) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    @inlinable var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    @inlinable var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    @inlinable var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    @inlinable func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    @inlinable func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    @inlinable var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    @inlinable var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    @inlinable var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    @inlinable var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    @inlinable var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    @inlinable var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    @inlinable var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    @inlinable var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    @inlinable var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    @inlinable var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    @inlinable var tanpi: Self { simd.tanpi(self) }
    /// Setting this computed property is safe from crashes
    @inlinable var asArray: [Double] {
        get {[
            x,
            y,
            z,
        ]} set(v) {
            if v.count == 0 { return }
            let sm1 = v.count - 1
            x = v[0]; if sm1 == 0 { return }
            y = v[1]; if sm1 == 1 { return }
            z = v[2]; if sm1 == 2 { return }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Manhattan distance of `self` to `to`
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    @inlinable init(array: [Double]) {
        self.init()
        asArray = array
    }
    @inlinable func project(vec on: Self) -> Self {
        let denom = self.lengthSquared
        if denom == 0 { return Self() }
        let scalar = on.dot(with: self) / denom
        return on * scalar
    }
#if canImport(SwiftUI)
    @available(iOS 13, *)
    @inlinable var asColor: Color {
        let norm = normalized
        return Color(red: Double(norm.x), green: Double(norm.y), blue: Double(norm.z))
    }
#endif
#if canImport(CoreGraphics)
    @inlinable var asUIColor: UIColor {
        let norm = normalized
        return UIColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: 1.0)
    }
    @available(iOS 13, *)
    @inlinable var asCGColor: CGColor {
        let norm = normalized
        return CGColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: 1.0)
    }
#endif
#if canImport(SceneKit)
    @inlinable var asSCNV3: SCNVector3 {
        SCNVector3(Float(x), Float(y), Float(z))
    }
#endif
}
public extension SIMD4<Double> {
    /// Returns the distance between `self` and `to`
    @inlinable func distance(to: SIMD4<Double>) -> Double {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    @inlinable func distanceFast(to: SIMD4<Double>) -> Double {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    @inlinable func distancePrecise(to: SIMD4<Double>) -> Double {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    @inlinable var length: Double { simd_length(self) }
    /// the length squared of `self`
    @inlinable var lengthSquared: Double { simd_length_squared(self) }
    /// The vector where all fields are the absolute value
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    @inlinable func clamp(min: SIMD4<Double>, max: SIMD4<Double>) -> SIMD4<Double> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    @inlinable func clamp(min: Double, max: Double) -> SIMD4<Double> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    @inlinable var fract: Self { simd_fract(self) }
    /// The sign of each element
    @inlinable var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    @inlinable var reduceAdd: Double { simd_reduce_add(self) }
    /// The max of all elements in the vector
    @inlinable var max: Double { simd_reduce_max(self) }
    /// The min of all elements in the vector
    @inlinable var min: Double { simd_reduce_min(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD4<Double>, by alpha: SIMD4<Double>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD4<Double>, by alpha: Double) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    @inlinable func smoothstep(with: SIMD4<Double>, by alpha: SIMD4<Double>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    @inlinable var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    @inlinable var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    @inlinable var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    @inlinable func dot(with: Self) -> Double { simd_dot(self, with) }
    /// Normalized vector
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    @inlinable func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Refraction of `self` as incident vector with a unit normal vector and refraction
    @inlinable func refract(on normal: Self, idx of: Double) -> Self { simd_refract(self, normal, of) }
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    @inlinable var cbrt: Self { simd.cbrt(self) }
    /// Ceil of each element
    @available(iOS 15, *)
    @inlinable var asCeil: Self { simd.ceil(self) }
    /// Floor of each element
    @available(iOS 15, *)
    @inlinable var floor: Self { simd.floor(self) }
    /// Error function of each element
    @available(iOS 15, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    @inlinable func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    @inlinable func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    @inlinable var rounded: Self { simd.round(self) }
    /// Each element rounded toward zero to nearest integer
    @inlinable var trunc: Self { simd.trunc(self) }
    @available(iOS 15, *)
    @inlinable var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    @inlinable var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    @inlinable var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    @inlinable var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    @inlinable var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    @inlinable var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    @inlinable var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    @inlinable var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    @inlinable var tanpi: Self { simd.tanpi(self) }
    /// Setting this computed property is safe from crashes
    @inlinable var asArray: [Double] {
        get {[
            x,
            y,
            z,
            w,
        ]} set(v) {
            if v.count == 0 { return }
            let sm1 = v.count - 1
            x = v[0]; if sm1 == 0 { return }
            y = v[1]; if sm1 == 1 { return }
            z = v[2]; if sm1 == 2 { return }
            w = v[3]; if sm1 == 3 { return }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Manhattan distance of `self` to `to`
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    @inlinable init(array: [Double]) {
        self.init()
        asArray = array
    }
    init(axis: SIMD3<Double>, rad: Double) {
        let halfAngle = rad / 2
        let s = Foundation.sin( halfAngle )
        self.init(axis.x * s, axis.y * s, axis.z * s, Foundation.cos( halfAngle ))
    }
    init(euler: SIMD3<Double>, order: EulerOrder) {
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
    init(matrix: simd_double3x3) {
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
    /// Initialize from Unit Vectors
    init(from: SIMD3<Double>, to: SIMD3<Double>) {
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
    @inlinable func angle(to: Self) -> Double {
        2 * Foundation.acos(Swift.abs((self.dot(with: to)).clamp(-1, 1)))
    }
    @inlinable func rotate(towards: Self, step: Double) -> Self {
        let ang = angle(to: towards)
        if (ang == 0) {return self}
        let t = Swift.min(1, step / ang)
        return slerp( quat: towards, t: t )
    }
    func slerp(quat: Self, t: Double) -> Self {
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
    @inlinable var invert: Self { Self(-x, -y, -z, w) }
    func multiply(by: Self) -> Self {
        let v1 = Self(repeating: by.w)
        let v2 = Self(self.w, self.w, self.w, -self.x)
        let v3 = Self(by.x, by.y, by.z, by.x)
        let v4 = Self(self.y, self.z, self.x, -self.y)
        let v5 = Self(by.z, by.x, by.y, by.y)
        let v6 = -Self(self.z, self.x, self.y, self.z)
        let v7 = Self(by.y, by.z, by.x, by.z)
        return self * v1 + v2 * v3 + v4 * v5 + v6 * v7
    }
    @inlinable func preMultiply(by: Self) -> Self {
        return by.multiply(by: self)
    }
#if canImport(SwiftUI)
    @available(iOS 13, *)
    @inlinable var asColor: Color {
        let norm = normalized
        return Color(red: Double(norm.x), green: Double(norm.y), blue: Double(norm.z), opacity: Double(norm.w))
    }
#endif
#if canImport(CoreGraphics)
    @inlinable var asUIColor: UIColor {
        let norm = normalized
        return UIColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: CGFloat(norm.w))
    }
    @available(iOS 13, *)
    @inlinable var asCGColor: CGColor {
        let norm = normalized
        return CGColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: CGFloat(norm.w))
    }
#endif
}
public extension SIMD8<Double> {
    /// Returns the distance between `self` and `to`
    @inlinable func distance(to: SIMD8<Double>) -> Double {
        simd_distance(self, to)
    }
    /// Quickly returns the distance between `self` and `to`
    @inlinable func distanceFast(to: SIMD8<Double>) -> Double {
        simd_fast_distance(self, to)
    }
    /// Returns the precise distance between `self` and `to`
    @inlinable func distancePrecise(to: SIMD8<Double>) -> Double {
        simd_precise_distance(self, to)
    }
    /// The length of `self`
    @inlinable var length: Double { simd_length(self) }
    /// the length squared of `self`
    @inlinable var lengthSquared: Double { simd_length_squared(self) }
    /// The vector where all fields are the absolute value
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps `self` to the fields of `min` and `max`
    @inlinable func clamp(min: SIMD8<Double>, max: SIMD8<Double>) -> SIMD8<Double> {
        simd_clamp(self, min, max)
    }
    /// Clamps `self` to the values of `min` and `max`
    @inlinable func clamp(min: Double, max: Double) -> SIMD8<Double> {
        simd_clamp(self, Self(repeating: min), Self(repeating: max))
    }
    /// The fractional part of each element
    @inlinable var fract: Self { simd_fract(self) }
    /// The sign of each element
    @inlinable var sign: Self { simd_sign(self) }
    /// The sum of all elements in the vector
    @inlinable var reduceAdd: Double { simd_reduce_add(self) }
    /// The max of all elements in the vector
    @inlinable var max: Double { simd_reduce_max(self) }
    /// The min of all elements in the vector
    @inlinable var min: Double { simd_reduce_min(self) }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD8<Double>, by alpha: SIMD8<Double>) -> Self {
        simd_mix(self, with, alpha)
    }
    /// Returns linear interpolation of `self` with `with` by `alpha` percent
    @inlinable func lerp(with: SIMD8<Double>, by alpha: Double) -> Self {
        simd_mix(self, with, Self(repeating: alpha))
    }
    /// Returns smooth interpolation of `self` with `with` by `alpha` percent
    @inlinable func smoothstep(with: SIMD8<Double>, by alpha: SIMD8<Double>) -> Self {
        simd_smoothstep(self, with, alpha)
    }
    /// Default reciprocal of each element
    @inlinable var recip: Self { simd_recip(self) }
    /// Fast reciprocal of each element
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Precise reciprocal of each element
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Default reciprocal square root of each element
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Fast reciprocal square root of each element
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Precise reciprocal square root of each element
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// `e` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp: Self { simd.exp(self) }
    /// `2` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp2: Self { simd.exp2(self) }
    /// `10` raised to the power of each element in vector
    @available(iOS 15, *)
    @inlinable var exp10: Self { simd.exp10(self) }
    /// `e-1` for each element in vector
    @available(iOS 15, *)
    @inlinable var expm1: Self { simd.expm1(self) }
    /// Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log: Self { simd.log(self) }
    /// Base 2 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log2: Self { simd.log2(self) }
    /// Base 10 Natural logarithm of each element
    @available(iOS 15, *)
    @inlinable var log10: Self { simd.log10(self) }
    /// `log(1+x)` of each element
    @available(iOS 15, *)
    @inlinable var log1p: Self { simd.log1p(self) }
    /// Dot product of two vectors
    @inlinable func dot(with: Self) -> Double { simd_dot(self, with) }
    /// Normalized vector
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Quickly normalized vector
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Precisely normalized vector
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Project `self` onto `on`
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Project `self` onto `on` quickly
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Project `self` onto `on` with precision
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Reflection of `self` as incident vector with a unit normal vector
    /// Inverse hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var acosh: Self { simd.acosh(self) }
    /// Inverse hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var asinh: Self { simd.asinh(self) }
    /// Inverse hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var atanh: Self { simd.atanh(self) }
    /// Hyperbolic cosine of each element
    @available(iOS 15, *)
    @inlinable var cosh: Self { simd.cosh(self) }
    /// Hyperbolic sine of each element
    @available(iOS 15, *)
    @inlinable var sinh: Self { simd.sinh(self) }
    /// Hyperbolic tangent of each element
    @available(iOS 15, *)
    @inlinable var tanh: Self { simd.tanh(self) }
    /// Cube root of each element
    @available(iOS 15, *)
    @inlinable var cbrt: Self { simd.cbrt(self) }
    /// Error function of each element
    @available(iOS 15, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Complementary error function of each element
    @available(iOS 15, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Multiply-add result of corresponding elements in three vectors
    @available(iOS 15, *)
    @inlinable func fma(_ a: Self, _ b: Self) -> Self { simd.fma(self, a, b) }
    /// Modulo of `self` / `other`
    @available(iOS 15, *)
    @inlinable func fmod(_ other: Self) -> Self { simd.fmod(self, other) }
    /// Each element rounded to nearest integer
    @available(iOS 15, *)
    @inlinable var rounded: Self { simd.round(self) }
    @available(iOS 15, *)
    @inlinable var acos: Self { simd.acos(self) }
    @available(iOS 15, *)
    @inlinable var asin: Self { simd.asin(self) }
    @available(iOS 15, *)
    @inlinable var atan: Self { simd.atan(self) }
    @available(iOS 15, *)
    @inlinable var cos: Self { simd.cos(self) }
    @available(iOS 15, *)
    @inlinable var cospi: Self { simd.cospi(self) }
    @available(iOS 15, *)
    @inlinable var sin: Self { simd.sin(self) }
    @available(iOS 15, *)
    @inlinable var sinpi: Self { simd.sinpi(self) }
    @available(iOS 15, *)
    @inlinable var tan: Self { simd.tan(self) }
    @available(iOS 15, *)
    @inlinable var tanpi: Self { simd.tanpi(self) }
    /// Setting this computed property is safe from crashes
    @inlinable var asArray: [Double] {
        get {[
            lowHalf.x,
            lowHalf.y,
            lowHalf.z,
            lowHalf.w,
            highHalf.x,
            highHalf.y,
            highHalf.z,
            highHalf.w,
        ]} set(v) {
            if v.count == 0 { return }
            let sm1 = v.count - 1
            lowHalf.x = v[0]; if sm1 == 0 { return }
            lowHalf.y = v[1]; if sm1 == 1 { return }
            lowHalf.z = v[2]; if sm1 == 2 { return }
            lowHalf.w = v[3]; if sm1 == 3 { return }
            highHalf.x = v[4]; if sm1 == 4 { return }
            highHalf.y = v[5]; if sm1 == 5 { return }
            highHalf.z = v[6]; if sm1 == 6 { return }
            highHalf.w = v[7]; if sm1 == 7 { return }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Manhattan distance of `self` to `to`
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    @inlinable init(array: [Double]) {
        self.init()
        asArray = array
    }
}
public extension SIMD2<Float> {
   @inlinable var asSIMDDouble: SIMD2<Double> { SIMD2<Double>(Double(x),Double(y)) }
}
public extension SIMD2<Double> {
   @inlinable var asSIMDFloat: SIMD2<Float> { SIMD2<Float>(Float(x),Float(y)) }
}
public extension SIMD3<Float> {
   @inlinable var asSIMDDouble: SIMD3<Double> { SIMD3<Double>(Double(x),Double(y),Double(z)) }
}
public extension SIMD3<Double> {
   @inlinable var asSIMDFloat: SIMD3<Float> { SIMD3<Float>(Float(x),Float(y),Float(z)) }
}
public extension SIMD4<Float> {
   @inlinable var asSIMDDouble: SIMD4<Double> { SIMD4<Double>(Double(x),Double(y),Double(z),Double(w)) }
}
public extension SIMD4<Double> {
   @inlinable var asSIMDFloat: SIMD4<Float> { SIMD4<Float>(Float(x),Float(y),Float(z),Float(w)) }
}
public extension SIMD8<Float> {
   @inlinable var asSIMDDouble: SIMD8<Double> { SIMD8<Double>(Double(lowHalf.x),Double(lowHalf.y),Double(lowHalf.z),Double(lowHalf.w),Double(highHalf.x),Double(highHalf.y),Double(highHalf.z),Double(highHalf.w)) }
}
public extension SIMD8<Double> {
   @inlinable var asSIMDFloat: SIMD8<Float> { SIMD8<Float>(Float(lowHalf.x),Float(lowHalf.y),Float(lowHalf.z),Float(lowHalf.w),Float(highHalf.x),Float(highHalf.y),Float(highHalf.z),Float(highHalf.w)) }
}
public extension Spherical where T == Float {
    /// Initialize Spherical using 3D Vector in cartesian coordinate space
    init(cartesian simdF: SIMD3<Float>) {
        simd = SIMD3<Float>()
        radius = simdF.length
        if radius == 0 {
            theta = 0
            phi = 0
        } else {
            theta = Foundation.atan2(simdF.x, simdF.z)
            phi = Foundation.acos((simdF.y / radius).clamp(-1, 1))
        }
    }
    /// Sphirical where phi is restricted to between EPS and PI-EPS
    @inlinable var asSafe: Spherical {
        var sph = self
        let EPS = Float.ulpOfOne
        sph.phi = Swift.max(EPS, Swift.min(Float.pi - EPS, sph.phi))
        return sph
    }
    /// Restrict phi to between EPS and PI-EPS
    @inlinable mutating func makeSafe() {
       self = asSafe
    }
    /// Spherical coordinates represented as cartesian coordinates
    var asCartesian: SIMD3<Float> {
        let sinPhiRad = Foundation.sin(phi) * radius
        let l = SIMD3<Float>(sinPhiRad, Foundation.cos(phi), sinPhiRad)
        let r = SIMD3<Float>(Foundation.sin(theta), radius, Foundation.cos(theta))
        return l * r
    }
}
public extension Spherical where T == Double {
    /// Initialize Spherical using 3D Vector in cartesian coordinate space
    init(cartesian simdD: SIMD3<Double>) {
        simd = SIMD3<Double>()
        radius = simdD.length
        if radius == 0 {
            theta = 0
            phi = 0
        } else {
            theta = Foundation.atan2(simdD.x, simdD.z)
            phi = Foundation.acos((simdD.y / radius).clamp(-1, 1))
        }
    }
    /// Sphirical where phi is restricted to between EPS and PI-EPS
    @inlinable var asSafe: Spherical {
        var sph = self
        let EPS = Double.ulpOfOne
        sph.phi = Swift.max(EPS, Swift.min(Double.pi - EPS, sph.phi))
        return sph
    }
    /// Restrict phi to between EPS and PI-EPS
    @inlinable mutating func makeSafe() {
       self = asSafe
    }
    /// Spherical coordinates represented as cartesian coordinates
    var asCartesian: SIMD3<Double> {
        let sinPhiRad = Foundation.sin(phi) * radius
        let l = SIMD3<Double>(sinPhiRad, Foundation.cos(phi), sinPhiRad)
        let r = SIMD3<Double>(Foundation.sin(theta), radius, Foundation.cos(theta))
        return l * r
    }
}
#if canImport(SwiftUI)
@available(iOS 13, *)
public extension View {
    func frame(_ size: CGSize, alignment: Alignment = .center) -> some View {
        return self.frame(width: size.width, height: size.height, alignment: alignment)
    }
    func frame(min: CGSize? = nil, ideal: CGSize? = nil, max: CGSize? = nil, alignment: Alignment = .center) -> some View {
        return self.frame(minWidth: min?.width, idealWidth: ideal?.width, maxWidth: max?.width, minHeight: min?.height, idealHeight: ideal?.height, maxHeight: max?.height, alignment: alignment)
    }
    func frame(_ simd2F: SIMD2<Float>, alignment: Alignment = .center) -> some View {
        return self.frame(width: CGFloat(simd2F.x), height: CGFloat(simd2F.y), alignment: alignment)
    }
    func frame(min: SIMD2<Float>? = nil, ideal: SIMD2<Float>? = nil, max: SIMD2<Float>? = nil, alignment: Alignment = .center) -> some View {
        let v: [CGFloat?] = Array(arrayLiteral: min?.x, ideal?.x, max?.x, min?.y, ideal?.y, max?.y).map { $0 == nil ? nil : CGFloat($0!) }
        return self.frame(minWidth: v[0], idealWidth: v[1], maxWidth: v[2], minHeight: v[3], idealHeight: v[4], maxHeight: v[5], alignment: alignment)
    }
    func position(_ simd2F: SIMD2<Float>) -> some View {
        return self.position(x: CGFloat(simd2F.x), y: CGFloat(simd2F.y))
    }
    func offset(_ simd2F: SIMD2<Float>) -> some View {
        return self.offset(x: CGFloat(simd2F.x), y: CGFloat(simd2F.y))
    }
    func frame(_ simd2D: SIMD2<Double>, alignment: Alignment = .center) -> some View {
        return self.frame(width: CGFloat(simd2D.x), height: CGFloat(simd2D.y), alignment: alignment)
    }
    func frame(min: SIMD2<Double>? = nil, ideal: SIMD2<Double>? = nil, max: SIMD2<Double>? = nil, alignment: Alignment = .center) -> some View {
        let v: [CGFloat?] = Array(arrayLiteral: min?.x, ideal?.x, max?.x, min?.y, ideal?.y, max?.y).map { $0 == nil ? nil : CGFloat($0!) }
        return self.frame(minWidth: v[0], idealWidth: v[1], maxWidth: v[2], minHeight: v[3], idealHeight: v[4], maxHeight: v[5], alignment: alignment)
    }
    func position(_ simd2D: SIMD2<Double>) -> some View {
        return self.position(x: CGFloat(simd2D.x), y: CGFloat(simd2D.y))
    }
    func offset(_ simd2D: SIMD2<Double>) -> some View {
        return self.offset(x: CGFloat(simd2D.x), y: CGFloat(simd2D.y))
    }
}
@available(iOS 13, *)
public extension Path {
    static func createLinesFrom(_ simd2Fpoints: [SIMD2<Float>], isClosed: Bool = true) -> Path {
        Path { p in
            if simd2Fpoints.count < 2 { return }
            let cgp = simd2Fpoints.map { $0.asCGPoint }
            p.move(to: cgp[0])
            for pt in cgp[1...] {
                p.addLine(to: pt)
            }
            if isClosed { p.addLine(to: cgp[0]) }
        }
    }
    static func createLinesFrom(_ simd2Dpoints: [SIMD2<Double>], isClosed: Bool = true) -> Path {
        Path { p in
            if simd2Dpoints.count < 2 { return }
            let cgp = simd2Dpoints.map { $0.asCGPoint }
            p.move(to: cgp[0])
            for pt in cgp[1...] {
                p.addLine(to: pt)
            }
            if isClosed { p.addLine(to: cgp[0]) }
        }
    }
}
#endif
#if canImport(SceneKit)
public extension SCNVector3 {
    init(_ x: Double, _ y: Double, _ z: Double) {
        self.init(Float(x), Float(y), Float(z))
    }
    var asSIMDF: SIMD3<Float> { .init(x, y, z) }
    var asSIMDD: SIMD3<Double> { .init(Double(x), Double(y), Double(z)) }
}
public extension SCNQuaternion {
    init(_ x: Double, _ y: Double, _ z: Double, _ w: Double) {
        self.init(Float(x), Float(y), Float(z), Float(w))
    }
    var asSIMDF: SIMD4<Float> { .init(x, y, z, w) }
    var asSIMDD: SIMD4<Double> { .init(Double(x), Double(y), Double(z), Double(w)) }
}
public extension SCNGeometrySource {
    convenience init(vertices: [SIMD3<Float>]) {
        self.init(vertices: vertices.map {SCNVector3($0.x, $0.y, $0.z)})
    }
    convenience init(normals: [SIMD3<Float>]) {
        self.init(normals: normals.map {SCNVector3($0.x, $0.y, $0.z)})
    }
    convenience init(vertices: [SIMD3<Double>]) {
        self.init(vertices: vertices.map {SCNVector3($0.x, $0.y, $0.z)})
    }
    convenience init(normals: [SIMD3<Double>]) {
        self.init(normals: normals.map {SCNVector3($0.x, $0.y, $0.z)})
    }
    convenience init(textureCoordinates: [SIMD2<Float>]) {
        self.init(textureCoordinates: textureCoordinates.map {CGPoint(x: CGFloat($0.x), y: CGFloat($0.y))})
    }
    convenience init(textureCoordinates: [SIMD2<Double>]) {
        self.init(textureCoordinates: textureCoordinates.map {CGPoint(x: CGFloat($0.x), y: CGFloat($0.y))})
    }
}
#endif
