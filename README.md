# SIMDExtensions

This package extends Swift's `simd` data types making them easier to use.

## Why?

Using SIMD vector arithmetic yields better performance, especially for graphics intensive software such as [FieldFab for iOS](https://fieldfab.net/). This package enables a very Swifty API for SIMD data types that make it much easier to use (no need to look at all the overloads for `simd_insphere` to see what types support it because now it's baked into the container!). Rather than dealing with global functions all the SIMD arithmetic functions are encapsulated in their underlying type. 

## How?

On Apple platforms, SIMD is implemented in C and the typedef structs and functions are mapped to Swift. This means all of the types are concrete, and not based on any protocols - except for the `SIMD` protocol which covers basic math operations. You have to know what function you want to use beforehand and many of the functions only accept specific `SIMDScalar` types (i.e. trigonometric functions use float types). This library uses templating to generate inlinable instance methods so you can benefit from autocomplete.

## SIMDInterpretable

A new feature of this library that allows you to reinterpret any structure of data as a SIMD structure. Rather than manually mapping SIMD lanes to a high-level custom structure, it reinterprets the structure as a SIMD type. This eliminates constructor overhead and is the equivalent of C-style pointer casting. Double check your memory layout before conforming to this type.
This is useful for extending structs that already exist in frameworks. Take for example `SCNVector3` from SceneKit.
```swift
MemoryLayout<SCNVector3>.size // Int = 24 on macOS, 12 on iOS, tvOS, watchOS
```
Swift is awesome. Since structs don't have inheritance, their memory layout is deterministic. Under no circumstances will you find a function pointer to a vtable inside the memory layout of a struct unless you put it there, so even though `SIMDInterpretable` uses unsafe pointer casting, it's pretty easy and safe to use on structs. Using it on classes is a different story! You have to overload `var simd: AS` with your own getter and setter on a class type because the memory layout of classes contains metadata. The first 8 bytes is an ISA pointer to class metadata (dispatch table, superclass, and runtime information), next 8 bytes are strong reference counts, and the next 8 bytes are unowned reference counts. Swift will sometimes optimize the reference counts using bitfields, so the actual memory layout of class metadata is not easy to determine at compile time. 
Same goes for enums with associated values. Enums are a tagged union type, combining a discriminator with a payload. The discriminator is typically 1 byte, but if you have more than 256 cases it will grow the discriminator. Anyways, if you were to conform an enum with associated values to `SIMDInterpretable` you would want to implement your own getter and setter to handle memory layout differences.

## Examples
### Positioning Text using SIMD
```swift
@ViewBuilder func drawText(inside: CGRect) -> some View {
    let size = SIMD2<Double>(Double(inside.width), Double(inside.height))
    let position = SIMD2<Double>(Double(inside.x), Double(inside.y))
    Text("Some Text")
        .position((size + position).lerp(position, 0.5).asCGPoint)
}
```
### Making a custom SIMDRepresentable type
```swift
public struct ScreenDimensions: SIMDRepresentable {
    public typealias UnderlyingSIMDValue = SIMD2<Float>
    public var simd: UnderlyingSIMDValue
    public var width: Float { get { simd.x } set(v) { simd.x = v } }
    public var height: Float { get { simd.y } set(v) { simd.y = v } }
    public var aspectRatios: UnderlyingSIMDValue { simd / simd.reversed }
}
```
### Calculating light ray reflection
```swift
func reflect(planeNormal: SIMD3<Double>, incident: SIMD3<Double>) -> SIMD3<Double {
    let normal = planeNormal.normalized
    return incident - 2 * incident.dot(normal) * normal
}
```
### Fitting four points inside a rectangle
```swift
func fit(points: [SIMD2<Double>], boxSize: CGSize) -> [SIMD2<Double>]
```
