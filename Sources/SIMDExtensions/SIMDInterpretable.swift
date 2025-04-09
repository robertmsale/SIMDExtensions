//
//  AnyVectorInterpretable.swift
//  SIMDExtensions
//
//  Created by Robert Sale on 4/8/25.
//

import simd
/// A protocol that enables types to be interpreted as SIMD (Single Instruction, Multiple Data) structures.
///
/// Conforming types can be converted to and from their underlying SIMD representation,
/// allowing for efficient vector operations while maintaining type safety.
/// This is particularly useful for graphics, scientific computing, and other
/// performance-critical applications that benefit from SIMD optimizations.
///
/// - Note: Conforming types must have a memory layout compatible with their
///   associated SIMD type to ensure safe reinterpretation.
public protocol SIMDInterpretable: Copyable {
    /// The associated SIMD type that this structure can be interpreted as.
    ///
    /// This type defines the underlying vector representation that the conforming
    /// type can be converted to and from. It defaults to the `SIMD` protocol
    /// if not explicitly specified.
    associatedtype AS = SIMD
    
    /// The SIMD representation of this value.
    ///
    /// This property provides get and set access to the underlying SIMD structure,
    /// enabling conversion between the custom type and its SIMD equivalent.
    var simd: AS { get set }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<CChar> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<CChar>` value,
    /// while the setter reinterprets the provided `SIMD2<CChar>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<CChar>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<CChar>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<UInt8> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<UInt8>` value,
    /// while the setter reinterprets the provided `SIMD2<UInt8>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<UInt8>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<UInt8>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<CChar> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<CChar>` value,
    /// while the setter reinterprets the provided `SIMD3<CChar>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<CChar>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<CChar>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<UInt8> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<UInt8>` value,
    /// while the setter reinterprets the provided `SIMD3<UInt8>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<UInt8>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<UInt8>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<CChar> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<CChar>` value,
    /// while the setter reinterprets the provided `SIMD4<CChar>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<CChar>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<CChar>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<UInt8> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<UInt8>` value,
    /// while the setter reinterprets the provided `SIMD4<UInt8>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<UInt8>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<UInt8>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<CChar> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<CChar>` value,
    /// while the setter reinterprets the provided `SIMD8<CChar>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<CChar>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<CChar>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<UInt8> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<UInt8>` value,
    /// while the setter reinterprets the provided `SIMD8<UInt8>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<UInt8>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<UInt8>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD16<CChar> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD16<CChar>` value,
    /// while the setter reinterprets the provided `SIMD16<CChar>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD16<CChar>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD16<CChar>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD16<UInt8> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD16<UInt8>` value,
    /// while the setter reinterprets the provided `SIMD16<UInt8>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD16<UInt8>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD16<UInt8>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD32<CChar> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD32<CChar>` value,
    /// while the setter reinterprets the provided `SIMD32<CChar>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD32<CChar>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD32<CChar>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD32<UInt8> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD32<UInt8>` value,
    /// while the setter reinterprets the provided `SIMD32<UInt8>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD32<UInt8>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD32<UInt8>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD64<CChar> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD64<CChar>` value,
    /// while the setter reinterprets the provided `SIMD64<CChar>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD64<CChar>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD64<CChar>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD64<UInt8> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD64<UInt8>` value,
    /// while the setter reinterprets the provided `SIMD64<UInt8>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD64<UInt8>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD64<UInt8>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<Int16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<Int16>` value,
    /// while the setter reinterprets the provided `SIMD2<Int16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<Int16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<Int16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<UInt16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<UInt16>` value,
    /// while the setter reinterprets the provided `SIMD2<UInt16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<UInt16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<UInt16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<Int16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<Int16>` value,
    /// while the setter reinterprets the provided `SIMD3<Int16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<Int16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<Int16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<UInt16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<UInt16>` value,
    /// while the setter reinterprets the provided `SIMD3<UInt16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<UInt16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<UInt16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<Int16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<Int16>` value,
    /// while the setter reinterprets the provided `SIMD4<Int16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<Int16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<Int16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<UInt16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<UInt16>` value,
    /// while the setter reinterprets the provided `SIMD4<UInt16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<UInt16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<UInt16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<Int16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<Int16>` value,
    /// while the setter reinterprets the provided `SIMD8<Int16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<Int16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<Int16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<UInt16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<UInt16>` value,
    /// while the setter reinterprets the provided `SIMD8<UInt16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<UInt16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<UInt16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD16<Int16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD16<Int16>` value,
    /// while the setter reinterprets the provided `SIMD16<Int16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD16<Int16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD16<Int16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD16<UInt16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD16<UInt16>` value,
    /// while the setter reinterprets the provided `SIMD16<UInt16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD16<UInt16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD16<UInt16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD32<Int16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD32<Int16>` value,
    /// while the setter reinterprets the provided `SIMD32<Int16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD32<Int16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD32<Int16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD32<UInt16> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD32<UInt16>` value,
    /// while the setter reinterprets the provided `SIMD32<UInt16>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD32<UInt16>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD32<UInt16>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<Int32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<Int32>` value,
    /// while the setter reinterprets the provided `SIMD2<Int32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<Int32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<Int32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<UInt32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<UInt32>` value,
    /// while the setter reinterprets the provided `SIMD2<UInt32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<UInt32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<UInt32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<Float> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<Float>` value,
    /// while the setter reinterprets the provided `SIMD2<Float>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<Float>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<Float>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<Int32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<Int32>` value,
    /// while the setter reinterprets the provided `SIMD3<Int32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<Int32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<Int32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<UInt32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<UInt32>` value,
    /// while the setter reinterprets the provided `SIMD3<UInt32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<UInt32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<UInt32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<Float> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<Float>` value,
    /// while the setter reinterprets the provided `SIMD3<Float>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<Float>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<Float>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<Int32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<Int32>` value,
    /// while the setter reinterprets the provided `SIMD4<Int32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<Int32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<Int32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<UInt32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<UInt32>` value,
    /// while the setter reinterprets the provided `SIMD4<UInt32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<UInt32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<UInt32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<Float> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<Float>` value,
    /// while the setter reinterprets the provided `SIMD4<Float>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<Float>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<Float>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<Int32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<Int32>` value,
    /// while the setter reinterprets the provided `SIMD8<Int32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<Int32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<Int32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<UInt32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<UInt32>` value,
    /// while the setter reinterprets the provided `SIMD8<UInt32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<UInt32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<UInt32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<Float> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<Float>` value,
    /// while the setter reinterprets the provided `SIMD8<Float>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<Float>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<Float>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD16<Int32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD16<Int32>` value,
    /// while the setter reinterprets the provided `SIMD16<Int32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD16<Int32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD16<Int32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD16<UInt32> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD16<UInt32>` value,
    /// while the setter reinterprets the provided `SIMD16<UInt32>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD16<UInt32>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD16<UInt32>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD16<Float> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD16<Float>` value,
    /// while the setter reinterprets the provided `SIMD16<Float>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD16<Float>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD16<Float>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<Int64> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<Int64>` value,
    /// while the setter reinterprets the provided `SIMD2<Int64>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<Int64>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<Int64>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<UInt64> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<UInt64>` value,
    /// while the setter reinterprets the provided `SIMD2<UInt64>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<UInt64>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<UInt64>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD2<Double> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD2<Double>` value,
    /// while the setter reinterprets the provided `SIMD2<Double>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD2<Double>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD2<Double>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<Int64> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<Int64>` value,
    /// while the setter reinterprets the provided `SIMD3<Int64>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<Int64>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<Int64>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<UInt64> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<UInt64>` value,
    /// while the setter reinterprets the provided `SIMD3<UInt64>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<UInt64>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<UInt64>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD3<Double> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD3<Double>` value,
    /// while the setter reinterprets the provided `SIMD3<Double>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD3<Double>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD3<Double>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<Int64> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<Int64>` value,
    /// while the setter reinterprets the provided `SIMD4<Int64>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<Int64>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<Int64>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<UInt64> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<UInt64>` value,
    /// while the setter reinterprets the provided `SIMD4<UInt64>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<UInt64>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<UInt64>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD4<Double> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD4<Double>` value,
    /// while the setter reinterprets the provided `SIMD4<Double>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD4<Double>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD4<Double>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<Int64> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<Int64>` value,
    /// while the setter reinterprets the provided `SIMD8<Int64>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<Int64>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<Int64>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<UInt64> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<UInt64>` value,
    /// while the setter reinterprets the provided `SIMD8<UInt64>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<UInt64>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<UInt64>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
/// Default implementations for SIMDInterpretable when the associated type is SIMD2<CChar>.
public extension SIMDInterpretable where AS == SIMD8<Double> {
    /// Provides access to the SIMD representation of the conforming type.
    ///
    /// The getter reinterprets the memory of `self` as a `SIMD8<Double>` value,
    /// while the setter reinterprets the provided `SIMD8<Double>` value back into
    /// the conforming type. This enables seamless conversion between the custom
    /// type and its SIMD representation.
    ///
    /// - Note: The conforming type must have a memory layout compatible with
    ///   `SIMD8<Double>` for this reinterpretation to be valid.
    /// - Warning: Incorrect memory layout alignment may lead to undefined behavior.
    @inlinable var simd: AS {
        get {
            withUnsafeBytes(of: self) { $0.load(as: SIMD8<Double>.self) }
        } set {
            withUnsafeBytes(of: newValue) { self = $0.load(as: Self.self) }
        }
    }
}
