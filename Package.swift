// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitEx",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "UIKitEx", targets: ["UIKitEx"]),
    ],
    targets: [
        .target(name: "UIKitEx"),
        .testTarget(name: "UIKitExTests", dependencies: ["UIKitEx"]),
    ]
)
