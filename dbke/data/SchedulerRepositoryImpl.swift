//
//  SchedulerRepositoryImpl.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

class SchedulerRepositoryImpl : SchedulerRepository {
    func schedule(schedule: FrequencySchedule) async throws -> HTTPResponse<String> {
        let backupSubPath = switch (schedule.backupType) {
            case .full:
                "full-backup"
            case .differential:
                "differential-backup"
            case .transactionLog:
                "transaction-log-backup"
        }
        
        return try await HTTPURLSession.response(
            path: "\(Constants.databaseName)/\(backupSubPath)",
            parameters: ["intervalInMinutes": String(schedule.intervalInMinutes)]
        )
    }
    
    func schedule(backupType: BackupType) async throws -> HTTPResponse<Int> {
        let _ = switch (backupType) {
            case .full:
                "full-backup"
            case .differential:
                "differential-backup"
            case .transactionLog:
                "transaction-log-backup"
        }
        
//        return try await HTTPURLSession.response(
//            path: "\(Constants.databaseName)/\(backupSubPath)/interval"
//        )
        return HTTPResponse(code: 200, message: "", data: 15)
    }
}
