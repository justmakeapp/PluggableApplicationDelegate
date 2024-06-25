// swift-tools-version:5.9

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
            name: "PluggableApplicationDelegate",
            swiftSettings: makeMigrateSwift6SwiftSettings()
        ),
    ]
)

private func makeMigrateSwift6SwiftSettings() -> [SwiftSetting] {
    [
        //        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_CONCISE_MAGIC_FILE"),
//        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_DEPRECATE_APPLICATION_MAIN"),
//        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_DISABLE_OUTWARD_ACTOR_ISOLATION"),
//        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_FORWARD_TRAILING_CLOSURES"),
//        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_IMPLICIT_OPEN_EXISTENTIALS"),
//        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_IMPORT_OBJC_FORWARD_DECLS"),
//        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_INFER_SENDABLE_FROM_CAPTURES"),
//        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_ISOLATED_DEFAULT_VALUES"),
//        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_GLOBAL_CONCURRENCY"),
//        .enableUpcomingFeature("SWIFT_UPCOMING_FEATURE_REGION_BASED_ISOLATION"),
//        .enableExperimentalFeature("StrictConcurrency=complete"),
//        .swiftLanguageVersion(.v6)
    ]
}
