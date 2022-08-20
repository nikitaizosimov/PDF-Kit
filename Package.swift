// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PDF-Kit",
    products: [
        .library(
            name: "PDF-Kit",
            targets: ["PDF-Kit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PDF-Kit",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "PDF-KitTests",
            dependencies: ["PDF-Kit"]),
    ]
)
