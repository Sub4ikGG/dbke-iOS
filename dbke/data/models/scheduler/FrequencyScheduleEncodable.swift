//
//  FrequencyScheduleEncodable.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct FrequencyScheduleEncodable : Encodable {
    let databaseName: String
    let intervalInMinutes: Int
}
