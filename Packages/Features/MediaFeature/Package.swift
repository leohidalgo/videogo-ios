// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MediaFeature",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(name: "MediaFeature", targets: ["MediaFeature"])
    ],
    dependencies: [
        .package(path: "../../Localizable")
    ],
    targets: [
        .target(name: "MediaFeature", dependencies: ["Localizable"])
    ]
)
