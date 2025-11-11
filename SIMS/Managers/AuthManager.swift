//
//  AuthManager.swift
//  SIMS
//
//  Created by Chakra  on 2025-11-10.
//

import FirebaseAuth
import Combine

final class AuthManager: ObservableObject {
    @Published var user: User? = nil

    init() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.user = user
        }
    }

    func signUp(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { _, error in
            completion(error)
        }
    }

    func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            completion(error)
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        user = nil
    }
}
