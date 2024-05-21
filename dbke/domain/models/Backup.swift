//
//  Backup.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct Backup : Identifiable {
    let id = UUID()
    
    let backupName: String
    let backupType: BackupType
    let backupStartDate: String
    let backupFinishDate: String
    let position: Int
    let backupSize: Int64
}
