//
//  ShaadiDotComMachineCodingAppApp.swift
//  ShaadiDotComMachineCodingApp
//
//  Created by Shashwat Panda on 04/02/25.
//

import SwiftUI
import SwiftData

@main
struct ShaadiDotComMachineCodingAppApp: App {
    
    
    private var mc: ModelContainer {
        try! ModelContainer(for: Profiles.self)
    }
    
    var body: some Scene {
        WindowGroup {
            ProfileView()
        }
        .modelContainer(mc)
    }
}
