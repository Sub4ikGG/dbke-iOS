//
//  BackupsState.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

enum BackupsState : MVIState {
    case loading
    case idle(backups: [Backup])
}
