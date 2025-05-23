#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#elseif canImport(Musl)
import Musl
#elseif os(Windows) // Swift‑windows toolchain
import ucrt
#else
#error("No known C standard library module for this platform")
#endif
import simd
import Foundation
import Numerics

@usableFromInline
protocol _ScalarReal : SIMDScalar /* & BinaryFloatingPoint */ {
    static func _acos(_ x: Self) -> Self
    static func _acosh(_ x: Self) -> Self
    static func _asin(_ x: Self) -> Self
    static func _asinh(_ x: Self) -> Self
    static func _atan(_ x: Self) -> Self
    static func _atan2(_ x: Self, _ y: Self) -> Self
    static func _atanh(_ x: Self) -> Self
    static func _cbrt(_ x: Self) -> Self
    static func _ceil(_ x: Self) -> Self
    static func _cos(_ x: Self) -> Self
    static func _cosh(_ x: Self) -> Self
    static func _cospi(_ x: Self) -> Self
    static func _exp(_ x: Self) -> Self
    static func _exp10(_ x: Self) -> Self
    static func _exp2(_ x: Self) -> Self
    static func _expm1(_ x: Self) -> Self
    static func _floor(_ x: Self) -> Self
    static func _fma(_ x: Self, _ y: Self, _ z: Self) -> Self
    static func _fmod(_ x: Self, _ y: Self) -> Self
    static func _hypot(_ x: Self, _ y: Self) -> Self
    static func _isfinite(_ x: Self) -> Int
    static func _isinf(_ x: Self) -> Int
    static func _isnan(_ x: Self) -> Int
    static func _isnormal(_ x: Self) -> Int
    static func _lgamma(_ x: Self) -> Self
    static func _log(_ x: Self) -> Self
    static func _log10(_ x: Self) -> Self
    static func _log1p(_ x: Self) -> Self
    static func _log2(_ x: Self) -> Self
    static func _nextafter(_ x: Self, _ y: Self) -> Self
    static func _pow(_ x: Self, _ y: Self) -> Self
    static func _remainder(_ x: Self, _ y: Self) -> Self
    static func _round(_ x: Self) -> Self
    static func _sin(_ x: Self) -> Self
    static func _sincos(_ x: Self) -> (sin: Self, cos: Self)
    static func _sincospi(_ x: Self) -> (sin: Self, cos: Self)
    static func _sinh(_ x: Self) -> Self
    static func _sinpi(_ x: Self) -> Self
    static func _sqrt(_ x: Self) -> Self
    static func _tan(_ x: Self) -> Self
    static func _tanh(_ x: Self) -> Self
    static func _tanpi(_ x: Self) -> Self
    static func _tgamma(_ x: Self) -> Self
}

// Cross-Platform Compatible
extension Float  : _ScalarReal { 
    @usableFromInline @inline(__always) static func _acos(_ x: Self ) -> Self   { Self.acos(x) }
    @usableFromInline @inline(__always) static func _acosh(_ x: Self) -> Self   { Self.acosh(x) }
    @usableFromInline @inline(__always) static func _asin(_ x: Self) -> Self    { Self.asin(x) }
    @usableFromInline @inline(__always) static func _asinh(_ x: Self) -> Self   { Self.asinh(x) }
    @usableFromInline @inline(__always) static func _atan(_ x: Self) -> Self    { Self.atan(x) }
    @usableFromInline @inline(__always) static func _atan2(_ x: Self, _ y: Self) -> Self   { Self.atan2(y: x, x: y) }
    @usableFromInline @inline(__always) static func _atanh(_ x: Self) -> Self   { Self.atanh(x) }
    @usableFromInline @inline(__always) static func _cbrt(_ x: Self) -> Self    { cbrtf(x) }
    @usableFromInline @inline(__always) static func _ceil(_ x: Self) -> Self    { x.rounded(.up) }
    @usableFromInline @inline(__always) static func _cos(_ x: Self) -> Self     { Self.cos(x) }
    @usableFromInline @inline(__always) static func _cosh(_ x: Self) -> Self    { Self.cosh(x) }
    @usableFromInline @inline(__always) static func _cospi(_ x: Self) -> Self   { Self.cos(Self.pi * x) }
    @usableFromInline @inline(__always) static func _exp(_ x: Self) -> Self     { Self.exp(x) }
    @usableFromInline @inline(__always) static func _exp10(_ x: Self) -> Self   { Self.exp10(x) }
    @usableFromInline @inline(__always) static func _exp2(_ x: Self) -> Self    { Self.exp2(x) }
    @usableFromInline @inline(__always) static func _expm1(_ x: Self) -> Self   { Self.expMinusOne(x) }
    @usableFromInline @inline(__always) static func _floor(_ x: Self) -> Self   { x.rounded(.down) }
    @usableFromInline @inline(__always) static func _fma(_ x: Self, _ y: Self, _ z: Self) -> Self  { z.addingProduct(x, y) }
    @usableFromInline @inline(__always) static func _fmod(_ x: Self, _ y: Self) -> Self { x.truncatingRemainder(dividingBy: y) }
    @usableFromInline @inline(__always) static func _hypot(_ x: Self, _ y: Self) -> Self { Self.hypot(x, y) }
    @usableFromInline @inline(__always) static func _lgamma(_ x: Self) -> Self { Self.logGamma(x) }
    @usableFromInline @inline(__always) static func _log(_ x: Self) -> Self { Self.log(x) }
    @usableFromInline @inline(__always) static func _log10(_ x: Self) -> Self { Self.log10(x) }
    @usableFromInline @inline(__always) static func _log1p(_ x: Self) -> Self { Self.log(onePlus: x) }
    @usableFromInline @inline(__always) static func _log2(_ x: Self) -> Self { Self.log2(x) }
    @usableFromInline @inline(__always) static func _nextafter(_ x: Self, _ y: Self) -> Self { nextafterf(x, y)}
    @usableFromInline @inline(__always) static func _pow(_ x: Self, _ y: Self) -> Self { Self.pow(x, y)}
    @usableFromInline @inline(__always) static func _remainder(_ x: Self, _ y: Self) -> Self { x.remainder(dividingBy: y) }
    @usableFromInline @inline(__always) static func _round(_ x: Self) -> Self { x.rounded() }
    @usableFromInline @inline(__always) static func _sin(_ x: Self) -> Self { Self.sin(x) }
    @usableFromInline @inline(__always) static func _sinh(_ x: Self) -> Self { Self.sinh(x) }
    @usableFromInline @inline(__always) static func _sinpi(_ x: Self) -> Self { Self.sin(Self.pi * x) }
    @usableFromInline @inline(__always) static func _sqrt(_ x: Self) -> Self { Self.sqrt(x) }
    @usableFromInline @inline(__always) static func _tan(_ x: Self) -> Self { Self.tan(x) }
    @usableFromInline @inline(__always) static func _tanh(_ x: Self) -> Self { Self.tanh(x) }
    @usableFromInline @inline(__always) static func _tanpi(_ x: Self) -> Self { Self.tan(Self.pi * x) }
    @usableFromInline @inline(__always) static func _tgamma(_ x: Self) -> Self { Self.gamma(x) }
    @usableFromInline @inline(__always) static func _sincos(_ x: Self) -> (sin: Self, cos: Self) {
        (sin: Self.sin(x), cos: self.cos(x))
    }
    @usableFromInline @inline(__always) static func _sincospi(_ x: Self) -> (sin: Self, cos: Self) {
        (sin: Self.sin(Self.pi * x), cos: Self.cos(Self.pi * x))
    }
    @usableFromInline @inline(__always) static func _isfinite(_ x: Self) -> Int { x.isFinite ? 1 : 0 }
    @usableFromInline @inline(__always) static func _isinf(_ x: Self) -> Int { x.isInfinite ? 1 : 0 }
    @usableFromInline @inline(__always) static func _isnan(_ x: Self) -> Int { x.isNaN ? 1 : 0 }
    @usableFromInline @inline(__always) static func _isnormal(_ x: Self) -> Int { x.isNormal ? 1 : 0 }
}
extension Double : _ScalarReal { 
    @usableFromInline @inline(__always) static func _acos(_ x: Self ) -> Self   { Self.acos(x) }
    @usableFromInline @inline(__always) static func _acosh(_ x: Self) -> Self   { Self.acosh(x) }
    @usableFromInline @inline(__always) static func _asin(_ x: Self) -> Self    { Self.asin(x) }
    @usableFromInline @inline(__always) static func _asinh(_ x: Self) -> Self   { Self.asinh(x) }
    @usableFromInline @inline(__always) static func _atan(_ x: Self) -> Self    { Self.atan(x) }
    @usableFromInline @inline(__always) static func _atan2(_ x: Self, _ y: Self) -> Self   { Self.atan2(y: x, x: y) }
    @usableFromInline @inline(__always) static func _atanh(_ x: Self) -> Self   { Self.atanh(x) }
    @usableFromInline @inline(__always) static func _cbrt(_ x: Self) -> Self    { cbrt(x) }
    @usableFromInline @inline(__always) static func _ceil(_ x: Self) -> Self    { x.rounded(.up) }
    @usableFromInline @inline(__always) static func _cos(_ x: Self) -> Self     { Self.cos(x) }
    @usableFromInline @inline(__always) static func _cosh(_ x: Self) -> Self    { Self.cosh(x) }
    @usableFromInline @inline(__always) static func _cospi(_ x: Self) -> Self   { Self.cos(Self.pi * x) }
    @usableFromInline @inline(__always) static func _exp(_ x: Self) -> Self     { Self.exp(x) }
    @usableFromInline @inline(__always) static func _exp10(_ x: Self) -> Self   { Self.exp10(x) }
    @usableFromInline @inline(__always) static func _exp2(_ x: Self) -> Self    { Self.exp2(x) }
    @usableFromInline @inline(__always) static func _expm1(_ x: Self) -> Self   { Self.expMinusOne(x) }
    @usableFromInline @inline(__always) static func _floor(_ x: Self) -> Self   { x.rounded(.down) }
    @usableFromInline @inline(__always) static func _fma(_ x: Self, _ y: Self, _ z: Self) -> Self  { z.addingProduct(x, y) }
    @usableFromInline @inline(__always) static func _fmod(_ x: Self, _ y: Self) -> Self { x.truncatingRemainder(dividingBy: y) }
    @usableFromInline @inline(__always) static func _hypot(_ x: Self, _ y: Self) -> Self { Self.hypot(x, y) }
    @usableFromInline @inline(__always) static func _lgamma(_ x: Self) -> Self { Self.logGamma(x) }
    @usableFromInline @inline(__always) static func _log(_ x: Self) -> Self { Self.log(x) }
    @usableFromInline @inline(__always) static func _log10(_ x: Self) -> Self { Self.log10(x) }
    @usableFromInline @inline(__always) static func _log1p(_ x: Self) -> Self { Self.log(onePlus: x) }
    @usableFromInline @inline(__always) static func _log2(_ x: Self) -> Self { Self.log2(x) }
    @usableFromInline @inline(__always) static func _nextafter(_ x: Self, _ y: Self) -> Self { nextafter(x, y)}
    @usableFromInline @inline(__always) static func _pow(_ x: Self, _ y: Self) -> Self { Self.pow(x, y)}
    @usableFromInline @inline(__always) static func _remainder(_ x: Self, _ y: Self) -> Self { x.remainder(dividingBy: y) }
    @usableFromInline @inline(__always) static func _round(_ x: Self) -> Self { x.rounded() }
    @usableFromInline @inline(__always) static func _sin(_ x: Self) -> Self { Self.sin(x) }
    @usableFromInline @inline(__always) static func _sinh(_ x: Self) -> Self { Self.sinh(x) }
    @usableFromInline @inline(__always) static func _sinpi(_ x: Self) -> Self { Self.sin(Self.pi * x) }
    @usableFromInline @inline(__always) static func _sqrt(_ x: Self) -> Self { Self.sqrt(x) }
    @usableFromInline @inline(__always) static func _tan(_ x: Self) -> Self { Self.tan(x) }
    @usableFromInline @inline(__always) static func _tanh(_ x: Self) -> Self { Self.tanh(x) }
    @usableFromInline @inline(__always) static func _tanpi(_ x: Self) -> Self { Self.tan(Self.pi * x) }
    @usableFromInline @inline(__always) static func _tgamma(_ x: Self) -> Self { Self.gamma(x) }
    @usableFromInline @inline(__always) static func _sincos(_ x: Self) -> (sin: Self, cos: Self) {
        (sin: Self.sin(x), cos: self.cos(x))
    }
    @usableFromInline @inline(__always) static func _sincospi(_ x: Self) -> (sin: Self, cos: Self) {
        (sin: Self.sin(Self.pi * x), cos: Self.cos(Self.pi * x))
    }
    @usableFromInline @inline(__always) static func _isfinite(_ x: Self) -> Int { x.isFinite ? 1 : 0 }
    @usableFromInline @inline(__always) static func _isinf(_ x: Self) -> Int { x.isInfinite ? 1 : 0 }
    @usableFromInline @inline(__always) static func _isnan(_ x: Self) -> Int { x.isNaN ? 1 : 0 }
    @usableFromInline @inline(__always) static func _isnormal(_ x: Self) -> Int { x.isNormal ? 1 : 0 }
}

