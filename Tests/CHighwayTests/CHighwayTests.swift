@_implementationOnly import CHighway
import Testing

protocol FloatBuff {
    associatedtype FL = BinaryFloatingPoint
    static func zero() -> Self
    static func from(_ array: [FL]) -> Self
    var asArray: [FL] { get }
}

extension FloatBuff {
    static func capacity() -> Int {
        MemoryLayout<Self>.size / MemoryLayout<FL>.size
    }
    /// Calls `body` with a pointer to the first scalar in `self`.
    func withFloatPointer<R>(
        _ body: (UnsafePointer<FL>) throws -> R
    ) rethrows -> R {
        return try withUnsafePointer(to: self) {
            try $0.withMemoryRebound(to: FL.self, capacity: Self.capacity(), body)
        }
    }
    /// Same but mutable.
    mutating func withMutableFloatPointer<R>(
        _ body: (UnsafeMutablePointer<FL>) throws -> R
    ) rethrows -> R {
        return try withUnsafeMutablePointer(to: &self) {
            try $0.withMemoryRebound(to: FL.self, capacity: Self.capacity(), body)
        }
    }
}

struct Fx2<T: BinaryFloatingPoint>: FloatBuff, Equatable {
    typealias FL = T
    var x, y: FL
    static func zero() -> Self { .init(x: 0.0, y: 0.0) }
    static func from(_ array: [FL]) -> Self {
        .init(x: array[0], y: array[1])
    }
    var asArray: [FL] { [x, y] }
}
struct Fx3<T: BinaryFloatingPoint>: FloatBuff, Equatable {
    typealias FL = T
    var x, y, z: FL
    static func zero() -> Self { .init(x: 0.0, y: 0.0, z: 0.0) }
    static func from(_ array: [FL]) -> Self {
        .init(x: array[0], y: array[1], z: array[2])
    }
    var asArray: [FL] { [x, y, z] }
}
struct Fx4<T: BinaryFloatingPoint>: FloatBuff, Equatable {
    typealias FL = T
    var x, y, z, w: FL
    static func zero() -> Self { .init(x: 0.0, y: 0.0, z: 0.0, w: 0.0) }
    static func from(_ array: [FL]) -> Self {
        .init(x: array[0], y: array[1], z: array[2], w: array[3])
    }
    var asArray: [FL] { [x, y, z, w] }
}
struct Fx8<T: BinaryFloatingPoint>: FloatBuff, Equatable {
    typealias FL = T
    var x, y, z, w, a, b, c, d: FL
    static func zero() -> Self { .init(x: 0.0, y: 0.0, z: 0.0, w: 0.0, a: 0.0, b: 0.0, c: 0.0, d: 0.0) }
    static func from(_ array: [FL]) -> Self {
        .init(x: array[0], y: array[1], z: array[2], w: array[3], a: array[4], b: array[5], c: array[6], d: array[7])
    }
    var asArray: [FL] { [x, y, z, w, a, b, c, d] }
}
struct F32x16: FloatBuff, Equatable {
    typealias FL = Float
    var x, y, z, w, a, b, c, d, x1, y1, z1, w1, a1, b1, c1, d1: Float
    static func zero() -> Self { .init(
        x: 0.0, y: 0.0, z: 0.0, w: 0.0, a: 0.0, b: 0.0, c: 0.0, d: 0.0,
        x1: 0.0, y1: 0.0, z1: 0.0, w1: 0.0, a1: 0.0, b1: 0.0, c1: 0.0, d1: 0.0
        ) }
    static func from(_ array: [Float]) -> Self {
        .init(
            x: array[0], y: array[1], z: array[2], w: array[3], a: array[4], b: array[5], c: array[6], d: array[7],
            x1: array[0], y1: array[1], z1: array[2], w1: array[3], a1: array[4], b1: array[5], c1: array[6], d1: array[7]
            )
    }
    var asArray: [FL] { [x, y, z, w, a, b, c, d, x1, y1, z1, w1, a1, b1, c1, d1] }
}

@Test func highwayAdd() {
    do {
        typealias FX = Fx2<Float>
        var a = FX.from([1, 2])
        var b = a
        var result = FX.zero()
        let expected = FX.from([2.0, 4.0])
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f32x2(pa, pb, presult)
                }
            }
        }
        #expect(result.asArray.elementsEqual(expected.asArray))
    }
    do {
        typealias FX = Fx3<Float>
        var a = FX.from([1, 2, 3])
        var b = a
        var result = FX.zero()
        let expected = FX.from([2.0, 4.0, 6.0])
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f32x3(pa, pb, presult)
                }
            }
        }
        #expect(result.asArray.elementsEqual(expected.asArray))
    }
    do {
        typealias FX = Fx4<Float>
        var a = FX.from([1, 2, 3, 4])
        var b = a
        var result = FX.zero()
        let expected = FX.from([2.0, 4.0, 6.0, 8.0])
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f32x4(pa, pb, presult)
                }
            }
        }
        #expect(result.asArray.elementsEqual(expected.asArray))
    }
    do {
        typealias FX = Fx8<Float>
        var a = FX.from([1, 2, 3, 4, 5, 6, 7, 8])
        var b = a
        var result = FX.zero()
        let expected = FX.from([2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0])
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f32x8(pa, pb, presult)
                }
            }
        }
        #expect(result.asArray.elementsEqual(expected.asArray))
    }
    do {
        typealias FX = F32x16
        var a = FX.from([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16])
        var b = a
        var result = FX.zero()
        let expected = FX.from([2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32])
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f32x16(pa, pb, presult)
                }
            }
        }
        #expect(result.asArray.elementsEqual(expected.asArray))
    }
    do {
        typealias FX = Fx2<Double>
        var a = FX.from([1, 2])
        var b = a
        var result = FX.zero()
        let expected = FX.from([2.0, 4.0])
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f64x2(pa, pb, presult)
                }
            }
        }
        #expect(result.asArray.elementsEqual(expected.asArray))
    }
    do {
        typealias FX = Fx3<Double>
        var a = FX.from([1, 2, 3])
        var b = a
        var result = FX.zero()
        let expected = FX.from([2.0, 4.0, 6.0])
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f64x3(pa, pb, presult)
                }
            }
        }
        #expect(result.asArray.elementsEqual(expected.asArray))
    }
    do {
        typealias FX = Fx4<Double>
        var a = FX.from([1, 2, 3, 4])
        var b = a
        var result = FX.zero()
        let expected = FX.from([2.0, 4.0, 6.0, 8.0])
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f64x4(pa, pb, presult)
                }
            }
        }
        #expect(result.asArray.elementsEqual(expected.asArray))
    }
    do {
        typealias FX = Fx8<Double>
        var a = FX.from([1, 2, 3, 4, 5, 6, 7, 8])
        var b = a
        var result = FX.zero()
        let expected = FX.from([2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0])
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f64x8(pa, pb, presult)
                }
            }
        }
        #expect(result.asArray.elementsEqual(expected.asArray))
    }
}
