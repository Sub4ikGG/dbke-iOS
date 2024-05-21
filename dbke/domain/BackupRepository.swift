//
//  BackupRepository.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

protocol BackupRepository {
    func backups() async throws -> [Backup]
    func restore(restoreDatabase: RestoreDatabase) async throws
}
