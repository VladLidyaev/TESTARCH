// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HomeScreen",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "HomeScreen",
            targets: ["HomeScreen"]),
    ],
    dependencies: [
      .package(path: "../LayoutHelpers"),
      .package(path: "../Networking"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "HomeScreen",
            dependencies: [
              "LayoutHelpers",
              "Networking"
            ]),
        .testTarget(
            name: "HomeScreenTests",
            dependencies: ["HomeScreen"]),
    ]
)
