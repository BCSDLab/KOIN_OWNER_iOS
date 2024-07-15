//
//  koinOwnerApp.swift
//  koinOwner
//
//  Created by 김나훈 on 6/30/24.
//

import SwiftUI

@main
struct KoinOwnerApp: App {
    var body: some Scene {
        WindowGroup {
            ShopRegisterView(registerType: .management)
        }
    }
}
