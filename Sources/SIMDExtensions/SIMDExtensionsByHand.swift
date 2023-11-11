//
//  SIMDExtensionsByHand.swift
//  
//
//  Created by Robert Sale on 1/18/23.
//

import Foundation
import simd
import SwiftUI

/// Euler Order for determining the order of rotation
public enum EulerOrder {
    case XYZ, YXZ, ZXY, ZYX, YZX, XZY
}

/// Protocol which allows regular vectors to be represended by SIMD containers
public protocol SIMDRepresentable {
    associatedtype UnderlyingSIMDValue
    var simd: UnderlyingSIMDValue { get set }
    init(simd: UnderlyingSIMDValue)
}

/// Spherical data type for representing spherical coordinates in 3D space
/// `T`: SIMDScalar - should be a Float or a Double
public struct Spherical<T: SIMDScalar>: SIMDRepresentable {
    public typealias UnderlyingSIMDValue = SIMD3<T>
    /// SIMD container for Spherical
    ///  `x`: radius
    ///  `y`: theta
    ///  `z`: phi
    public var simd: UnderlyingSIMDValue
    public var radius: T { get {simd.x} set(v) {simd.x = v} }
    public var theta: T { get {simd.y} set(v) {simd.y = v} }
    public var phi: T { get {simd.z} set(v) {simd.z = v} }
    public init(simd spherical: UnderlyingSIMDValue) {
        simd = spherical
    }
}

public extension BinaryFloatingPoint {
    /// Clamp `self` between numbers `min` and `max`
    func clamp(_ min: Self, _ max: Self) -> Self { Swift.min(max, Swift.max(min, self))}
}


public extension SIMD4<Float> {
    var isNormalized: Bool {
        lengthSquared == 1.0
    }
}
public extension SIMD4<Double> {
    var isNormalized: Bool {
        lengthSquared == 1.0
    }
}
