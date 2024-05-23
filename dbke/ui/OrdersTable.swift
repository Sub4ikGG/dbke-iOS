//
//  OrdersTable.swift
//  dbke
//
//  Created by Kirill Efremov on 21.05.2024.
//

import SwiftUI

struct OrdersTable: View {
    @State private var tableHeight: CGFloat = 0
    private let minRowWidth: CGFloat = 60
    
    let orders: [Order]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.fixed(20), spacing: 0)], spacing: 0, content: {
                VStack {
                    Text("ID")
                        .fontWeight(.medium)
                        .padding(.leading, 16)
                        .padding(.trailing)
                    
                    Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                    ForEach(orders) { order in
                        Text(String(order.orderId))
                            .padding(.leading, 16)
                            .padding(.trailing)
                        
                        if (orders.lastIndex(where: { $0.id == order.id }) != orders.endIndex - 1) {
                            Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                        }
                    }
                }.padding(.vertical, 16)
                
                Rectangle().fill(Color.background).frame(width: 1, height: tableHeight)
                
                VStack {
                    Text("Client ID").fontWeight(.medium).padding(.horizontal)
                    
                    Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                    ForEach(orders) { order in
                        Text(String(order.clientId)).padding(.horizontal)
                        
                        if (orders.lastIndex(where: { $0.id == order.id }) != orders.endIndex - 1) {
                            Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                        }
                    }
                }.padding(.vertical, 16)
                
                Rectangle().fill(Color.background).frame(width: 1, height: tableHeight)
                
                
                VStack {
                    Text("Service").fontWeight(.medium).padding(.horizontal)
                    
                    Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                    ForEach(orders) { order in
                        Text(order.service).padding(.horizontal)
                        
                        if (orders.lastIndex(where: { $0.id == order.id }) != orders.endIndex - 1) {
                            Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                        }
                    }
                }.padding(.vertical, 16)
                
                Rectangle().fill(Color.background).frame(width: 1, height: tableHeight)
                
                VStack {
                    Text("Price")
                        .fontWeight(.medium)
                        .padding(.trailing, 16)
                        .padding(.leading)
                    
                    Spacer().frame(maxWidth: .infinity, maxHeight: 1).background(Color.background).padding([.vertical], 1.5)
                    ForEach(orders) { order in
                        Text(String(order.price))
                            .padding(.trailing, 16)
                            .padding(.leading)
                        
                        if (orders.lastIndex(where: { $0.id == order.id }) != orders.endIndex - 1) {
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
        OrdersTable(orders: []).listRowInsets(EdgeInsets())
    }
}
