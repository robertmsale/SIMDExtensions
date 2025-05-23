import Foundation
import simd
#if canImport(Accelerate)
import Accelerate
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(SceneKit)
import SceneKit
#endif
#if canImport(Darwin)
import Darwin
#elseif canImport(Glibc)
import Glibc
#elseif canImport(CRT) // Swift‑windows toolchain
import CRT
#else
#error("No known C standard library module for this platform")
#endif
public extension SIMD4<Double> {
    /// Calculates the Euclidean distance between this vector and another vector.
    ///
    /// This function returns the straight-line (L2) distance between `self` and the
    /// given vector `to`, using SIMD-accelerated distance calculation.
    ///
    /// - Parameter to: The target vector to which the distance is calculated.
    /// - Returns: The scalar distance as a value of type `Double` representing the
    ///   length of the vector connecting `self` to `to`.
    @inlinable func distance(to: SIMD4<Double>) -> Double { simd_distance(self, to) }
    /// Calculates the Euclidean distance between this vector and another vector.
    ///
    /// This function returns the straight-line (L2) distance between `self` and the
    /// given vector `to`, using SIMD-accelerated distance calculation.
    ///
    /// - Parameter to: The target vector to which the distance is calculated.
    /// - Returns: The scalar distance as a value of type `Double` representing the
    ///   length of the vector connecting `self` to `to`.
    @inlinable func distanceFast(to: SIMD4<Double>) -> Double { simd_fast_distance(self, to) }
    /// Calculates the Euclidean distance between this vector and another vector.
    ///
    /// This function returns the straight-line (L2) distance between `self` and the
    /// given vector `to`, using SIMD-accelerated distance calculation. More precise
    /// at the cost of less performance
    ///
    /// - Parameter to: The target vector to which the distance is calculated.
    /// - Returns: The scalar distance as a value of type `Double` representing the
    ///   length of the vector connecting `self` to `to`.
    @inlinable func distancePrecise(to: SIMD4<Double>) -> Double { simd_precise_distance(self, to) }
    /// Computes the length (magnitude) of the vector.
    ///
    /// This property returns the Euclidean norm (L2 norm) of the vector,
    /// calculated using the SIMD-accelerated `simd_length` function.
    ///
    /// - Returns: A scalar of type `Double` representing the vector's magnitude,
    ///   i.e., the distance from the origin to the point represented by `self`.
    @inlinable var length: Double { simd_length(self) }
    /// Computes the square root of each component of the vector.
    ///
    /// This computed property returns a new vector where each element is the
    /// square root of the corresponding element in `self`.  
    ///
    /// - Returns: A vector of the same type as `self` with the square root applied element-wise.
    ///
    /// - Note:  
    /// This operation assumes all components are non-negative. Passing negative values
    /// will result in NaNs according to the standard floating-point sqrt behavior.
    @inlinable var sqrt: SIMD4<Double> {
        _fallbackSqrt(self)
    }
    /// Computes the squared length (magnitude) of the vector.
    ///
    /// This property returns the sum of the squares of the vector’s components,
    /// which is the squared Euclidean norm.  
    /// Using the squared length avoids the computational cost of a square root
    /// when only relative distances or comparisons are needed.
    ///
    /// - Returns: A scalar of type `Double` representing the squared magnitude of the vector.
    @inlinable var lengthSquared: Double { simd_length_squared(self) }
    /// Computes the element-wise absolute value of the vector.
    ///
    /// This property returns a new vector where each component is the absolute value
    /// of the corresponding component in `self`, using the SIMD-accelerated `simd_abs` function.
    ///
    /// - Returns: A vector of the same type as `self` with all components converted to their absolute values.
    @inlinable var abs: Self { simd_abs(self) }
    /// Clamps each component of the vector between the specified minimum and maximum values.
    ///
    /// This function returns a new vector where each component of `self` is restricted
    /// to lie within the range defined by `min` and `max` parameters, inclusive.
    /// The operation is performed element-wise using the SIMD-accelerated `simd_clamp`.
    ///
    /// - Parameters:
    ///   - min: The minimum value to clamp each component to.
    ///   - max: The maximum value to clamp each component to.
    /// - Returns: A vector of the same type as `self` with each component clamped to the specified range.
    @inlinable func clamp(min: SIMD4<Double>, max: SIMD4<Double>) -> SIMD4<Double> { simd_clamp(self, min, max) }
    /// Clamps each component of the vector between the specified scalar minimum and maximum values.
    ///
    /// This function returns a new vector where each component of `self` is restricted
    /// to lie within the range defined by the scalar `min` and `max` values, inclusive.
    /// The scalar values are expanded to vectors with all components equal before clamping.
    /// The operation is performed element-wise using SIMD-accelerated `simd_clamp`.
    ///
    /// - Parameters:
    ///   - min: The scalar minimum value to clamp each component to.
    ///   - max: The scalar maximum value to clamp each component to.
    /// - Returns: A vector of the same type as `self` with each component clamped to the specified scalar range.
    @inlinable func clamp(min: Double, max: Double) -> SIMD4<Double> { simd_clamp(self, Self(repeating: min), Self(repeating: max)) }
    /// Computes the fractional part of each component of the vector.
    ///
    /// This property returns a new vector containing the fractional parts of
    /// each component in `self`. The fractional part is defined as the value
    /// minus its floor (i.e., `x - floor(x)`), effectively removing the integer part.
    ///
    /// The operation is performed element-wise using the SIMD-accelerated `simd_fract` function.
    ///
    /// - Returns: A vector of the same type as `self` containing the fractional parts of each component.
    @inlinable var fract: Self { simd_fract(self) }
    /// Computes the sign of each component of the vector.
    ///
    /// This property returns a new vector where each component is:
    /// - `1` if the original component is positive,
    /// - `-1` if the original component is negative,
    /// - `0` if the original component is zero.
    ///
    /// The operation is performed element-wise using the SIMD-accelerated `simd_sign` function.
    ///
    /// - Returns: A vector of the same type as `self` containing the sign of each component.
    @inlinable var sign: Self { simd_sign(self) }
    /// Computes the sum of all components in the vector.
    ///
    /// This property returns a scalar representing the result of adding
    /// all elements of the vector `self` together, using the SIMD-accelerated `simd_reduce_add`.
    ///
    /// - Returns: A scalar of type `Double` representing the sum of the vector’s components.
    @inlinable var reduceAdd: Double { simd_reduce_add(self) }
    /// Finds the maximum component value in the vector.
    ///
    /// This property returns the largest scalar value among all components of
    /// the vector `self`, using the SIMD-accelerated `simd_reduce_max` function.
    ///
    /// - Returns: A scalar of type `Double` representing the maximum component value.
    @inlinable var max: Double { simd_reduce_max(self) }
    /// Finds the minimum component value in the vector.
    ///
    /// This property returns the smallest scalar value among all components of
    /// the vector `self`, using the SIMD-accelerated `simd_reduce_min` function.
    ///
    /// - Returns: A scalar of type `Double` representing the minimum component value.
    @inlinable var min: Double { simd_reduce_min(self) }
    /// Performs a linear interpolation between this vector and another vector.
    ///
    /// This function returns the point along the line between `self` and `with`
    /// corresponding to the interpolation parameter `alpha`.
    ///
    /// The interpolation is defined as:
    /// ```
    /// lerp = self * (1 - alpha) + with * alpha
    /// ```
    ///
    /// - Parameters:
    ///   - with: The target vector to interpolate towards.
    ///   - alpha: The interpolation factor, typically in the range [0, 1].
    ///            A value of 0 returns `self`, and 1 returns `with`.
    /// - Returns: A new vector representing the linear interpolation result.
    ///
    /// - Note:  
    /// Values of `alpha` outside the range [0, 1] will extrapolate beyond the endpoints.
    @inlinable func lerp(with: SIMD4<Double>, by alpha: SIMD4<Double>) -> Self { simd_mix(self, with, alpha) }
    /// Performs a linear interpolation between this vector and another vector using a scalar alpha.
    ///
    /// This function returns the point along the line between `self` and `with`
    /// corresponding to the scalar interpolation parameter `alpha`, which is
    /// broadcast to all vector components.
    ///
    /// The interpolation is defined as:
    /// ```
    /// lerp = self * (1 - alpha) + with * alpha
    /// ```
    ///
    /// - Parameters:
    ///   - with: The target vector to interpolate towards.
    ///   - alpha: The scalar interpolation factor, typically in the range [0, 1].
    ///            A value of 0 returns `self`, and 1 returns `with`.
    /// - Returns: A new vector representing the linear interpolation result.
    ///
    /// - Note:  
    /// Values of `alpha` outside the range [0, 1] will extrapolate beyond the endpoints.
    @inlinable func lerp(with: SIMD4<Double>, by alpha: Double) -> Self { simd_mix(self, with, Self(repeating: alpha)) }
    /// Performs a smooth Hermite interpolation between this vector and another vector.
    ///
    /// This function returns an interpolation between `self` and `with` controlled
    /// by `alpha`, where the interpolation parameter is smoothed using the smoothstep
    /// function:
    /// ```
    /// smoothstep(t) = t * t * (3 - 2 * t)
    /// ```
    ///
    /// The result transitions smoothly from `self` to `with` as `alpha` goes from 0 to 1,
    /// with zero derivatives at the endpoints, avoiding abrupt changes.
    ///
    /// - Parameters:
    ///   - with: The target vector to interpolate towards.
    ///   - alpha: The interpolation parameter, generally in the range [0, 1].
    /// - Returns: A new vector representing the smoothstep interpolation result.
    ///
    /// - Note:  
    /// Values of `alpha` outside [0, 1] may produce extrapolated results.
    @inlinable func smoothstep(with: SIMD4<Double>, by alpha: SIMD4<Double>) -> Self { simd_smoothstep(self, with, alpha) }
    /// Computes the reciprocal (element-wise inverse) of the vector.
    ///
    /// This property returns a new vector where each component is the reciprocal of
    /// the corresponding component in `self`, calculated using the SIMD-accelerated `simd_recip`.
    ///
    /// - Returns: A vector of the same type as `self` with each component replaced by its reciprocal.
    ///
    /// - Warning:  
    /// Components with a value of zero will result in infinities or NaNs according to
    /// standard floating-point division behavior.
    @inlinable var recip: Self { simd_recip(self) }
    /// Computes the reciprocal (element-wise inverse) of the vector.
    ///
    /// This property returns a new vector where each component is the reciprocal of
    /// the corresponding component in `self`, calculated using the SIMD-accelerated `simd_fast_recip`.
    ///
    /// - Returns: A vector of the same type as `self` with each component replaced by its reciprocal.
    ///
    /// - Warning:  
    /// Components with a value of zero will result in infinities or NaNs according to
    /// standard floating-point division behavior.
    @inlinable var recipFast: Self { simd_fast_recip(self) }
    /// Computes the reciprocal (element-wise inverse) of the vector.
    ///
    /// This property returns a new vector where each component is the reciprocal of
    /// the corresponding component in `self`, calculated using the SIMD-accelerated `simd_precise_recip`.
    ///
    /// - Returns: A vector of the same type as `self` with each component replaced by its reciprocal.
    ///
    /// - Warning:  
    /// Components with a value of zero will result in infinities or NaNs according to
    /// standard floating-point division behavior.
    @inlinable var recipPrecise: Self { simd_precise_recip(self) }
    /// Computes the reciprocal square root of each component of the vector.
    ///
    /// This property returns a new vector where each component is the reciprocal of the square root
    /// of the corresponding component in `self`, using the SIMD-accelerated `simd_rsqrt` function.
    ///
    /// - Returns: A vector of the same type as `self` containing the reciprocal square roots of each component.
    ///
    /// - Warning:  
    /// Components with zero or negative values may produce infinities or NaNs according to
    /// standard floating-point behavior.
    @inlinable var rsqrt: Self { simd_rsqrt(self) }
    /// Computes the reciprocal square root of each component of the vector.
    ///
    /// This property returns a new vector where each component is the reciprocal of the square root
    /// of the corresponding component in `self`, using the SIMD-accelerated `simd_fast_rsqrt` function.
    ///
    /// - Returns: A vector of the same type as `self` containing the reciprocal square roots of each component.
    ///
    /// - Warning:  
    /// Components with zero or negative values may produce infinities or NaNs according to
    /// standard floating-point behavior.
    @inlinable var rsqrtFast: Self { simd_fast_rsqrt(self) }
    /// Computes the reciprocal square root of each component of the vector.
    ///
    /// This property returns a new vector where each component is the reciprocal of the square root
    /// of the corresponding component in `self`, using the SIMD-accelerated `simd_precise_rsqrt` function.
    ///
    /// - Returns: A vector of the same type as `self` containing the reciprocal square roots of each component.
    ///
    /// - Warning:  
    /// Components with zero or negative values may produce infinities or NaNs according to
    /// standard floating-point behavior.
    @inlinable var rsqrtPrecise: Self { simd_precise_rsqrt(self) }
    /// Computes the exponential (e^x) of each component of the vector.
    ///
    /// This property returns a new vector where each component is the value of
    /// Euler’s number \( e \) raised to the power of the corresponding component in `self`,
    /// using the SIMD-accelerated `simd.exp` function.
    ///
    /// - Returns: A vector of the same type as `self` containing the exponentials of each component.
    @inlinable var exp: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.exp(self)
        }
        return _fallbackExp(self)
    }
    /// Computes 2 raised to the power of each component of the vector.
    ///
    /// This property returns a new vector where each component is \( 2^{x} \),
    /// where \( x \) is the corresponding component in `self`, using the SIMD-accelerated `simd.exp2` function.
    ///
    /// - Returns: A vector of the same type as `self` containing \( 2^{x} \) for each component.
    @inlinable var exp2: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.exp2(self)
        }
        return _fallbackExp2(self)
    }
    /// Computes 10 raised to the power of each component of the vector.
    ///
    /// This property returns a new vector where each component is \( 10^{x} \),
    /// where \( x \) is the corresponding component in `self`, using the SIMD-accelerated `simd.exp10` function.
    ///
    /// - Returns: A vector of the same type as `self` containing \( 10^{x} \) for each component.
    @inlinable var exp10: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.exp10(self)
        }
        return _fallbackExp10(self)
    }
    /// Computes \( e^{x} - 1 \) for each component of the vector.
    ///
    /// This property returns a new vector where each component is calculated as
    /// \( e^{x} - 1 \), using the SIMD-accelerated `simd.expm1` function.  
    /// The `expm1` function provides greater precision than `exp(x) - 1`
    /// especially for values of `x` near zero.
    ///
    /// - Returns: A vector of the same type as `self` containing \( e^{x} - 1 \) for each component.
    @inlinable var expm1: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.expm1(self)
        }
        return _fallbackExpm1(self)
    }
    /// Computes the natural logarithm (base \(e\)) of each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this property
    /// uses the optimized `simd.log` function for vectorized computation.
    ///
    /// On earlier OS versions or unsupported platforms, it falls back to computing
    /// the logarithm element-wise by calling the scalar `log` method on each component.
    ///
    /// - Returns: A vector of the same type as `self` containing the natural logarithm of each component.
    ///
    /// - Note:  
    /// This implementation assumes all components are positive, as the logarithm
    /// of zero or negative values is undefined and will produce NaNs or infinities.
    @inlinable var log: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.log(self)
        }
        return _fallbackLog(self)
    }
    /// Computes the base-2 logarithm of each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this property
    /// uses the optimized `simd.log2` function for vectorized computation.
    ///
    /// On earlier OS versions or unsupported platforms, it falls back to computing
    /// the logarithm base 2 element-wise by calling the scalar `log2` method on each component.
    ///
    /// - Returns: A vector of the same type as `self` containing the base-2 logarithm of each component.
    ///
    /// - Note:  
    /// This implementation assumes all components are positive, as the logarithm
    /// of zero or negative values is undefined and will produce NaNs or infinities.
    @inlinable var log2: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.log2(self)
        }
        return _fallbackLog2(self)
    }
    /// Computes the base-10 logarithm of each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this property
    /// uses the optimized `simd.log10` function for vectorized computation.
    ///
    /// On earlier OS versions or unsupported platforms, it falls back to computing
    /// the base-10 logarithm element-wise by calling the scalar `log10` method on each component.
    ///
    /// - Returns: A vector of the same type as `self` containing the base-10 logarithm of each component.
    ///
    /// - Note:  
    /// This implementation assumes all components are positive, as the logarithm
    /// of zero or negative values is undefined and will produce NaNs or infinities.
    @inlinable var log10: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.log10(self)
        }
        return _fallbackLog10(self)
    }
    /// Computes the natural logarithm of (1 + x) for each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this property
    /// uses the optimized `simd.log1p` function for vectorized computation.
    ///
    /// On earlier OS versions or unsupported platforms, it falls back to computing
    /// the scalar `log1p` function element-wise on each component.
    ///
    /// This function provides greater precision than computing `log(1 + x)`
    /// directly, especially for values of `x` near zero.
    ///
    /// - Returns: A vector of the same type as `self` containing the natural logarithm of (1 + x) for each component.
    ///
    /// - Note:  
    /// This implementation assumes input values such that (1 + x) is positive,
    /// as the logarithm of zero or negative values is undefined.
    @inlinable var log1p: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.log1p(self)
        }
        return _fallbackLog1p(self)
    }
    /// Computes the inverse hyperbolic cosine (acosh) of each element in the SIMD vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.acosh` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a pure Swift implementation
    /// of `acosh(x) = log(x + sqrt(x * x - 1))`, applied element-wise.
    ///
    /// - Note: The fallback implementation may be less performant and less precise than the
    ///   native SIMD function.
    ///
    @inlinable var acosh: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.acosh(self)
        }
        // Fallback implementation for unsupported platforms or earlier OS versions
        return _fallbackAcosh(self)
    }
    /// Computes the inverse hyperbolic sine (asinh) of each element in the SIMD vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.asinh` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a pure Swift implementation
    /// of `asinh(x) = log(x + sqrt(x * x + 1))`, applied element-wise.
    ///
    /// - Note: The fallback implementation may be less performant and less precise than the
    ///   native SIMD function.
    @inlinable var asinh: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.asinh(self)
        }
        // Fallback implementation for unsupported platforms or earlier OS versions
        return _fallbackAsinh(self)
    }
    /// Computes the inverse hyperbolic tangent (atanh) of each element in the SIMD vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.atanh` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a pure Swift implementation
    /// of `atanh(x) = 0.5 * log((1 + x) / (1 - x))`, applied element-wise.
    ///
    /// - Note: The fallback implementation may be less performant and less precise than the
    ///   native SIMD function.  
    ///   Additionally, input values must satisfy \(-1 < x < 1\); values outside this range
    ///   will produce NaNs or infinities.
    @inlinable var atanh: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.atanh(self)
        }
        // Fallback implementation for unsupported platforms or earlier OS versions
        return _fallbackAtanh(self)
    }
    /// Computes the hyperbolic cosine (cosh) of each element in the SIMD vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.cosh` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a pure Swift implementation
    /// of \(\cosh(x) = \frac{e^{x} + e^{-x}}{2}\), applied element-wise.
    ///
    /// - Note: The fallback implementation may be less performant and less precise than the
    ///   native SIMD function.
    @inlinable var cosh: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.cosh(self)
        }
        return _fallbackCosh(self)
    }
    /// Computes the hyperbolic sine (sinh) of each element in the SIMD vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.sinh` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a pure Swift implementation
    /// of \(\sinh(x) = \frac{e^{x} - e^{-x}}{2}\), applied element-wise.
    ///
    /// - Note: The fallback implementation may be less performant and less precise than the
    ///   native SIMD function.
    @inlinable var sinh: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.sinh(self)
        }
        return _fallbackSinh(self)
    }
    /// Computes the hyperbolic tangent (tanh) of each element in the SIMD vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.tanh` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a pure Swift implementation
    /// of \(\tanh(x) = \frac{e^{x} - e^{-x}}{e^{x} + e^{-x}}\), applied element-wise.
    ///
    /// - Note: The fallback implementation may be less performant and less precise than the
    ///   native SIMD function.
    @inlinable var tanh: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.tanh(self)
        }
        return _fallbackTanh(self)
    }
    /// Computes the cube root of each element in the SIMD vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.cbrt` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a pure Swift implementation
    /// of \(\sqrt[3]{x} = x^{1/3}\), applied element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the cube root of each component.
    ///
    /// - Note:  
    /// The fallback implementation may be less performant and less precise than the native SIMD function.
    @inlinable var cbrt: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.cbrt(self)
        }
        return _fallbackCbrt(self)
    }
    /// Computes the dot product of this vector with another vector.
    ///
    /// The dot product is the sum of the products of corresponding components of the two vectors,
    /// producing a scalar value. It is widely used in graphics, physics, and linear algebra
    /// to measure similarity, projection, and angles between vectors.
    ///
    /// - Parameter with: The other vector to perform the dot product with.
    /// - Returns: A scalar of type `Double` representing the dot product result.
    @inlinable func dot(with: Self) -> Double { simd_dot(self, with) }
    /// Returns the normalized (unit length) vector pointing in the same direction as `self`.
    ///
    /// This property computes the vector scaled to have a length of 1, preserving direction.
    /// If the vector has zero length, the behavior depends on the underlying SIMD implementation.
    ///
    /// - Returns: A vector of the same type as `self` normalized to unit length.
    @inlinable var normalized: Self { simd_normalize(self) }
    /// Returns the normalized (unit length) vector pointing in the same direction as `self`.
    ///
    /// This property computes the vector scaled to have a length of 1, preserving direction.
    /// If the vector has zero length, the behavior depends on the underlying SIMD implementation.
    ///
    /// - Returns: A vector of the same type as `self` normalized to unit length.
    @inlinable var normalizedFast: Self { simd_fast_normalize(self) }
    /// Returns the normalized (unit length) vector pointing in the same direction as `self`.
    ///
    /// This property computes the vector scaled to have a length of 1, preserving direction.
    /// If the vector has zero length, the behavior depends on the underlying SIMD implementation.
    ///
    /// - Returns: A vector of the same type as `self` normalized to unit length.
    @inlinable var normalizedPrecise: Self { simd_precise_normalize(self) }
    /// Projects `self` onto the vector `to`.
    ///
    /// This function calculates the vector projection of `self` onto the vector `to`,
    /// returning the component of `self` that lies in the direction of `to`.
    ///
    /// Mathematically, the projection is defined as:
    /// ```
    /// projection = (self ⋅ to / |to|²) * to
    /// ```
    ///
    /// - Parameter to: The vector onto which to project `self`.
    /// - Returns: The vector projection of `self` onto `to`.
    @inlinable func project(on to: Self) -> Self { simd_project(self, to) }
    /// Quickly projects `self` onto the vector `to` using a fast approximation.
    ///
    /// This function performs a vector projection of `self` onto `to` similar to `project(on:)`,
    /// but uses a faster, potentially less precise algorithm optimized for performance.
    ///
    /// - Parameter to: The vector onto which to project `self`.
    /// - Returns: An approximate projection vector of `self` onto `to`.
    @inlinable func projectFast(on to: Self) -> Self { simd_fast_project(self, to) }
    /// Projects `self` onto the vector `to` with high precision.
    ///
    /// This function calculates the vector projection of `self` onto `to`
    /// using a more precise algorithm than `projectFast(on:)`, prioritizing accuracy over performance.
    ///
    /// - Parameter to: The vector onto which to project `self`.
    /// - Returns: A precisely computed projection vector of `self` onto `to`.
    @inlinable func projectPrecise(on to: Self) -> Self { simd_precise_project(self, to) }
    /// Computes the error function (erf) of each element in the SIMD vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this property
    /// uses the optimized `simd.erf` function provided by the SIMD library.
    ///
    /// - Returns: A vector of the same type as `self` containing the error function values of each component.
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    @inlinable var erf: Self { simd.erf(self) }
    /// Computes the complementary error function (erfc) of each element in the SIMD vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this property
    /// uses the optimized `simd.erfc` function provided by the SIMD library.
    ///
    /// - Returns: A vector of the same type as `self` containing the complementary error function values of each component.
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    @inlinable var erfc: Self { simd.erfc(self) }
    /// Performs a fused multiply-add (FMA) operation element-wise on three vectors.
    ///
    /// This function computes `(self * a) + b` for each corresponding element,
    /// performing the multiplication and addition as a single operation with
    /// only one rounding step for improved precision and performance.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.fma` function provided by the SIMD library.
    ///
    /// - Parameters:
    ///   - a: The vector to multiply with `self`.
    ///   - b: The vector to add to the product.
    /// - Returns: A vector of the same type as `self` containing the fused multiply-add results.
    @inlinable func fma(_ a: Self, _ b: Self) -> Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.fma(self, a, b)
        }
        return (self * a) + b
    }
    /// Computes the floating-point remainder of the division of each component of `self` by `other`.
    ///
    /// This function returns the result of `self % other` for each corresponding element,
    /// following the IEEE 754 floating-point remainder semantics.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.fmod` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a pure Swift element-wise
    /// implementation of the floating-point remainder.
    ///
    /// - Parameter other: The divisor vector.
    /// - Returns: A vector of the same type as `self` containing the remainders.
    ///
    /// - Note:  
    /// The fallback implementation may be less performant and less precise than the native SIMD function.
    @inlinable func fmod(_ other: Self) -> Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.fmod(self, other)
        }
        return _fallbackFmod(self, other)
    }
    /// Raises each component of the vector to the power of the given scalar.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.pow` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackPow`
    /// function that computes the power element-wise.
    ///
    /// - Parameter of: The scalar exponent to raise each component to.
    /// - Returns: A vector of the same type as `self` with each component raised to the power `of`.
    @inlinable func pow(_ of: SIMD4<Double>) -> Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.pow(self, of)
        }
        return _fallbackPow(self, of)
    }
    /// Raises each component of the vector to the power of the given scalar.
    ///
    /// This function creates a vector where each component is the scalar `of`,
    /// then calls the vectorized `pow` function to perform element-wise exponentiation.
    ///
    /// - Parameter of: The scalar exponent to raise each component to.
    /// - Returns: A vector of the same type as `self` with each component raised to the power `of`.
    @inlinable func pow(_ of: Double) -> Self {
        pow(Self(repeating: of))
    }
    /// Returns a vector where each element is rounded to the nearest integer.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.round` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackRound`
    /// function that rounds each component element-wise.
    ///
    /// - Returns: A vector of the same type as `self` with each component rounded to the nearest integer.
    @inlinable var rounded: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.round(self)
        }
        return _fallbackRound(self)
    }
    /// Computes the arccosine (inverse cosine) of each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.acos` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackAcos`
    /// function that computes the arccosine element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the arccosine of each component.
    ///
    /// - Note:  
    /// Input values should be in the range [-1, 1]; values outside this range may produce NaNs.
    @inlinable var acos: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.acos(self)
        }
        return _fallbackAcos(self)
    }
    /// Computes the arcsine (inverse sine) of each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.asin` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackAsin`
    /// function that computes the arcsine element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the arcsine of each component.
    ///
    /// - Note:  
    /// Input values should be in the range [-1, 1]; values outside this range may produce NaNs.
    @inlinable var asin: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.asin(self)
        }
        return _fallbackAsin(self)
    }
    /// Computes the arctangent (inverse tangent) of each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.atan` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackAtan`
    /// function that computes the arctangent element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the arctangent of each component.
    @inlinable var atan: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.atan(self)
        }
        return _fallbackAtan(self)
    }
    /// Computes the cosine of each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.cos` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackCos`
    /// function that computes the cosine element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the cosine of each component.
    @inlinable var cos: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.cos(self)
        }
        return _fallbackCos(self)
    }
    /// Computes the cosine of each component multiplied by π (cos(π * x)).
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.cospi` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackCospi`
    /// function that computes `cos(π * x)` element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the cosine of π times each component.
    @inlinable var cospi: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.cospi(self)
        }
        return _fallbackCospi(self)
    }
    /// Computes the sine of each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.sin` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackSin`
    /// function that computes the sine element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the sine of each component.
    @inlinable var sin: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.sin(self)
        }
        return _fallbackSin(self)
    }
    /// Computes the sine of each component multiplied by π (sin(π * x)).
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.sinpi` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackSinpi`
    /// function that computes `sin(π * x)` element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the sine of π times each component.
    @inlinable var sinpi: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.sinpi(self)
        }
        return _fallbackSinpi(self)
    }
    /// Computes the tangent of each component of the vector.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.tan` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackTan`
    /// function that computes the tangent element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the tangent of each component.
    @inlinable var tan: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.tan(self)
        }
        return _fallbackTan(self)
    }
    /// Computes the tangent of each component multiplied by π (tan(π * x)).
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.tanpi` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackTanpi`
    /// function that computes `tan(π * x)` element-wise.
    ///
    /// - Returns: A vector of the same type as `self` containing the tangent of π times each component.
    @inlinable var tanpi: Self { 
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.tanpi(self)
        }
        return _fallbackTanpi(self)
    }
    /// Provides safe access to the SIMD vector elements as a Swift array of scalars (`Double`).
    ///
    /// The getter returns an array constructed element-by-element from the SIMD vector,
    /// ensuring a safe, direct mapping without unsafe memory operations.
    ///
    /// The setter safely assigns values from the input array to the SIMD vector elements one by one.
    /// - It checks for an empty array and does nothing if so.
    /// - It copies up to the smaller of the SIMD vector length or the array length,
    ///   preventing out-of-bounds access and avoiding crashes.
    ///
    /// This approach sacrifices some performance compared to unsafe casts,
    /// but it guarantees safety even if the input array has fewer elements than the SIMD vector.
    var asArray: [Double] {
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
    /// Alias for `asArray`, providing identical safe get and set behavior.
    ///
    /// This alias exists for readability or semantic clarity in different contexts,
    /// but is functionally equivalent to `asArray`.
    var asSafeArray: [Double] {
        get { asArray }
        set(v) { asArray = v }
    }
    /// Reinterpret cast of SIMD vector as a Swift array of its scalar elements.
    /// 
    /// This computed property provides a way to access the underlying SIMD data as a regular array,
    /// without copying elements individually. It uses unsafe memory operations to bind and 
    /// reinterpret the SIMD memory as an array of scalars (`Double`).
    ///
    /// **Warning:** This property is inherently unsafe if the array used to set the value (`set`) 
    /// does not exactly match the size of the underlying SIMD type.  
    /// - If the array is shorter or longer than the SIMD vector length, the memory binding will either 
    ///   leave elements uninitialized or overwrite memory incorrectly, leading to undefined behavior.
    /// - Always ensure that any array passed to `asFastArray`'s setter has the exact number of elements 
    ///   as the SIMD vector to maintain memory safety and prevent crashes or data corruption.
    var asFastArray: [Double] {
        get {
            withUnsafeBytes(of: self) { $0.load(as: Array<Double>.self) }
        } set(v) {
            withUnsafeBytes(of: v) { self = $0.load(as: SIMD4<Double>.self) }
        }
    }
    @inlinable var reversed: Self {
        Self(asArray.reversed())
    }
    /// Computes the Manhattan distance (L1 norm) between this vector and another vector.
    ///
    /// The Manhattan distance is the sum of the absolute differences of their corresponding components.
    /// This function returns the absolute component-wise difference vector between `self` and `to`.
    ///
    /// - Parameter to: The target vector to compute the distance to.
    /// - Returns: A vector representing the component-wise absolute difference between `self` and `to`.
    @inlinable func manhattanDistance(to: Self) -> Self {
        (self - to).abs
    }
    /// Initializes the vector from an array of scalar components.
    ///
    /// This initializer creates a new vector by copying values from the provided
    /// array into the vector’s components via the `asArray` property.
    ///
    /// - Parameter array: An array of scalar values (`Double`) to initialize the vector with.
    ///                    The array should have the same length as the vector’s component count.
    ///                    If the array length is less than the vector size, remaining components
    ///                    will be left uninitialized or defaulted.
    ///
    /// - Note:  
    /// The initializer does not perform bounds checking on the array length.
    @inlinable init(array: [Double]) {
        self.init()
        asArray = array
    }
    /// Reflects the vector about the given normal vector.
    ///
    /// This function computes the reflection of `self` around the `normal` vector,
    /// following the formula:
    /// ```
    /// reflection = self - 2 * dot(self, normal) * normal
    /// ```
    ///
    /// - Parameter normal: The normal vector to reflect `self` on. It is assumed to be normalized.
    /// - Returns: The reflected vector.
    @inlinable func reflect(on normal: Self) -> Self { simd_reflect(self, normal) }
    /// Computes the refraction vector of `self` on the given surface normal using the specified index of refraction.
    ///
    /// This function calculates the direction of a refracted ray passing through a surface,
    /// based on Snell’s law. It uses the incident vector `self`, the surface `normal`,
    /// and the ratio of indices of refraction `of`.
    ///
    /// - Parameters:
    ///   - normal: The normal vector of the surface. It is assumed to be normalized.
    ///   - of: The ratio of indices of refraction (usually \( \eta_{incident} / \eta_{transmitted} \)).
    /// - Returns: The refracted vector. If total internal reflection occurs, the result is a zero vector.
    @inlinable func refract(on normal: Self, idx of: Double) -> Self { simd_refract(self, normal, of) }
    /// Returns a vector where each component is rounded up to the nearest integer.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.ceil` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackCeil`
    /// function that computes the ceiling element-wise.
    ///
    /// - Returns: A vector of the same type as `self` with each component rounded up.
    @inlinable var asCeil: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.ceil(self)
        }
        return _fallbackCeil(self)
    }
    /// Returns a vector where each component is rounded down to the nearest integer.
    ///
    /// On supported platforms (macOS 12+, iOS 15+, tvOS 15+, watchOS 8+), this uses the
    /// optimized `simd.floor` function provided by the SIMD library.
    ///
    /// On other platforms or earlier OS versions, it falls back to a custom `_fallbackFloor`
    /// function that computes the floor element-wise.
    ///
    /// - Returns: A vector of the same type as `self` with each component rounded down.
    @inlinable var floor: Self {
        if #available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *) {
            return simd.floor(self)
        }
        return _fallbackFloor(self)
    }
    /// Returns a vector where each component is truncated toward zero.
    ///
    /// This property removes the fractional part of each component in `self`,
    /// effectively rounding each component toward zero.
    ///
    /// - Returns: A vector of the same type as `self` with each component truncated.
    @inlinable var trunc: Self { simd.trunc(self) }
    /// Initializes a quaternion representing a rotation around a given axis by a specified angle.
    ///
    /// The quaternion is constructed from an axis-angle representation where `axis` is a unit vector
    /// defining the rotation axis, and `rad` is the rotation angle in radians.
    ///
    /// - Parameters:
    ///   - axis: A `SIMD3` vector representing the rotation axis (should be normalized).
    ///   - rad: The rotation angle in radians.
    /// 
    /// The quaternion components are calculated as:
    /// ```
    /// q = (axis.x * sin(θ/2), axis.y * sin(θ/2), axis.z * sin(θ/2), cos(θ/2))
    /// ```
    /// where θ = `rad`.
    init(axis: SIMD3<Double>, rad: Double) {
        let halfAngle = rad / 2
        let s = Foundation.sin( halfAngle )
        self.init(axis.x * s, axis.y * s, axis.z * s, Foundation.cos( halfAngle ))
    }
    /// Initializes a quaternion from Euler angles with a specified rotation order.
    ///
    /// The Euler angles represent rotations about the x, y, and z axes, applied in the specified order.
    /// This initializer converts the Euler angles (in radians) into a quaternion representing the
    /// combined rotation.
    ///
    /// - Parameters:
    ///   - euler: A `SIMD3<Double>` containing the rotation angles (in radians) around the x, y, and z axes.
    ///   - order: The order in which rotations are applied.  
    ///            Common orders include `.XYZ`, `.YXZ`, `.ZXY`, `.ZYX`, `.YZX`, `.XZY`.
    ///
    /// The quaternion components are computed by calculating the sine and cosine of half-angles
    /// and combining them according to the selected rotation order.
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
    /// Initializes a quaternion from a 3x3 rotation matrix.
    ///
    /// This initializer converts a rotation matrix into a quaternion representation.
    /// The input matrix is expected to be a valid rotation matrix (orthonormal, determinant 1).
    ///
    /// - Parameter matrix: A 3x3 rotation matrix of type `simd_double3x3`.
    ///
    /// The conversion uses the standard algorithm based on the matrix trace to ensure numerical stability.
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
    /// Initializes a quaternion representing the rotation from one unit vector to another.
    ///
    /// This initializer computes the quaternion that rotates the `from` vector to align with the `to` vector.
    /// Both `from` and `to` should be normalized (unit length) vectors.
    ///
    /// - Parameters:
    ///   - from: The starting unit vector.
    ///   - to: The target unit vector.
    ///
    /// The algorithm handles the special case where the vectors point in opposite directions,
    /// producing a 180-degree rotation around an orthogonal axis.
    ///
    /// After construction, the quaternion is normalized to ensure a valid rotation.
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
    /// Calculates the angle (in radians) between this quaternion and another quaternion.
    ///
    /// The angle is computed using the dot product and the arccosine function, representing
    /// the smallest rotation angle needed to rotate from `self` to `to`.
    ///
    /// - Parameter to: The target quaternion to measure the angle to.
    /// - Returns: The rotation angle in radians as a scalar of type `Double`.
    ///
    /// - Note:
    /// The dot product is clamped between -1 and 1 to avoid invalid inputs to `acos`
    /// due to floating-point precision errors.
    @inlinable func angle(to: Self) -> Double {
        2 * Foundation.acos(Swift.abs((self.dot(with: to)).clamp(-1, 1)))
    }
    /// Rotates the quaternion towards another quaternion by a limited step size.
    ///
    /// This function performs a smooth interpolation (slerp) from `self` to `towards`,
    /// advancing by at most `step` radians. If the angle between the quaternions is smaller
    /// than `step`, it returns `towards` exactly.
    ///
    /// - Parameters:
    ///   - towards: The target quaternion to rotate towards.
    ///   - step: The maximum angle in radians to rotate in this step.
    /// - Returns: A new quaternion rotated towards `towards` by up to `step` radians.
    ///
    /// - Note:
    /// If the angle to `towards` is zero (quaternions are the same), the function returns `self`.
    /// The interpolation parameter `t` is clamped to [0, 1] based on the ratio of `step` to angle.
    @inlinable func rotate(towards: Self, step: Double) -> Self {
        let ang = angle(to: towards)
        if (ang == 0) {return self}
        let t = Swift.min(1, step / ang)
        return slerp( quat: towards, t: t )
    }
    /// Performs spherical linear interpolation (slerp) between this quaternion and another.
    ///
    /// This function interpolates smoothly between `self` and `quat` by the fraction `t`,
    /// where `t` ranges from 0 (returning `self`) to 1 (returning `quat`).  
    /// Slerp ensures constant angular velocity and the shortest path interpolation on the unit quaternion sphere.
    ///
    /// - Parameters:
    ///   - quat: The target quaternion to interpolate towards.
    ///   - t: The interpolation parameter in [0, 1].
    /// - Returns: A new quaternion interpolated between `self` and `quat`.
    ///
    /// - Note:
    /// If the quaternions are nearly identical or the interpolation fraction is 0 or 1,
    /// the function returns early for efficiency.
    /// If the quaternions have opposite handedness (dot product negative),
    /// it negates `quat` to ensure the shortest interpolation path.
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
    /// Returns the inverse (conjugate) of the quaternion.
    ///
    /// For unit quaternions, the inverse is the conjugate, which negates the vector part
    /// (`x`, `y`, `z`) and leaves the scalar part (`w`) unchanged.
    ///
    /// - Returns: A new quaternion representing the inverse of `self`.
    @inlinable var invert: Self { Self(-x, -y, -z, w) }
    /// Multiplies this quaternion by another quaternion.
    ///
    /// Quaternion multiplication combines rotations represented by the two quaternions.
    /// The multiplication is non-commutative, meaning the order matters.
    ///
    /// This implementation uses vectorized operations and a specific SIMD-friendly
    /// decomposition to efficiently compute the product.
    ///
    /// - Parameter by: The quaternion to multiply with `self`.
    /// - Returns: A new quaternion representing the product `self * by`.
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
    /// Pre-multiplies this quaternion by another quaternion.
    ///
    /// This function returns the result of multiplying `by` by `self` (i.e., `by * self`),
    /// which is useful in cases where order of multiplication matters, such as applying
    /// rotations in sequence.
    ///
    /// - Parameter by: The quaternion to multiply before `self`.
    /// - Returns: The product quaternion resulting from `by * self`.
    @inlinable func preMultiply(by: Self) -> Self {
        return by.multiply(by: self)
    }
#if canImport(SwiftUI)
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    @inlinable var asColor: Color {
        let norm = normalized
        return Color(red: Double(norm.x), green: Double(norm.y), blue: Double(norm.z), opacity: Double(norm.w))
    }
#endif
#if canImport(UIKit)
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    @inlinable var asUIColor: UIColor {
        let norm = normalized
        return UIColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: CGFloat(norm.w))
    }
#endif
#if canImport(CoreGraphics)
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    @inlinable var asCGColor: CGColor {
        let norm = normalized
        return CGColor(red: CGFloat(norm.x), green: CGFloat(norm.y), blue: CGFloat(norm.z), alpha: CGFloat(norm.w))
    }
#endif
}
