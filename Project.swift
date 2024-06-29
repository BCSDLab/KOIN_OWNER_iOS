import ProjectDescription

let project = Project(
    name: "KOIN_OWNER_iOS",
    organizationName: "com.bcsdlab",
    targets: [
        Target(
            name: "KOIN_OWNER_iOS",
            platform: .iOS,
            product: .app,
            bundleId: "com.bcsdlab.koinOwner",
            infoPlist: "Info.plist",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: []
        )
    ]
)
