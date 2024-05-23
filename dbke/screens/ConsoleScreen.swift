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
    @StateObject private var viewModel = ConsoleViewModel()
    
    @State private var sqlQuery: String = ""
    @FocusState private var sqlQueryFocus: Bool
    
    @State private var showConsoleAlert: Bool = false
    @State private var alert: ShowAlertEffect? = nil
    
    var body: some View {
        ZStack {
            switch (viewModel.state) {
                case .idle: EmptyView()
                case .loading: ProgressView()
            }
            
            List {
                TextField("Enter SQL-command", text: $sqlQuery, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(4...10)
                    .focused($sqlQueryFocus)
            }
            .navigationTitle("Console")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    if (sqlQuery.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "").isEmpty) {
                        Text("Execute").foregroundStyle(Color.gray)
                    } else {
                        Button(action: {
                            viewModel.obtainIntent(intent: .executeSql(sqlQuery: sqlQuery))
                        }, label: {
                            Text("Execute")
                        })
                    }
                }
            }
        }
        .alert(alert?.title ?? "", isPresented: $showConsoleAlert, actions: {}, message: { Text(alert?.message ?? "") })
        .onReceive(viewModel.$effect, perform: { effect in
            if let alert = effect {
                showAlert(alert: alert)
            }
        })
        .onAppear {
            sqlQueryFocus.toggle()
        }
    }
    
    private func showAlert(alert: ShowAlertEffect) {
        self.alert = alert
        showConsoleAlert = true
    }
}

#Preview {
    ConsoleScreen()
}
