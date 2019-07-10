// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "GraphQL",
    platforms: [
        .macOS(.v10_13), .iOS(.v9),
    ],
    products: [
        .library(name: "GraphQL", targets: ["GraphQL"]),
        .executable(name: "graphql-generate", targets: ["GraphQL-Generate"])
    ],
    dependencies: [],
    targets: [
        .target(name: "GraphQL", dependencies: []),
        .testTarget(name: "GraphQLTests", dependencies: ["GraphQL"]),
        .target(name: "GraphQL-Generate", dependencies: [])
    ]
)
