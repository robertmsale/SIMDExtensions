//
//  SIMDExtensionsByHand.swift
//  
//
//  Created by Robert Sale on 1/18/23.
//

import Foundation
import simd
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(SceneKit)
import SceneKit
#endif
#if os(Linux)
import Glibc
#endif

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

extension BinaryFloatingPoint {
    @inlinable func max(_ with: Self) -> Self {
        Swift.max(self, with)
    }
    @inlinable func min(_ with: Self) -> Self {
        Swift.min(self, with)
    }
    func smoothStep(_ min: Self, _ max: Self) -> Self {
        if self <= min { return 0.0 }
        if self >= max { return 1.0 }
        let step = (self - min) / (max - min)
        return step * step * (3.0 - 2.0 * step)
    }
}
public extension SIMD2<Float> {
   @inlinable var asSIMDDouble: SIMD2<Double> { SIMD2<Double>(Double(x),Double(y)) }
}
public extension SIMD2<Double> {
   @inlinable var asSIMDFloat: SIMD2<Float> { SIMD2<Float>(Float(x),Float(y)) }
}
public extension SIMD3<Float> {
   @inlinable var asSIMDDouble: SIMD3<Double> { SIMD3<Double>(Double(x),Double(y),Double(z)) }
}
public extension SIMD3<Double> {
   @inlinable var asSIMDFloat: SIMD3<Float> { SIMD3<Float>(Float(x),Float(y),Float(z)) }
}
public extension SIMD4<Float> {
   @inlinable var asSIMDDouble: SIMD4<Double> { SIMD4<Double>(Double(x),Double(y),Double(z),Double(w)) }
}
public extension SIMD4<Double> {
   @inlinable var asSIMDFloat: SIMD4<Float> { SIMD4<Float>(Float(x),Float(y),Float(z),Float(w)) }
}
public extension SIMD8<Float> {
   @inlinable var asSIMDDouble: SIMD8<Double> { SIMD8<Double>(Double(lowHalf.x),Double(lowHalf.y),Double(lowHalf.z),Double(lowHalf.w),Double(highHalf.x),Double(highHalf.y),Double(highHalf.z),Double(highHalf.w)) }
}
public extension SIMD8<Double> {
   @inlinable var asSIMDFloat: SIMD8<Float> { SIMD8<Float>(Float(lowHalf.x),Float(lowHalf.y),Float(lowHalf.z),Float(lowHalf.w),Float(highHalf.x),Float(highHalf.y),Float(highHalf.z),Float(highHalf.w)) }
}

#if canImport(SceneKit)
public extension SCNVector3 {
    init(_ x: Double, _ y: Double, _ z: Double) {
        self.init(Float(x), Float(y), Float(z))
    }
    var asSIMDF: SIMD3<Float> { .init(Float(x), Float(y), Float(z)) }
    var asSIMDD: SIMD3<Double> { .init(Double(x), Double(y), Double(z)) }
}
public extension SCNQuaternion {
    init(_ x: Double, _ y: Double, _ z: Double, _ w: Double) {
        self.init(Float(x), Float(y), Float(z), Float(w))
    }
    var asSIMDF: SIMD4<Float> { .init(Float(x), Float(y), Float(z), Float(w)) }
    var asSIMDD: SIMD4<Double> { .init(Double(x), Double(y), Double(z), Double(w)) }
}
public extension SCNGeometrySource {
    convenience init(vertices: [SIMD3<Float>]) {
        self.init(vertices: vertices.map {SCNVector3($0.x, $0.y, $0.z)})
    }
    convenience init(normals: [SIMD3<Float>]) {
        self.init(normals: normals.map {SCNVector3($0.x, $0.y, $0.z)})
    }
    convenience init(vertices: [SIMD3<Double>]) {
        self.init(vertices: vertices.map {SCNVector3($0.x, $0.y, $0.z)})
    }
    convenience init(normals: [SIMD3<Double>]) {
        self.init(normals: normals.map {SCNVector3($0.x, $0.y, $0.z)})
    }
    convenience init(textureCoordinates: [SIMD2<Float>]) {
        self.init(textureCoordinates: textureCoordinates.map {CGPoint(x: CGFloat($0.x), y: CGFloat($0.y))})
    }
    convenience init(textureCoordinates: [SIMD2<Double>]) {
        self.init(textureCoordinates: textureCoordinates.map {CGPoint(x: CGFloat($0.x), y: CGFloat($0.y))})
    }
}
#endif

#if canImport(SwiftUI)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public extension View {
    func frame(_ size: CGSize, alignment: Alignment = .center) -> some View {
        return self.frame(width: size.width, height: size.height, alignment: alignment)
    }
    func frame(min: CGSize? = nil, ideal: CGSize? = nil, max: CGSize? = nil, alignment: Alignment = .center) -> some View {
        return self.frame(minWidth: min?.width, idealWidth: ideal?.width, maxWidth: max?.width, minHeight: min?.height, idealHeight: ideal?.height, maxHeight: max?.height, alignment: alignment)
    }
}
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
public extension Path {
    static func createLinesFrom(_ simd2Fpoints: [SIMD2<Float>], isClosed: Bool = true) -> Path {
        Path { p in
            if simd2Fpoints.count < 2 { return }
            let cgp = simd2Fpoints.map { $0.asCGPoint }
            p.move(to: cgp[0])
            for pt in cgp[1...] {
                p.addLine(to: pt)
            }
            if isClosed { p.addLine(to: cgp[0]) }
        }
    }
    static func createLinesFrom(_ simd2Dpoints: [SIMD2<Double>], isClosed: Bool = true) -> Path {
        Path { p in
            if simd2Dpoints.count < 2 { return }
            let cgp = simd2Dpoints.map { CGPoint(x: $0.x, y: $0.y) }
            p.move(to: cgp[0])
            for pt in cgp[1...] {
                p.addLine(to: pt)
            }
            if isClosed { p.addLine(to: cgp[0]) }
        }
    }
}
#endif
