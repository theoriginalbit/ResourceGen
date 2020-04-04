// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ResourceGen",
    platforms: [
        .macOS(.v10_11),
    ],
    products: [
        .executable(name: "ResourceGen", targets: ["ResourceGen"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMajor(from: "0.0.1")),
        .package(url: "https://github.com/tomlokhorst/XcodeEdit", .upToNextMajor(from: "2.7.0")),
    ],
    targets: [
        .target(name: "ResourceGen", dependencies: [
            "ArgumentParser",
            "XcodeEdit",
        ]),
        .testTarget(name: "ResourceGenTests", dependencies: ["ResourceGen"]),
    ])
