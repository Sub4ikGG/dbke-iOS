//
//  ClientsScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 20.05.2024.
//

import SwiftUI

struct ClientsScreen: View {
    @StateObject private var viewModel = TableViewModel<Client>()
    
    @State private var showConsoleAlert: Bool = false
    @State private var alert: ShowAlertEffect? = nil
    
    var body: some View {
        List {
            switch (viewModel.state) {
            case .idle(let clients):
                ClientsTable(clients: clients).listRowInsets(EdgeInsets())
            case .loading:
                ProgressView().id(UUID())
            }
        }
        .navigationTitle("Clients")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    ConsoleScreen()
                } label: {
                    Text("Console")
                }
            }
        }
        .alert(
            alert?.title ?? "",
            isPresented: $showConsoleAlert,
            actions: {},
            message: { Text(alert?.message ?? "") }
        )
        .onReceive(viewModel.$effect, perform: { effect in
            if let alert = effect {
                showAlert(alert: alert)
            }
        })
        .onAppear {
            viewModel.obtainIntent(intent: .getClientsTable)
        }
    }
    
    private func showAlert(alert: ShowAlertEffect) {
        self.alert = alert
        showConsoleAlert = true
    }
}

#Preview {
    ClientsScreen()
}
