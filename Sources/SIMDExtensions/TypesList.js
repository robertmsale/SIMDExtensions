let simdCompatMap = new Map()
let common = new Set([
    "abs",
    "clamp",
    "equal",
    "min",
    "max"
])
let intCommon = new Set([
    "any",
    "all",
    "bitselect"
])
let floatCommon = new Set([
    "distance",
    "distanceFast",
    "distancePrecise",
    "length",
    "lengthSquared",
    "fract",
    "sign",
    "reduceAdd",
    "max",
    "min",
    "mix",
    "lerp",
    "smoothstep",
    "recip",
    "recipFast",
    "recipPrecise",
    "rsqrt",
    "rsqrtFast",
    "rsqrtPrecise",
    "exp",
    "exp2",
    "exp10",
    "expm1",
    "log",
    "log2",
    "log10",
    "log1p",
    "dot",
    "normalized",
    "normalizedFast",
    "normalizedPrecise",
    "project",
    "projectFast",
    "projectPrecise",
    "acosh",
    "asinh",
    "atanh",
    "cosh",
    "sinh",
    "tanh",
    "cbrt",
    "erf",
    "erfc",
    "fma",
    "fmod",
    "rounded",
    "acos",
    "asin",
    "atan",
    "cos",
    "cospi",
    "sin",
    "sinpi",
    "tan",
    "tanpi",
    "isFinite",
    "isInf",
    "isNan",
    "isNormal"
])
let floatGeo = new Set([
    "reflect",
    "refract",
    "asCeil",
    "floor",
    "trunc"
])
let float23 = new Set([
    "cross"
])
let float2 = new Set([
    
])
let float3 = new Set([
    "project",
    "asColor",
    "asUIColor",
    "asCGColor",
    "asSCNV3"
])
let float4 = new Set([
    "initRad",
    "initEuler",
    "initMatrix",
    "initUnitVectors",
    "angle",
    "rotate",
    "slerp",
    "invert",
    "multiply",
    "preMultiply",
    "asColor",
    "asUIColor",
    "asCGColor"
])
simdCompatMap.set("SIMD2<Float>", floatCommon.union(float2).union(float23).union(floatGeo))
simdCompatMap.set("SIMD3<Float>", floatCommon.union(float3).union(float23).union(floatGeo))
simdCompatMap.set("SIMD4<Float>", floatCommon.union(float4).union(floatGeo))
simdCompatMap.set("SIMD8<Float>", floatCommon.union(float4).union(floatGeo))
simdCompatMap.set("SIMD16<Float>", floatCommon.union(float4).union(floatGeo))
simdCompatMap.set("SIMD2<Double>", simdCompatMap.get("SIMD2<Float>"))
simdCompatMap.set("SIMD3<Double>", simdCompatMap.get("SIMD3<Float>"))
simdCompatMap.set("SIMD4<Double>", simdCompatMap.get("SIMD4<Float>"))
simdCompatMap.set("SIMD8<Double>", simdCompatMap.get("SIMD8<Float>"))
let intContainerSizes = [2, 3, 4, 8, 16, 32, 64]
let intWidths = [8, 16, 32, 64]
let intMaxContainerWidths = [64, 32, 16, 8]
intWidths.forEach((width, idx) => {
    intContainerSizes.forEach(cSize => {
        if (csize > intMaxContainerWidths[idx]) break
        simdCompatMap.set(`SIMD${cSize}<Int${width}>`, intCommon)
    })
})
simdCompatMap.forEach((key, value) => {
    simdCompatMap.set(key, value.union(common))
})

let simdt = simdCompatMap.keys()
let simdw = simdt.map(v => v.match(\/d+/g)[0])
let ult = simdt.map(v => v.match(/<\w+>/g)[0].match(/\w+/g)[0])
let simdvals = simdw.map(width => {
    let qt = ["x", "y", "z", "w"]
    let lh = ["lowHalf.", "highHalf."]
    let lh8 = lh.flatMap(v => qt.map(g => `${v}${g}`))
    let lh16 = lh.flatMap(v => lh8.map(g => `${v}${g}`))
    let lh32 = lh.flatMap(v => lh16.map(g => `${v}${g}`))
    let lh64 = lh.flatMap(v => lh32.map(g => `${v}${g}`))
    switch (width) {
        case "2": return ["x", "y"]
        case "3": return ["x", "y", "z"]
        case "4": return qt
        case "8": return lh8
        case "16": return lh16
        case "32": return lh32
        default: return lh64
    }
})
