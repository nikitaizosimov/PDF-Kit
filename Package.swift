// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PDF-Kit",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(
            name: "PDF-Kit",
            targets: ["PDF-Kit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.1"))
    ],
    targets: [
        .target(
            name: "PDF-Kit",
            dependencies: [
                .product(name: "SnapKit", package: "SnapKit")
            ],
            path: "Sources",
            resources: [
                .process("Assets"),
            ]
        ),
        .testTarget(
            name: "PDF-KitTests",
            dependencies: ["PDF-Kit"]),
    ]
)
