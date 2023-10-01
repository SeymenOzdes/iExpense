//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Seymen Özdeş on 28.09.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID() 
    let name: String
    let type: String
    let amount: Double
}
