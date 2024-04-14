//
//  UpdateExpenseSheet.swift
//  SwiftDataExample
//
//  Created by Guilherme Nunes Lobo on 14/04/24.
//

import SwiftUI

struct UpdateExpenseSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Bindable var expense : Expense
    
    var body: some View {
        NavigationStack {
            Form{
                TextField("Expense Name",text: $expense.name)
                DatePicker("Date Picker",selection: $expense.date, displayedComponents: .date)
                TextField("Value",value: $expense.value, format: .currency(code: "BRL")).keyboardType(.decimalPad)
            }
            .navigationTitle("Update Expense")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing){
                    Button("Done"){
                        dismiss()
                    }
                }
            }
        }
    }
}
//
//#Preview {
//    UpdateExpenseSheet()
//}
