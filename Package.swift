// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SimpleSwiftBLE",
    platforms: [.macOS(.v15), .iOS("15.8"), .macCatalyst(.v16)],
    products: [
        .library(name: "SimpleSwiftBLE", targets: ["SimpleSwiftBLE"])
    ],
    targets: [
        .binaryTarget(name: "CSimpleBLE", url: "https://github.com/simpleble/simpleswiftble/releases/download/v1.2.1-dev168/CSimpleBLE.xcframework.zip", checksum: "90a4e34a514a91c7b676c303b5f0df91b3c3dc265b9c714008c3c80c720df5e1"),
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
