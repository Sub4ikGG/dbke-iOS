//
//  TablesScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 20.05.2024.
//

import SwiftUI

struct TablesScreen: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                NavigationLink {
                    ClientsScreen()
                } label: {
                    TableCard(
                        title: "Clients",
                        description: "Client ID, Name, Phone & Address",
                        icon: .emojiBusiness
                    )
                }
                
                NavigationLink {
                    HStack {}
                    .navigationTitle("Orders")
                } label: {
                    TableCard(
                        title: "Orders",
                        description: "Order ID, Client ID, Service & Price",
                        icon: .emojiGreenBook
                    )
                }
            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.background))
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    HStack {}
                    .navigationTitle("Configure")
                } label: {
                    Text("Configure")
                }
            }
        }
        .navigationTitle("DBKE")
    }
}

#Preview {
    TablesScreen()
}
