// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpeedcheckerSDK-spm",
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
            path: "Framework/xcode14.1/SpeedcheckerSDK.xcframework"
        ),
        .binaryTarget(
            name: "SpeedcheckerReportSDK",
            path: "Framework/xcode14.1/SpeedcheckerReportSDK.xcframework"
        ),
        .binaryTarget(
            name: "XMLParsing",
            path: "Framework/xcode14.1/XMLParsing.xcframework"
        ),
        .binaryTarget(
            name: "Socket",
            path: "Framework/xcode14.1/Socket.xcframework"
        ),
        .binaryTarget(
            name: "DataCompression",
            path: "Framework/xcode14.1/DataCompression.xcframework"
        ),
    ]
)
