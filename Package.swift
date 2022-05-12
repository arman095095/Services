// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private let dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
    .package(url: "https://github.com/arman095095/NetworkServices.git", branch: "develop"),
    .package(url: "https://github.com/arman095095/ModelInterfaces.git", branch: "develop")
]

let package = Package(
    name: "Services",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Services",
            targets: ["Services"]),
    ],
    dependencies: dependencies,
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Services",
            dependencies: [.product(name: "Swinject", package: "Swinject"),
                           .product(name: "NetworkServices", package: "NetworkServices"),
                           .product(name: "ModelInterfaces", package: "ModelInterfaces")]),
    ]
)