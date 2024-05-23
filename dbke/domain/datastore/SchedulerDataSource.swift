//
//  SchedulerDataSource.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

protocol SchedulerDataSource {
    func schedule(backupType: BackupType) async -> BackupFrequency?
    func schedule(backupFrequency: BackupFrequency) async
}
