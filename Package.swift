// swift-tools-version: 6.3

import CompilerPluginSupport
import PackageDescription

let package: Package = .init(
    name: "ObservableUserDefault",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13), .visionOS(.v1)],
    products: [
        .library(
            name: "ObservableUserDefault",
            targets: ["ObservableUserDefault"],
        ),
        .executable(
            name: "ObservableUserDefaultClient",
            targets: ["ObservableUserDefaultClient"],
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", "600.0.0" ..< "604.0.0"),
    ],
    targets: [
        .macro(
            name: "ObservableUserDefaultMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
            ],
        ),
        .target(
            name: "ObservableUserDefault",
            dependencies: ["ObservableUserDefaultMacros"],
            swiftSettings: [.swiftLanguageMode(.v6)],
        ),
        .executableTarget(
            name: "ObservableUserDefaultClient",
            dependencies: ["ObservableUserDefault"],
            swiftSettings: [.swiftLanguageMode(.v6)],
        ),
        .testTarget(
            name: "ObservableUserDefaultTests",
            dependencies: [
                "ObservableUserDefaultMacros",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ],
        ),
    ],
)
