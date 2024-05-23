//
//  SchedulerState.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

enum SchedulerState : MVIState {
    case idle(backupFrequency: BackupFrequency?)
    case loading
}
