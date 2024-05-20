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
            ClientsTable()
        }
        .navigationTitle("Clients")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ClientsScreen()
}
