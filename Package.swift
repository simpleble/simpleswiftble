// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SimpleSwiftBLE",
    platforms: [.macOS(.v15), .iOS("15.8"), .macCatalyst(.v16)],
    products: [
        .library(name: "SimpleSwiftBLE", targets: ["SimpleSwiftBLE"])
    ],
    targets: [
        .binaryTarget(name: "CSimpleBLE", url: "https://github.com/simpleble/simpleswiftble/releases/download/v1.3.1-dev.2/CSimpleBLE.xcframework.zip", checksum: "bcda41f3870033ea9dcb42c3c1b66c69bed08b033618dea10cf5f0bfb63e9c9b"),
        .target(
            name: "SimpleSwiftBLE",
            dependencies: ["CSimpleBLE"],
            path: "Sources/SimpleSwiftBLE",
            linkerSettings: [
                .linkedFramework("CoreBluetooth"),
                .linkedFramework("IOBluetooth", .when(platforms: [.macOS])),
                .linkedFramework("IOKit", .when(platforms: [.macOS])),
            ]
        ),
    ]
)
