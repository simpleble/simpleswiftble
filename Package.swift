// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "SimpleSwiftBLE",
    platforms: [.macOS(.v15), .iOS("15.8"), .macCatalyst(.v16)],
    products: [
        .library(name: "SimpleSwiftBLE", targets: ["SimpleSwiftBLE"])
    ],
    targets: [
        .binaryTarget(name: "CSimpleBLE", url: "https://github.com/simpleble/simpleswiftble/releases/download/v1.3.1-dev.35/CSimpleBLE.xcframework.zip", checksum: "721c9a73e266fce225b9bc84d8b1f7104260f4fa07bb982b4ea065473e025b95"),
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
