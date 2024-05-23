//
//  SchedulerRepository.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

protocol SchedulerRepository {
    func schedule(schedule: FrequencySchedule) async throws -> HTTPResponse<String>
    func schedule(backupType: BackupType) async throws -> HTTPResponse<Int>
}
