// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "PluggableApplicationDelegate",
    platforms: [
        .iOS(.v14),
        .macCatalyst(.v14),
        .macOS(.v12),
    ],
    products: [
        .library(
            name: "PluggableApplicationDelegate",
            targets: ["PluggableApplicationDelegate"]
        ),
    ],
    targets: [
        .target(
            name: "PluggableApplicationDelegate"
        ),
    ],
    swiftLanguageVersions: [.v6]
)