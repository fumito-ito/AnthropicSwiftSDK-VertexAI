// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnthropicSwiftSDK-VertexAI",
    platforms: [
        .iOS(.v17),
        .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AnthropicSwiftSDK-VertexAI",
            targets: ["AnthropicSwiftSDK-VertexAI"]),
    ],
    dependencies: [
        .package(url: "https://github.com/fumito-ito/AnthropicSwiftSDK", branch: "feature/remove-vertexai-extension")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AnthropicSwiftSDK-VertexAI",
            dependencies: [
                .product(name: "AnthropicSwiftSDK", package: "AnthropicSwiftSDK")
            ]
        ),
        .target(
            name: "AnthropicSwiftSDK-TestUtils",
            dependencies: [
                .product(name: "AnthropicSwiftSDK", package: "AnthropicSwiftSDK")
            ]
        ),
        .testTarget(
            name: "AnthropicSwiftSDK-VertexAITests",
            dependencies: [
                "AnthropicSwiftSDK-VertexAI",
                "AnthropicSwiftSDK-TestUtils",
            ]
        ),
    ]
)
