//
//  BackupsIntent.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

enum BackupsIntent : MVIIntent {
    case getBackups
    case restoreDatabase(backup: Backup)
}
