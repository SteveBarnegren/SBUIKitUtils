// swift-tools-version:5.1
import PackageDescription

let package = Package(name: "SBUIKitUtils",
                      platforms: [.iOS(.v12),
                                  .tvOS(.v12)],
                      products: [.library(name: "SBUIKitUtils",
                                          targets: ["SBUIKitUtils"])],
                      targets: [.target(name: "SBUIKitUtils",
                                        path: "SBUIKitUtils"),
                                .testTarget(name: "SBUIKitUtilsTests",
                                            dependencies: ["SBUIKitUtils"],
                                            path: "SBUIKitUtilsTests")],
                      swiftLanguageVersions: [.v5])
