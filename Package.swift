// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Thoth",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ThothCore",
            targets: ["ThothCore"]
        ),
        .library(
            name: "ThothYandex",
            targets: ["ThothYandex"]
        ),
        .library(
            name: "ThothAppsFlyer",
            targets: ["ThothAppsFlyer"]
        ),
        .library(
            name: "ThothFirebase",
            targets: ["ThothFirebase"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/yandexmobile/metrica-sdk-ios",
            .upToNextMajor(from: "4.2.0")
        ),
        .package(
            url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework-Strict",
            .upToNextMajor(from: "6.8.0")
        ),
        .package(
            url: "https://github.com/firebase/firebase-ios-sdk",
            .upToNextMajor(from: "8.8.0")
        )
    ],
    targets: [
        .target(
            name: "ThothCore",
            dependencies: []
        ),
        .target(
            name: "ThothYandex",
            dependencies: [
                "ThothCore",
                .product(name: "YandexMobileMetrica", package: "metrica-sdk-ios")
            ]
        ),
        .target(
            name: "ThothAppsFlyer",
            dependencies: [
                "ThothCore",
                .product(name: "AppsFlyerLib-Strict", package: "AppsFlyerFramework-Strict")
            ]
        ),
        .target(
            name: "ThothFirebase",
            dependencies: [
                "ThothCore",
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "FirebasePerformance", package: "firebase-ios-sdk")
            ]
        )
    ]
)
