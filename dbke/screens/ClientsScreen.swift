//
//  ClientsScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 20.05.2024.
//

import SwiftUI

struct ClientsScreen: View {
    var body: some View {
        List {
            ClientsTable().listRowInsets(EdgeInsets())
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
    }
}

#Preview {
    ClientsScreen()
}
