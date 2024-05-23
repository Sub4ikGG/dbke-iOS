//
//  SchedulerIntent.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

enum SchedulerIntent : MVIIntent {
    case schedule(backupType: BackupType, intervalInMinutes: Int)
    case getSchedule(backupType: BackupType)
}
