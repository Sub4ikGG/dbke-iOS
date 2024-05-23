//
//  SchedulerRepository.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

protocol SchedulerRepository {
    func schedule(backupFrequency: BackupFrequency) async throws
    func schedule(backupType: BackupType) async throws -> BackupFrequency?
}
