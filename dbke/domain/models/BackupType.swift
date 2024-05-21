//
//  Frequency.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

enum BackupType {
    case full
    case differential
    case transactionLog
    
    public static func getBackupType(type: String) -> BackupType? {
        return switch (type) {
            case "Full": BackupType.full
            case "Differential": BackupType.differential
            case "TransactionLog": BackupType.transactionLog
            default: nil
        }
    }
}
