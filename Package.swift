// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "KeyboardLocationReader",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "KeyboardLocationReader",
            targets: ["KeyboardLocationReader"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Lakr233/MSDisplayLink", from: "1.1.1"),
    ],
    targets: [
        .target(name: "KeyboardLocationReader", dependencies: [
            "MSDisplayLink",
        ]),
    ]
)
