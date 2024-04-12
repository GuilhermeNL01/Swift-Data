//
//  Expense.swift
//  SwiftDataExample
//
//  Created by Guilherme Nunes Lobo on 12/04/24.
//

import Foundation
import SwiftData

@Model
class Expense {
    @Attribute(.unique)  var name: String
    var date: Date
    var value: Double
    
    init(name: String, date: Date, value: Double) {
        self.name = name
        self.date = date
        self.value = value
    }
}
