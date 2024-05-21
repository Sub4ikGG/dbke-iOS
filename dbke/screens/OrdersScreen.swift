//
//  OrdersScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 21.05.2024.
//

import SwiftUI

struct OrdersScreen: View {
    var body: some View {
        List {
            OrdersTable().listRowInsets(EdgeInsets())
        }
        .navigationTitle("Orders")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    ConsoleScreen(table: .orders)
                } label: {
                    Text("Console")
                }
            }
        }
    }
}

#Preview {
    OrdersScreen()
}
