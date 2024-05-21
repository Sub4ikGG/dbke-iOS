//
//  RestoreDatabaseEncodable.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct RestoreDatabaseEncodable : Encodable {
    let databaseName: String
    let position: Int
}
