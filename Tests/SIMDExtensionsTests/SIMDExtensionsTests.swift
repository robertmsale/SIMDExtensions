import XCTest
import simd
import Accelerate
@testable import SIMDExtensions

final class SIMDExtensionsTests: XCTestCase {
    typealias V2 = SIMD2<Float>
    typealias V3 = SIMD3<Float>
    typealias V4 = SIMD4<Float>
    func testDistance() throws {
        let a = SIMD3<Float>(1, 2, 3)
        let b = SIMD3<Float>(3, 3, 1)
        XCTAssertEqual(a.distance(to: b), Float(3))
    }
    func testLength() throws {
        XCTAssertEqual(V3(5, 7, 3).length, Float(9.110434))
    }
    func testAbs() throws {
        XCTAssertEqual(V3(-2, 7, -5).abs, V3(2,7,5))
    }
    func testClamp() throws {
        XCTAssertEqual(V3(0.5, 1.1, -0.1).clamp(min: 0.0, max: 1.0), V3(0.5, 1.0, 0.0))
    }
    func testFract() throws {
        XCTAssertEqual(V3(3.25, 2.5999999, 1.7).fract, V3(0.25, 0.5999999, 0.70000005))
    }
    func testSign() throws {
        XCTAssertEqual(V3(-2, -5, 3).sign, V3(-1, -1, 1))
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
        XCTAssertEqual(V3().lerp(with: V3(5, 5, 5), by: 0.5), V3(2.5, 2.5, 2.5))
    }
    func testRecip() throws {
        XCTAssertEqual(V3(5, 5, 5).recip, V3(repeating: 0.2))
    }
    func testRsqrt() throws {
        XCTAssertEqual(V3(5, 5, 5).rsqrt, V3(repeating: 0.44721362))
    }
    @available(iOS 15, *)
    func testExp() throws {
        let vec = V3(5,5,5)
        XCTAssertEqual(vec.exp2, V3(repeating: 32))
        XCTAssertEqual(vec.exp10, V3(repeating: 100000))
        XCTAssertEqual(vec.expm1, V3(repeating: 147.41316))
        XCTAssertEqual(vec.exp, V3(repeating: 148.41316))
    }
    @available(iOS 15, *)
    func testLog() throws {
        let vec = V3(5,5,5)
        XCTAssertEqual(vec.log2, V3(repeating: 2.3219283))
        XCTAssertEqual(vec.log10, V3(repeating: 0.69897))
        XCTAssertEqual(vec.log1p, V3(repeating: 1.7917595))
        XCTAssertEqual(vec.log, V3(repeating: 1.609438))
    }
    func testDot() throws {
        XCTAssertEqual(V3(3,2,1).dot(with: V3(1,2,3)), 10.0)
    }
    func testNorm() throws {
        XCTAssertEqual(V3(5, 2.5, 0).normalized, V3(0.8944272, 0.4472136, 0.0))
    }
    func testReversed() throws {
        XCTAssertEqual(V3(1, 2, 3).reversed, V3(3, 2, 1))
    }
}
