// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SimpleSwiftBLE",
    platforms: [.macOS(.v15), .iOS("15.8"), .macCatalyst(.v16)],
    products: [
        .library(name: "SimpleSwiftBLE", targets: ["SimpleSwiftBLE"])
    ],
    targets: [
        .binaryTarget(name: "CSimpleBLE", url: "https://github.com/simpleble/simpleswiftble/releases/download/v1.3.0/CSimpleBLE.xcframework.zip", checksum: "06105ccf2489163f10274da7451c795f8db3bfed5b5bcac9e3840f32321c4a89"),
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
