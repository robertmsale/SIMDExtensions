import XCTest
import simd
#if canImport(Accelerate)
import Accelerate
#endif
@testable import SIMDExtensions

func testEquality(_ of: SIMD4<Float>, _ with: SIMD4<Float>) {
    XCTAssertEqual(of.x, with.x, accuracy: 1e-6)
    XCTAssertEqual(of.y, with.y, accuracy: 1e-6)
    XCTAssertEqual(of.z, with.z, accuracy: 1e-6)
    XCTAssertEqual(of.w, with.w, accuracy: 1e-6)
}
func testEquality(_ of: SIMD3<Float>, _ with: SIMD3<Float>) {
    XCTAssertEqual(of.x, with.x, accuracy: 1e-6)
    XCTAssertEqual(of.y, with.y, accuracy: 1e-6)
    XCTAssertEqual(of.z, with.z, accuracy: 1e-6)
}
func testEquality(_ of: SIMD2<Float>, _ with: SIMD2<Float>) {
    XCTAssertEqual(of.x, with.x, accuracy: 1e-6)
    XCTAssertEqual(of.y, with.y, accuracy: 1e-6)
}
func testEquality(_ of: SIMD4<Double>, _ with: SIMD4<Double>) {
    XCTAssertEqual(of.x, with.x, accuracy: 1e-6)
    XCTAssertEqual(of.y, with.y, accuracy: 1e-6)
    XCTAssertEqual(of.z, with.z, accuracy: 1e-6)
    XCTAssertEqual(of.w, with.w, accuracy: 1e-6)
}
func testEquality(_ of: SIMD3<Double>, _ with: SIMD3<Double>) {
    XCTAssertEqual(of.x, with.x, accuracy: 1e-6)
    XCTAssertEqual(of.y, with.y, accuracy: 1e-6)
    XCTAssertEqual(of.z, with.z, accuracy: 1e-6)
}
func testEquality(_ of: SIMD2<Double>, _ with: SIMD2<Double>) {
    XCTAssertEqual(of.x, with.x, accuracy: 1e-6)
    XCTAssertEqual(of.y, with.y, accuracy: 1e-6)
}


final class SIMDExtensionsTests: XCTestCase {
    typealias V2 = SIMD2<Float>
    typealias V3 = SIMD3<Float>
    typealias V4 = SIMD4<Float>
    func testDistance() throws {
        let a = SIMD3<Float>(1, 2, 3)
        let b = SIMD3<Float>(3, 3, 1)
        XCTAssertEqual(a.distance(to: b), Float(3), accuracy: 1e-6)
    }
    func testLength() throws {
        XCTAssertEqual(V3(5, 7, 3).length, Float(9.110434))
    }
    func testAbs() throws {
        testEquality(V3(-2, 7, -5).abs, V3(2,7,5))
    }
    func testClamp() throws {
        testEquality(V3(0.5, 1.1, -0.1).clamp(min: 0.0, max: 1.0), V3(0.5, 1.0, 0.0))
    }
    func testFract() throws {
        testEquality(V3(3.25, 2.5999999, 1.7).fract, V3(0.25, 0.5999999, 0.70000005))
    }
    func testSign() throws {
        testEquality(V3(-2, -5, 3).sign, V3(-1, -1, 1))
    }
    func testReduceAdd() throws {
        XCTAssertEqual(V3(5, 6, 3).reduceAdd, 14.0)
    }
    func testReduceMax() throws {
        XCTAssertEqual(V3(3, 6, 5).max, 6.0)
    }
    func testReduceMin() throws {
        XCTAssertEqual(V3(3, 6, 5).min, 3.0)
    }
    func testLerp() throws {
        testEquality(V3().lerp(with: V3(5, 5, 5), by: 0.5), V3(2.5, 2.5, 2.5))
    }
    func testRecip() throws {
        testEquality(V3(5, 5, 5).recip, V3(repeating: 0.2))
    }
    func testRsqrt() throws {
        testEquality(V3(5, 5, 5).rsqrt, V3(repeating: 0.44721362))
    }
    func testExp() throws {
        let vec = V3(5,5,5)
#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
        let cases = [
            (vec.exp2, V3(repeating: 32)),
            (vec.exp10, V3(repeating: 100000)),
            (vec.expm1, V3(repeating: 147.41316)),
            (vec.exp, V3(repeating: 148.41316))
        ]
#else
        let cases = [
            (vec.exp2, V3(repeating: 32)),
            (vec.exp10, V3(repeating: 100000.06)),
            (vec.expm1, V3(repeating: 147.41316)),
            (vec.exp, V3(repeating: 148.41316))
        ]
#endif
        for (l, r) in cases {
            testEquality(l, r)
        }
    }
    @available(iOS 15, *)
    func testLog() throws {
        let vec = V3(5,5,5)
        let cases = [
            (vec.log2, V3(repeating: 2.3219283)),
            (vec.log10, V3(repeating: 0.69897)),
            (vec.log1p, V3(repeating: 1.7917595)),
            (vec.log, V3(repeating: 1.609438))
        ]
        for (l, r) in cases {
            testEquality(l, r)
        }
    }
    func testDot() throws {
        XCTAssertEqual(V3(3,2,1).dot(with: V3(1,2,3)), 10.0)
    }
    func testNorm() throws {
        let l = V3(5, 2.5, 0).normalized
        let r = V3(0.8944272, 0.4472136, 0.0)
        testEquality(l, r)
    }
    func testReversed() throws {
        testEquality(V3(1, 2, 3).reversed, V3(3, 2, 1))
    }
}
