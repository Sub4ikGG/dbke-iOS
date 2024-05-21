//
//  File.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct RestoreDatabaseMapper {
    public static func map(restoreDatabase: RestoreDatabase) -> RestoreDatabaseEncodable {
        return RestoreDatabaseEncodable(
            databaseName: restoreDatabase.databaseName,
            position: restoreDatabase.position
        )
    }
}
