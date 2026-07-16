// swift-tools-version: 6.0
import PackageDescription

let releaseVersion = "4.4.000"

let package = Package(
    name: "Adfurikun-SPM-Afio",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AdfurikunAfio", targets: ["AdfurikunAfio"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/glossom-dev/Adfurikun-SPM-Core.git",
            from: "4.4.000"
        ),
    ],
    targets: [
        .binaryTarget(
            name: "AMoAd",
            url: "https://github.com/glossom-dev/Adfurikun-SPM-Afio/releases/download/\(releaseVersion)/AMoAd.xcframework.zip",
            checksum: "e8b55c0f6f22e3a49bd4fcfe7e9b85efe32216fd05fb44933889586e5a256214"
        ),
        .binaryTarget(
            name: "OMSDK_Cyberagentcojp3",
            url: "https://github.com/glossom-dev/Adfurikun-SPM-Afio/releases/download/\(releaseVersion)/OMSDK_Cyberagentcojp3.xcframework.zip",
            checksum: "a61392f3cc7668ee65fa0c2fd2dce8531bdfbea2d6f5ac4a1e82bfafd403498a"
        ),
        .target(
            name: "AdfurikunAfio",
            dependencies: [
                .product(name: "AdfurikunSDK", package: "Adfurikun-SPM-Core"),
                "AMoAd",
                "OMSDK_Cyberagentcojp3",
            ],
            path: "Sources",
            publicHeadersPath: ".",
            swiftSettings: [
                .swiftLanguageMode(.v5)
            ],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedFramework("AdSupport"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("ImageIO"),
                .linkedFramework("StoreKit"),
            ]
        )
    ]
)
