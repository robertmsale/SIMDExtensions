@_implementationOnly import CHighway
import Testing

@_alignment(16)
@usableFromInline
struct F32x4: Equatable, Copyable {
    var x, y, z, w: Float
}

@_alignment(16)
@usableFromInline
struct F32x8: Equatable, Copyable {
    var x, y, z, w: Float
    var a, b, c, d: Float
}

extension F32x4 {
    /// Calls `body` with a pointer to the first scalar in `self`.
    @inlinable
    func withFloatPointer<R>(_ body: (UnsafePointer<Float>) throws -> R) rethrows -> R {
        return try withUnsafePointer(to: self) {
            try $0.withMemoryRebound(to: Float.self, capacity: 4, body)
        }
    }

    /// Same but mutable.
    @inlinable
    mutating func withMutableFloatPointer<R>(
        _ body: (UnsafeMutablePointer<Float>) throws -> R
    ) rethrows -> R {
        return try withUnsafeMutablePointer(to: &self) {
            try $0.withMemoryRebound(to: Float.self, capacity: 4, body)
        }
    }
}
extension F32x8 {
    /// Calls `body` with a pointer to the first scalar in `self`.
    @inlinable
    func withFloatPointer<R>(_ body: (UnsafePointer<Float>) throws -> R) rethrows -> R {
        return try withUnsafePointer(to: self) {
            try $0.withMemoryRebound(to: Float.self, capacity: 8, body)
        }
    }

    /// Same but mutable.
    @inlinable
    mutating func withMutableFloatPointer<R>(
        _ body: (UnsafeMutablePointer<Float>) throws -> R
    ) rethrows -> R {
        return try withUnsafeMutablePointer(to: &self) {
            try $0.withMemoryRebound(to: Float.self, capacity: 8, body)
        }
    }
}

@Test func highwayAdd() {
    do {
        var a = F32x4(x: 1.0, y: 2.0, z: 3.0, w: 4.0)
        var b = F32x4(x: 1.0, y: 2.0, z: 3.0, w: 4.0)
        var result = F32x4(x: 0, y: 0, z: 0, w: 0)
        let expected = F32x4(x: 2.0, y: 4.0, z: 6.0, w: 8.0)
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f32x4(pa, pb, presult)
                }
            }
        }
        #expect(result == expected)
    }
    do {
        var a = F32x8(x: 1.0, y: 2.0, z: 3.0, w: 4.0, a: 5.0, b: 6.0, c: 7.0, d: 8.0)
        var b = F32x8(x: 1.0, y: 2.0, z: 3.0, w: 4.0, a: 5.0, b: 6.0, c: 7.0, d: 8.0)
        var result = F32x8(x: 0.0, y: 0.0, z: 0.0, w: 0.0, a: 0.0, b: 0.0, c: 0.0, d: 0.0)
        let expected = F32x8(x: 2.0, y: 4.0, z: 6.0, w: 8.0, a: 10.0, b: 12.0, c: 14.0, d: 16.0)
        a.withFloatPointer { pa in
            b.withFloatPointer { pb in
                result.withMutableFloatPointer { presult in
                    hwy_add_f32x8(pa, pb, presult)
                }
            }
        }
        #expect(result == expected)
    }
}
