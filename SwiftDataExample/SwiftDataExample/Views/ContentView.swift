//
//  ContentView.swift
//  SwiftDataExample
//
//  Created by Guilherme Nunes Lobo on 12/04/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    // State para controlar a exibição da folha de adição de despesa
    @State private var isShowingItemSheet = false
    // Query para recuperar e classificar despesas do banco de dados
    @Query(sort: \Expense.date) var expenses: [Expense] = []
    // Referência ao contexto do modelo para realizar operações de banco de dados
    @Environment(\.modelContext) var context
    // State para rastrear a despesa que está sendo editada
    @State private var expenseToEdit: Expense?
    
    var body: some View {
        
        NavigationStack{
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseToEdit = expense // Define a despesa a ser editada
                        }
                }.onDelete { indexSet in
                    for index in indexSet {
                        context.delete(expenses[index]) // Remove despesa do banco de dados
                    }
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) { AddExpenseSheet() } // Apresenta a modal de despesa
            .sheet(item: $expenseToEdit) { expense  in // Apresenta a modal de atualização de despesa se expenseToEdit não for nulo
                UpdateExpenseSheet(expense: expense)
            }
            .toolbar{
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus"){ // Botão para adicionar despesa
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty{ // Exibe uma mensagem quando não há despesas
                    ContentUnavailableView(label: {
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start adding expenses to see your list.")
                    },actions: {
                        Button("Add Expense") {isShowingItemSheet = true }
                    })
                    .offset(y: -60) // Ajuste de posição para a mensagem
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
