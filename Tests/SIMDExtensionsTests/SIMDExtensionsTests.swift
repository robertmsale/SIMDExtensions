import XCTest
import simd
import Accelerate
@testable import SIMDExtensions

final class SIMDExtensionsTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let a = SIMD3<Float>(0, 0, 0)
        let b = SIMD3<Float>(0, 0, 1)
        let c = simd_float3x3()
//        simd_dot
//        c.columns.0.
        XCTAssertEqual(a.distance(to: b), Float(1))
    }
}
