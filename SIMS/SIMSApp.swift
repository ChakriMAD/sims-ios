//
//  SIMSApp.swift
//  SIMS
//
//  Created by Chakra  on 2025-11-09.
//
import SwiftUI
import FirebaseCore

@main
struct SIMSApp: App {
    // Initialize Firebase when the app starts
    init() {
        FirebaseApp.configure()
        print("Firebase configured successfully!")
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}









