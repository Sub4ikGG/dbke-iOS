//
//  OrdersScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 21.05.2024.
//

import SwiftUI

struct OrdersScreen: View {
    @StateObject private var viewModel = TableViewModel<Order>()
    
    @State private var showConsoleAlert: Bool = false
    @State private var alert: ShowAlertEffect? = nil
    
    var body: some View {
        List {
            switch (viewModel.state) {
            case .idle(let orders):
                OrdersTable(orders: orders).listRowInsets(EdgeInsets())
            case .loading:
                ProgressView().id(UUID())
            }
        }
        .navigationTitle("Orders")
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
            viewModel.obtainIntent(intent: .getOrdersTable)
        }
    }
    
    private func showAlert(alert: ShowAlertEffect) {
        self.alert = alert
        showConsoleAlert = true
    }
}

#Preview {
    OrdersScreen()
}
