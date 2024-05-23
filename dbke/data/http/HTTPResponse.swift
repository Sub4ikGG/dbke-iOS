//
//  HTTPResponse.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct HTTPResponse <D: Decodable> {
    let code: Int
    let message: String
    let data: D?
}
