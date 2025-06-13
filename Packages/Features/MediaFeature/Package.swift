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
        .package(path: "../../Localizable"),
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.12.0"
        ),
        .package(
            name: "Firebase",
            url: "https://github.com/firebase/firebase-ios-sdk",
            from: "11.14.0"
        )
    ],
    targets: [
        .target(
            name: "MediaFeature",
            dependencies: [
                "Localizable",
                .product(name: "FirebaseFirestore", package: "Firebase"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "MediaFeatureTests",
            dependencies: [
                "MediaFeature"
            ],
            path: "Tests"
        ),
        .testTarget(
            name: "MediaFeatureSnapshotTests",
            dependencies: [
                "MediaFeature",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing"),
            ],
            path: "SnapshotTests"
        )
    ]
)
