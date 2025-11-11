//
//  InventoryItemsViewModel.swift
//  SIMS
//
//  Created by Chakra  on 2025-11-09.
//
// ViewModels/InventoryItemsViewModel.swift
import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift


@MainActor
final class InventoryItemsViewModel: ObservableObject {
    @Published var items: [InventoryItem] = []
    private let db = Firestore.firestore()
    private let collection = "inventoryItems"
    private var userId: String

    init(userId: String) {
        self.userId = userId
        fetchItems()
    }

    func fetchItems() {
        db.collection(collection)
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else { return }
                self.items = documents.compactMap { try? $0.data(as: InventoryItem.self) }
            }
    }

    func addItem(name: String, quantity: Int, price: Double) {
        let newItem = InventoryItem(name: name, quantity: quantity, price: price, userId: userId)
        try? db.collection(collection).addDocument(from: newItem)
    }

    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            if let id = items[index].id {
                db.collection(collection).document(id).delete()
            }
        }
    }

    func totalValue() -> Double {
        items.reduce(0) { $0 + (Double($1.quantity) * $1.price) }
    }
}

