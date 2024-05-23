//
//  TableMapper.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

struct TableMapper {
    public static func map(clientDecodable: ClientDecodable) -> Client {
        return Client(
            clientId: clientDecodable.clientId,
            name: clientDecodable.name,
            phone: clientDecodable.phone,
            address: clientDecodable.address
        )
    }
    
    public static func map(orderDecodable: OrderDecodable) -> Order {
        return Order(
            orderId: orderDecodable.orderId,
            clientId: orderDecodable.clientId,
            service: orderDecodable.service,
            price: orderDecodable.price
        )
    }
}
