//
//  SqlRequestEncodable.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct SqlRequestEncodable : Encodable {
    let sqlQuery: String
}
