//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by Guilherme Nunes Lobo on 12/04/24.
//

import SwiftUI
import SwiftData
@main
struct SwiftDataExampleApp: App {
//    (OUTRA MANEIRA DE SE FAZER)
//    let container: ModelContainer = {
//        let schema = Schema([Expense.self])
//        let container = try! ModelContainer(for: schema, configurations: [])
//        return container
//    }()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
      //  .modelContainer(container)
        .modelContainer(for: [Expense.self])
    }
}
