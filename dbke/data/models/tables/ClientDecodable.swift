//
//  ClientDecodable.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct ClientDecodable : Decodable {
    let clientId: Int
    let name: String
    let phone: String
    let address: String
}
