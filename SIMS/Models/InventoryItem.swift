//
//  InventoryItem.swift
//  SIMS
//
//  Created by Chakra  on 2025-11-10.
//
// Models/InventoryItem.swift
import FirebaseFirestoreSwift

struct InventoryItem: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var quantity: Int
    var price: Double
    var userId: String?  //  added to track which user owns this item

    init(name: String, quantity: Int, price: Double, userId: String? = nil) {
        self.name = name
        self.quantity = quantity
        self.price = price
        self.userId = userId
    }
}

