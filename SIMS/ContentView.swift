//
//  ContentView.swift
//  SIMS
//
//  Created by Chakra  on 2025-11-09.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @StateObject private var authManager = AuthManager()

    var body: some View {
        Group {
            if let user = authManager.user {
                // When logged in, load inventory linked to this user
                InventoryListView(viewModel: InventoryItemsViewModel(userId: user.uid))
            } else {
                // Otherwise show login screen
                LoginView(authManager: authManager)
            }
        }
        .animation(.easeInOut, value: authManager.user != nil)
    }
}
