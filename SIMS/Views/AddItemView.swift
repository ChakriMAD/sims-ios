//
//  InventoryViewModel.swift
//  SIMS
//
//  Created by Chakra  on 2025-11-09.
//

// Views/AddItemView.swift
import SwiftUI

struct AddItemView: View {
    @ObservedObject var viewModel: InventoryItemsViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var name: String = ""
    @State private var quantity: String = ""
    @State private var price: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Item Details")) {
                    TextField("Item Name", text: $name)
                    TextField("Quantity", text: $quantity)
                        .keyboardType(.numberPad)
                    TextField("Price per Unit", text: $price)
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("Add Item")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        guard let qty = Int(quantity),
                              let unitPrice = Double(price),
                              !name.isEmpty else { return }
                        viewModel.addItem(name: name, quantity: qty, price: unitPrice)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}


    #Preview {
        AddItemView(viewModel: InventoryItemsViewModel(userId: "previewUser"))
    }


