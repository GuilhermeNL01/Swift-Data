//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Guilherme Nunes Lobo on 12/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingItemSheet = false
    var expenses: [Expense] = []
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) { AddExpenseSheet() }
            .toolbar{
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus"){
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty{
                    ContentUnavailableView(label: {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding expenses to see your list.")
                    },actions: {
                        Button("Add Expense") {isShowingItemSheet = true }
                    })
                    .offset(y: -60)
                    }
                }
            }
        }
    }

#Preview {
    ContentView()
}


