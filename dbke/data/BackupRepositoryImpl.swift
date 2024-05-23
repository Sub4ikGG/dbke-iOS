//
//  BackupRepositoryImpl.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

class BackupRepositoryImpl : BackupRepository {
    func backups() async throws -> [Backup] {
        let httpResponse: HTTPResponse<[BackupDecodable]> = try await HTTPURLSession.response(
            path: "\(Constants.databaseName)/backup"
        )
        
        guard let backups = httpResponse.data else {
            throw RepositoryException(code: httpResponse.code, message: httpResponse.message)
        }
        
        return try backups.map({ try BackupMapper.map(backupDecodable: $0) })
    }
    
    func restore(restoreDatabase: RestoreDatabase) async throws -> HTTPResponse<String> {
        return try await HTTPURLSession.response(
            httpMethod: "PATCH",
            path: "\(Constants.databaseName)/restore",
            parameters: ["position": "\(restoreDatabase.position)"]
        )
    }
}
