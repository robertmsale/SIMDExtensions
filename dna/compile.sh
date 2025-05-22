#!/bin/bash
# FILE=./Sources/SIMDExtensions/SIMDExtensions
# ribosome $FILE.js.dna > $FILE.swift

# let simdt = ["SIMD2<Float>", "SIMD3<Float>", "SIMD4<Float>", "SIMD8<Float>", "SIMD16<Float>", "SIMD2<Double>", "SIMD3<Double>", "SIMD4<Double>", "SIMD8<Double>"]
# let simdw = [2, 3, 4, 8, 16, 2, 3, 4, 8]
# let ult = ["Float", "Float", "Float", "Float", "Float", "Double", "Double", "Double", "Double"]
# let st = (n) => `SIMD${simdw[n]}<${ult[n]}>`
# let qt = ["x", "y", "z", "w"]
# let lh = [ 'lowHalf.', 'highHalf.' ]
# let simdvals = [
#     ["x", "y"],
#     ["x", "y", "z"],
#     qt,
#     lh.flatMap((v) => qt.map((g) => `${v}${g}`)),
#     lh.flatMap((l) => lh.flatMap((h) => qt.map((g) => `${l}${h}${g}`))),
#     ["x", "y"],
#     ["x", "y", "z"],
#     qt,
#     lh.flatMap((v) => qt.map((g) => `${v}${g}`)),
# ]
# let availability = "@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)"

make_extension() {
    case "$1" in
        0) ribosome impl.js.dna 0 "SIMD2\<Float\>" Float > ../Sources/SIMDExtensions/SIMD2Float.swift;;
        1) ribosome impl.js.dna 1 "SIMD3\<Float\>" Float > ../Sources/SIMDExtensions/SIMD3Float.swift;;
        2) ribosome impl.js.dna 2 "SIMD4\<Float\>" Float > ../Sources/SIMDExtensions/SIMD4Float.swift;;
        3) ribosome impl.js.dna 3 "SIMD8\<Float\>" Float > ../Sources/SIMDExtensions/SIMD8Float.swift;;
        4) ribosome impl.js.dna 4 "SIMD16\<Float\>" Float > ../Sources/SIMDExtensions/SIMD16Float.swift;;
        5) ribosome impl.js.dna 5 "SIMD2\<Double\>" Double > ../Sources/SIMDExtensions/SIMD2Double.swift;;
        6) ribosome impl.js.dna 6 "SIMD3\<Double\>" Double > ../Sources/SIMDExtensions/SIMD3Double.swift;;
        7) ribosome impl.js.dna 7 "SIMD4\<Double\>" Double > ../Sources/SIMDExtensions/SIMD4Double.swift;;
        8) ribosome impl.js.dna 8 "SIMD8\<Double\>" Double > ../Sources/SIMDExtensions/SIMD8Double.swift;;
    esac
}

if [ -z "$1" ]; then
    for i in $(seq 0 8); do
        make_extension $i
    done
else
    make_extension $1
fi

ribosome scalar.js.dna > ../Sources/SIMDExtensions/_ScalarRealFallbacks.swift