//
//  SchedulerRepositoryImpl.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

class SchedulerRepositoryImpl : SchedulerRepository {
    private let schedulerDataSource: SchedulerDataSource
    
    init(schedulerDataSource: SchedulerDataSource = SchedulerLocalDataSource()) {
        self.schedulerDataSource = schedulerDataSource
    }
    
    func schedule(backupFrequency: BackupFrequency) async throws {
        let backupSubPath = switch (backupFrequency.backupType) {
            case .full:
                "full-backup"
            case .differential:
                "differential-backup"
            case .transactionLog:
                "transaction-log-backup"
        }
        
        let httpResponse: HTTPResponse<String> = try await HTTPURLSession.response(
            httpMethod: "POST",
            path: "\(Constants.databaseName)/\(backupSubPath)/schedule",
            parameters: ["intervalInMinutes": String(backupFrequency.intervalInMinutes)]
        )
        
        if (httpResponse.code != 200) {
            throw RepositoryException(code: httpResponse.code, message: httpResponse.message)
        }
        
        await schedulerDataSource.schedule(backupFrequency: backupFrequency)
    }
    
    func schedule(backupType: BackupType) async throws -> BackupFrequency? {
//        let _ = switch (backupType) {
//            case .full:
//                "full-backup"
//            case .differential:
//                "differential-backup"
//            case .transactionLog:
//                "transaction-log-backup"
//        }
//        
//        return try await HTTPURLSession.response(
//            path: "\(Constants.databaseName)/\(backupSubPath)/interval"
//        )
        return await schedulerDataSource.schedule(backupType: backupType)
    }
}
