//
//  ContentView.swift
//  iExpense
//
//  Created by Seymen Özdeş on 27.09.2023.
//

import SwiftUI
struct User: Codable {
    let firstName: String
    let lastName: String
}
struct ContentView: View {
    @StateObject var expenses = Expenses()
        @State private var showingAddExpense = false

        var body: some View {
            NavigationView {
                List {
                    ForEach(expenses.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.type)
                            }

                            Spacer()

                            Text(item.amount, format: .currency(code: "USD")) 
                                .foregroundStyle(item.amount > 100 ? Color.primary : Color.secondary)
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationTitle("iExpense")
                .toolbar {
                    Button {
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: expenses)
                }
            }
        }

        func removeItems(at offsets: IndexSet) {
            expenses.items.remove(atOffsets: offsets)
        }
}

#Preview {
    ContentView()
}
