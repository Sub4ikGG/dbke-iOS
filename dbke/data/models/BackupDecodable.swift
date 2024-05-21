//
//  BackupDecodable.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct BackupDecodable : Decodable {
    let backupName: String
    let backupType: String
    let backupStartDate: String
    let backupFinishDate: String
    let position: Int
    let backupSize: Int64
}
