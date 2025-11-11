//
//  InventoryListView.swift
//  SIMS
//
//  Created by Chakra  on 2025-11-09.
//

// Views/InventoryListView.swift
import SwiftUI

struct InventoryListView: View {
    @StateObject private var viewModel = InventoryItemsViewModel()
    @State private var showingAddSheet = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    ForEach(viewModel.items) { item in
                        InventoryItemRowView(item: item)
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }
                .listStyle(.insetGrouped)
                
                Divider()
                
                HStack {
                    Text("Total Inventory Value:")
                        .font(.headline)
                    Spacer()
                    Text(viewModel.totalValue(), format: .currency(code: "USD"))
                        .font(.headline)
                        .foregroundColor(.blue)
                }
                .padding()
                .background(Color(.systemGray6))
            }
            .navigationTitle("Inventory")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddSheet = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddItemView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    InventoryListView()
}
