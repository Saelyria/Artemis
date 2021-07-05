// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Artemis",
    platforms: [
        .macOS(.v10_10), .iOS(.v8),
    ],
    products: [
        .library(name: "Artemis", targets: ["Artemis"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Artemis", dependencies: []),
        .testTarget(name: "ArtemisTests", dependencies: ["Artemis"]),
    ],
    swiftLanguageVersions: [.v5]
)
