// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreUI",
    platforms: [
        .iOS(.v15)
        ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreUI",
            targets: ["CoreUI"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/airbnb/lottie-ios",
            from: "4.3.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoreUI",
            dependencies: [
                .product(
                    name: "Lottie", package: "lottie-ios")
                ]
        ),
        .testTarget(
            name: "CoreUITests",
            dependencies: ["CoreUI"]
        ),
    ]
)

