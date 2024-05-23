//
//  SchedulerLocalDataSource.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

enum SchedulerFrequencyKeys {
    case fullBackup(key: String = "fullBackup")
    case differentialBackup(key: String = "differentialBackup")
    case transactionLogBackup(key: String = "transactionLogBackup")
    
    public func key() -> String {
        switch (self) {
        case .fullBackup(let key):
            return key
        case .differentialBackup(let key):
            return key
        case .transactionLogBackup(let key):
            return key
        }
    }
    
    public static func byBackupType(backupType: BackupType) -> SchedulerFrequencyKeys {
        return switch (backupType) {
        case .full:
            SchedulerFrequencyKeys.fullBackup()
        case .differential:
            SchedulerFrequencyKeys.differentialBackup()
        case .transactionLog:
            SchedulerFrequencyKeys.transactionLogBackup()
        }
    }
}

struct SchedulerLocalDataSource : SchedulerDataSource {
    func schedule(backupFrequency: BackupFrequency) async {
        let frequencyKey = SchedulerFrequencyKeys
            .byBackupType(backupType: backupFrequency.backupType)
        
        UserDefaults.standard.setValue(backupFrequency.intervalInMinutes, forKey: frequencyKey.key())
    }
    
    func schedule(backupType: BackupType) async -> BackupFrequency? {
        let frequencyKey = SchedulerFrequencyKeys
            .byBackupType(backupType: backupType)
        
        if (UserDefaults.standard.object(forKey: frequencyKey.key()) == nil) {
            return nil
        }
        
        let intervalInMinutes = UserDefaults.standard.integer(forKey: frequencyKey.key())
        return BackupFrequency(backupType: backupType, intervalInMinutes: intervalInMinutes)
    }
}
