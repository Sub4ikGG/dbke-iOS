//
//  BackupMapper.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct BackupMapper {
    public static func map(backupDecodable: BackupDecodable) throws -> Backup {
        guard let backupType = BackupType.getBackupType(type: backupDecodable.backupType) else {
            throw UnknownBackupTypeException()
        }
        
        return Backup(
            backupName: backupDecodable.backupName,
            backupType: backupType,
            backupStartDate: backupDecodable.backupStartDate,
            backupFinishDate: backupDecodable.backupFinishDate,
            position: backupDecodable.position,
            backupSize: backupDecodable.backupSize
        )
    }
     
    struct UnknownBackupTypeException : Error {}
}
