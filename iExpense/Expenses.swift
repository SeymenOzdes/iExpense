//
//  Expenses.swift
//  iExpense
//
//  Created by Seymen Özdeş on 28.09.2023.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        let decoder = JSONDecoder()
        
        if let savedİtems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? decoder.decode([ExpenseItem].self, from: savedİtems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}
