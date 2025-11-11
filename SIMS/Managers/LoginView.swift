//
//  LoginView.swift
//  SIMS
//
//  Created by Chakra  on 2025-11-10.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authManager: AuthManager
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("SIMS Login")
                .font(.largeTitle).bold()

            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .autocapitalization(.none)

            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)

            Button("Sign In") {
                authManager.signIn(email: email, password: password) { error in
                    if let error = error { errorMessage = error.localizedDescription }
                }
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 10)

            Button("Create Account") {
                authManager.signUp(email: email, password: password) { error in
                    if let error = error { errorMessage = error.localizedDescription }
                }
            }

            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
    }
}

