//
//  BraineyApp.swift
//  Brainey
//
//  Created by Vitaly Bastrikov on 2022-04-17.
//

import SwiftUI
import Firebase

@main
struct BraineyApp: App {
    @ObservedObject var appState = AppState()
        
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(appState)
        }
    }
}
