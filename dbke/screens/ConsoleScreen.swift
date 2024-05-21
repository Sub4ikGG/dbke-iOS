//
//  ConsoleScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 21.05.2024.
//

import SwiftUI

enum ConsoleTable {
    case clients
    case orders
}

struct ConsoleScreen: View {
    let table: ConsoleTable
    
    @State private var sqlCommand: String = ""
    @FocusState private var sqlCommandFocus: Bool
    
    var body: some View {
        List {
            TextField("Enter SQL-command", text: $sqlCommand, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(4...10)
                .focused($sqlCommandFocus)
        }
        .navigationTitle("Console")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if (sqlCommand.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "").isEmpty) {
                    Text("Execute").foregroundStyle(Color.gray)
                } else {
                    Button(action: {}, label: {
                        Text("Execute")
                    })
                }
            }
        }
        .onAppear {
            sqlCommandFocus.toggle()
        }
    }
}

#Preview {
    ConsoleScreen(table: .clients)
}
