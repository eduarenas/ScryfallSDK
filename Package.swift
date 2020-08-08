// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScryfallSDK",
    platforms: [.macOS(.v10_12), .iOS(.v8), .watchOS(.v2), .tvOS(.v9)],
    products: [
        .library(
            name: "ScryfallSDK",
            targets: ["ScryfallSDK"]),
    ],
    targets: [
        .target(
            name: "ScryfallSDK",
            dependencies: []),
        .testTarget(
            name: "ScryfallSDKTests",
            dependencies: ["ScryfallSDK"]),
    ]
)
