// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Localizable",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(name: "Localizable", targets: ["Localizable"])
    ],
    targets: [
        .target(name: "Localizable")
    ]
)
