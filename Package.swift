// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "NekoBox-iOS",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "NekoBox",
            targets: ["NekoBox"]
        ),
        .executable(
            name: "NekoBoxApp",
            targets: ["NekoBox"]
        )
    ],
    dependencies: [
        // Добавим сюда будущие зависимости
    ],
    targets: [
        .target(
            name: "NekoBox",
            dependencies: [],
            path: "NekoBox-iOS"
        ),
        .testTarget(
            name: "NekoBoxTests",
            dependencies: ["NekoBox"],
            path: "NekoBox-iOS"
        )
    ]

)
