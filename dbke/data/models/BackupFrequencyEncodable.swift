//
//  ScheduleFrequencyEncodable.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct BackupFrequencyEncodable : Encodable {
    let databaseName: String
    let intervalInMinutes: String
}
