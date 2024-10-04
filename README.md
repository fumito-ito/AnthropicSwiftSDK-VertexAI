# Anthropic Swift SDK VertexAI Extension

[Anthropic API Swift SDK](https://github.com/fumito-ito/AnthropicSwiftSDK) Extension for [Google VertexAI](https://cloud.google.com/vertex-ai).

## Installation

### Swift Package Manager

Just add to your Package.swift under dependencies

```swift
let package = Package(
    name: "MyPackage",
    products: [...],
    targets: [
        .target(
            "YouAppModule",
            dependencies: [
                .product(name: "AnthropicSwiftSDK", package: "AnthropicSwiftSDK"),
                .product(name: "AnthropicSwiftSDK-VertexAI", package: "AnthropicSwiftSDK-VertexAI")
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/fumito-ito/AnthropicSwiftSDK.git", from: "0.6.0"),
        .package(url: "https://github.com/fumito-ito/AnthropicSwiftSDK-VertexAI.git", from: "0.0.1")
    ]
)
```

## Usage

To create an `AnthropicVertexAIClient` with a `Model` to access Claude on VertexAI.
The API usage is the same as the normal AnthropicClient.

```swift
let anthropic = AnthropicVertexAIClient(projectId: "your-project-id", accessToken: "access-token-for-vertexai", region = .usCentral1)

let response = try await anthropic.messages.createMessage(Message(role: .user, content: [.text("This is test text")]), maxTokens: 1024)
for content in response.content {
    switch content {
    case .text(let text):
        print(text)
    case .image(let imageContent):
        // handle base64 encoded image content
    }
}
```

Of course, `Streaming Message API` works in the same way.

```swift
let anthropic = AnthropicVertexAIClient(projectId: "your-project-id", accessToken: "access-token-for-vertexai", region = .usCentral1)

let stream = try await anthropic.messages.streamMessage([Message(role: .user, content: [.text("This is test text")])], maxTokens: 1024)
for try await chunk in stream {
    switch chunk.type {
    case .messageStart:
        // handle message start object with casting chunk into `StreamingMessageStartResponse`
    }
}
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[Apache License 2.0](https://choosealicense.com/licenses/apache-2.0/)
