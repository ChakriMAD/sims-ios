//
//  ContentView.swift
//  SIMS
//
//  Created by Chakra  on 2025-11-09.
//

// Views/InventoryItemRowView.swift
import SwiftUI

struct InventoryItemRowView: View {
    let item: InventoryItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(item.name)
                    .font(.headline)
                
                Text("Qty: \(item.quantity)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text(item.price * Double(item.quantity), format: .currency(code: "USD"))
                .bold()
                .foregroundColor(.green)
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    InventoryItemRowView(
        item: InventoryItem(name: "Apples", quantity: 10, price: 1.5)
    )
    .previewLayout(PreviewLayout.sizeThatFits)
    .padding()
}
