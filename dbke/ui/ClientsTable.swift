//
//  ClientsTable.swift
//  dbke
//
//  Created by Kirill Efremov on 20.05.2024.
//

import SwiftUI

struct Client : Identifiable {
    let id = UUID()
    let clientId: Int
    let name: String
    let phone: String
    let address: String
}

struct ClientsTable: View {
    private let minRowWidth: CGFloat = 90
    
    let clients = [
        Client(clientId: 0, name: "Kirill", phone: "79046577579", address: "Address #1"),
        Client(clientId: 1, name: "Kirill", phone: "79046577579", address: "Address #2"),
        Client(clientId: 2, name: "Kirill", phone: "79046577579", address: "Address #3"),
        Client(clientId: 3, name: "Kirill", phone: "79046577579", address: "Address #4"),
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Grid {
                GridRow {
                    Text("ID").frame(minWidth: minRowWidth)
                    Text("Name").frame(minWidth: minRowWidth)
                    Text("Phone").frame(minWidth: minRowWidth)
                    Text("Address").frame(minWidth: minRowWidth)
                }
                
                ForEach(clients) { client in
                    Spacer().frame(height: 1).background(Color.background).padding([.vertical], 1.5)
                    Button(action: {}, label: {
                        GridRow {
                            Text(String(client.clientId)).frame(minWidth: minRowWidth)
                            Text(client.name).frame(minWidth: minRowWidth)
                            Text(client.phone).frame(minWidth: minRowWidth)
                            Text(client.address).frame(minWidth: minRowWidth)
                        }.foregroundStyle(.appBlack)
                    })
                }
            }
        }.listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
    }
}

#Preview {
    List {
        ClientsTable()
    }
}
