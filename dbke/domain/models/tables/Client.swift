//
//  Client.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct Client : Identifiable {
    let id = UUID()
    
    let clientId: Int
    let name: String
    let phone: String
    let address: String
}
