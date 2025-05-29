// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SIMDExtensions",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SIMDExtensions",
            targets: ["SIMDExtensions"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/keyvariable/kvSIMD.swift.git", from: "1.1.0"),
        .package(url: "https://github.com/apple/swift-numerics.git", from: "1.0.3")
    ],
    targets: [
        .target(
            name: "CHighway",
            path: "Sources/CHighway",
            exclude: ["highway/tests"],
            sources: ["hwy_add.cpp"],
            publicHeadersPath: "include",
            cxxSettings: [
                .headerSearchPath("highway"),
                .define("HWY_STATIC"),
                .unsafeFlags(["-std=c++17", "-flto"])
            ]),
        .target(
            name: "SIMDExtensions",
            dependencies: [
                .product(name: "kvSIMD", package: "kvSIMD.swift"),
                .product(name: "Numerics", package: "swift-numerics"),
                .product(name: "RealModule", package: "swift-numerics"),
                .product(name: "ComplexModule", package: "swift-numerics"),
                "CHighway"
            ]),
        .testTarget(
            name: "SIMDExtensionsTests",
            dependencies: ["SIMDExtensions"]),
        .testTarget(
            name: "CHighwayTests",
            dependencies: ["CHighway"]),
    ]
)
