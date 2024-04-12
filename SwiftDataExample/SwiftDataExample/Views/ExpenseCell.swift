//
//  ExpenseCell.swift
//  SwiftDataExample
//
//  Created by Guilherme Nunes Lobo on 12/04/24.
//

import SwiftUI

struct ExpenseCell: View {
    let expense: Expense
    
    var body: some View {
        HStack{
            Text(expense.date, format: .dateTime.month(.abbreviated).day())
                .frame(width: 70, alignment: .leading)
            Text(expense.name)
            Spacer()
            Text(expense.value, format: .currency(code: "BRL")) //trocar para USD se der merda
        }
    }
}

//#Preview {
//    ExpenseCell(expense: <#Expense#>)
//}
