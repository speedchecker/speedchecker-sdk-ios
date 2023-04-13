// swift-tools-version: 5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpeedcheckerSDK",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SpeedcheckerSDK",
            targets: ["SpeedcheckerSDK", "SpeedcheckerReportSDK", "XMLParsing", "Socket", "DataCompression"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "SpeedcheckerSDK",
            path: "Framework/SpeedcheckerSDK.xcframework"
        ),
        .binaryTarget(
            name: "SpeedcheckerReportSDK",
            path: "Framework/SpeedcheckerReportSDK.xcframework"
        ),
        .binaryTarget(
            name: "XMLParsing",
            path: "Framework/XMLParsing.xcframework"
        ),
        .binaryTarget(
            name: "Socket",
            path: "Framework/Socket.xcframework"
        ),
        .binaryTarget(
            name: "DataCompression",
            path: "Framework/DataCompression.xcframework"
        ),
    ]
)
