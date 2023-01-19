//
//  File.swift
//  
//
//  Created by Robert Sale on 1/18/23.
//

import Foundation
import simd

public enum EulerOrder {
    case XYZ, YXZ, ZXY, ZYX, YZX, XZY
}

extension BinaryFloatingPoint {
    public func clamp(_ min: Self, _ max: Self) -> Self { Swift.min(max, Swift.max(min, self))}
}
