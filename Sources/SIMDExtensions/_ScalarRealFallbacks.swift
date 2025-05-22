@inlinable func _fallbackAcos<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._acos(x[lane])
    }
    return result
}

@inlinable func _fallbackAcosh<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._acosh(x[lane])
    }
    return result
}

@inlinable func _fallbackAsin<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._asin(x[lane])
    }
    return result
}

@inlinable func _fallbackAsinh<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._asinh(x[lane])
    }
    return result
}

@inlinable func _fallbackAtan<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._atan(x[lane])
    }
    return result
}

@inlinable func _fallbackAtan2<V: SIMD>(_ x: V, _ y: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._atan2(x[lane], y[lane])
    }
    return result
}

@inlinable func _fallbackAtanh<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._atanh(x[lane])
    }
    return result
}

@inlinable func _fallbackCbrt<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._cbrt(x[lane])
    }
    return result
}

@inlinable func _fallbackCeil<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._ceil(x[lane])
    }
    return result
}

@inlinable func _fallbackCos<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._cos(x[lane])
    }
    return result
}

@inlinable func _fallbackCosh<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._cosh(x[lane])
    }
    return result
}

@inlinable func _fallbackCospi<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._cospi(x[lane])
    }
    return result
}

@inlinable func _fallbackExp<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._exp(x[lane])
    }
    return result
}

@inlinable func _fallbackExp10<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._exp10(x[lane])
    }
    return result
}

@inlinable func _fallbackExp2<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._exp2(x[lane])
    }
    return result
}

@inlinable func _fallbackExpm1<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._expm1(x[lane])
    }
    return result
}

@inlinable func _fallbackFloor<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._floor(x[lane])
    }
    return result
}

@inlinable func _fallbackFma<V: SIMD>(_ x: V, _ y: V, _ z: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._fma(x[lane], y[lane], z[lane])
    }
    return result
}

@inlinable func _fallbackFmod<V: SIMD>(_ x: V, _ y: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._fmod(x[lane], y[lane])
    }
    return result
}

@inlinable func _fallbackHypot<V: SIMD>(_ x: V, _ y: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._hypot(x[lane], y[lane])
    }
    return result
}

@inlinable func _fallbackLgamma<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._lgamma(x[lane])
    }
    return result
}

@inlinable func _fallbackLog<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._log(x[lane])
    }
    return result
}

@inlinable func _fallbackLog10<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._log10(x[lane])
    }
    return result
}

@inlinable func _fallbackLog1p<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._log1p(x[lane])
    }
    return result
}

@inlinable func _fallbackLog2<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._log2(x[lane])
    }
    return result
}

@inlinable func _fallbackNextafter<V: SIMD>(_ x: V, _ y: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._nextafter(x[lane], y[lane])
    }
    return result
}

@inlinable func _fallbackPow<V: SIMD>(_ x: V, _ y: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._pow(x[lane], y[lane])
    }
    return result
}

@inlinable func _fallbackRemainder<V: SIMD>(_ x: V, _ y: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._remainder(x[lane], y[lane])
    }
    return result
}

@inlinable func _fallbackRound<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._round(x[lane])
    }
    return result
}

@inlinable func _fallbackSin<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._sin(x[lane])
    }
    return result
}

@inlinable func _fallbackSinh<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._sinh(x[lane])
    }
    return result
}

@inlinable func _fallbackSinpi<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._sinpi(x[lane])
    }
    return result
}

@inlinable func _fallbackTan<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._tan(x[lane])
    }
    return result
}

@inlinable func _fallbackTanh<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._tanh(x[lane])
    }
    return result
}

@inlinable func _fallbackTanpi<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._tanpi(x[lane])
    }
    return result
}

@inlinable func _fallbackTgamma<V: SIMD>(_ x: V) -> V
where V.Scalar: _ScalarReal
{
    var result = x
    for lane in 0..<V.scalarCount {
        result[lane] = V.Scalar._tgamma(x[lane])
    }
    return result
}

