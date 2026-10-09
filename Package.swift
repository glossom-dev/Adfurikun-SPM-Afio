// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Adfurikun-SPM-Afio",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AdfurikunAfio", targets: ["AdfurikunAfio"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/glossom-dev/Adfurikun-SPM-Core.git",
            exact: "4.5.0-alpha.3"
        ),
        .package(
            url: "https://github.com/amoad/amoad-ios-sdk",
            exact: "6.3.0"
        ),
    ],
    targets: [
        .target(
            name: "AdfurikunAfio",
            dependencies: [
                .product(name: "AdfurikunSDK", package: "Adfurikun-SPM-Core"),
                .product(name: "AMoAd", package: "amoad-ios-sdk")
            ],
            path: "Sources",
            publicHeadersPath: ".",
            swiftSettings: [
                .swiftLanguageMode(.v5)
            ]
        )
    ]
)
