//
//  ClientsTable.swift
//  dbke
//
//  Created by Kirill Efremov on 20.05.2024.
//

import SwiftUI

struct ClientsTable: View {
    @State private var tableHeight: CGFloat = 0
    private let minRowWidth: CGFloat = 60
    
    let clients: [Client]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(20), spacing: 0)], spacing: 0, content: {
                VStack {
                    Text("ID")
                        .fontWeight(.medium)
                        .padding(.leading, 16)
                        .padding(.trailing)
                    
                    Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                    ForEach(clients) { client in
                        Text(String(client.clientId))
                            .padding(.leading, 16)
                            .padding(.trailing)
                        
                        if (clients.lastIndex(where: { $0.id == client.id }) != clients.endIndex - 1) {
                            Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                        }
                    }
                }.padding(.vertical, 16)
                
                Rectangle().fill(Color.background).frame(width: 1, height: tableHeight)
                
                VStack {
                    Text("Name").fontWeight(.medium).padding(.horizontal)
                    
                    Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                    ForEach(clients) { client in
                        Text(String(client.name)).padding(.horizontal)
                        
                        if (clients.lastIndex(where: { $0.id == client.id }) != clients.endIndex - 1) {
                            Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                        }
                    }
                }.padding(.vertical, 16)
                
                Rectangle().fill(Color.background).frame(width: 1, height: tableHeight)
                
                
                VStack {
                    Text("Phone").fontWeight(.medium).padding(.horizontal)
                    
                    Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                    ForEach(clients) { client in
                        Text(String(client.phone)).padding(.horizontal)
                        
                        if (clients.lastIndex(where: { $0.id == client.id }) != clients.endIndex - 1) {
                            Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                        }
                    }
                }.padding(.vertical, 16)
                
                Rectangle().fill(Color.background).frame(width: 1, height: tableHeight)
                
                VStack {
                    Text("Address")
                        .fontWeight(.medium)
                        .padding(.trailing, 16)
                        .padding(.leading)
                    
                    Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                    ForEach(clients) { client in
                        Text(String(client.address))
                            .padding(.trailing, 16)
                            .padding(.leading)
                        
                        if (clients.lastIndex(where: { $0.id == client.id }) != clients.endIndex - 1) {
                            Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                        }
                    }
                }.padding(.vertical, 16)
            }).background(
                Color.clear.background(
                    GeometryReader { proxy -> Color in
                        DispatchQueue.main.async {
                            tableHeight = proxy.size.height
                        }
                        
                        return Color.clear
                    }
                )
            )
        }
    }
}

#Preview {
    List {
        ClientsTable(clients: []).listRowInsets(EdgeInsets())
    }
}
