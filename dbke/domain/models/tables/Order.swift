//
//  Order.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct Order : Identifiable {
    let id = UUID()
    
    let orderId: Int
    let clientId: Int
    let service: String
    let price: Int
}
