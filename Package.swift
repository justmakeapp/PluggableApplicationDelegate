// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "PluggableApplicationDelegate",
    platforms: [
        .iOS(.v14),
        .macCatalyst(.v14),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "PluggableApplicationDelegate",
            targets: ["PluggableApplicationDelegate"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PluggableApplicationDelegate",
            dependencies: []
        ),
    ]
)
