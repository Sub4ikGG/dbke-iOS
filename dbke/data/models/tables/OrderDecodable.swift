//
//  OrderDecodable.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct OrderDecodable : Decodable {
    let orderId: Int
    let clientId: Int
    let service: String
    let price: String
}
