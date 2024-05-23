//
//  SchedulerViewModel.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

class SchedulerViewModel: ViewModel <SchedulerState, SchedulerIntent, ShowAlertEffect> {
    private let schedulerRepository: SchedulerRepository
    
    init(schedulerRepository: SchedulerRepository = SchedulerRepositoryImpl()) {
        self.schedulerRepository = schedulerRepository
        super.init(initialState: .loading)
    }
    
    override func obtainIntent(intent: SchedulerIntent) {
        Task {
            do {
                switch (intent) {
                    case .getSchedule(let backupType):
                        try await getSchedule(backupType: backupType)
                    case .schedule(let backupType, let intervalInMinutes):
                        try await schedule(backupType: backupType, intervalInMinutes: intervalInMinutes)
                }
            } catch let rException as RepositoryException {
                updateEffect(effect: .buildErrorAlert(code: rException.code, message: rException.message))
            } catch {
                updateEffect(effect: .buildUndefinedError(message: error.localizedDescription))
            }
        }
    }
    
    private func getSchedule(backupType: BackupType) async throws {
        updateState(state: .loading)
        
        let backupFrequency = try await schedulerRepository.schedule(backupType: backupType)
        updateState(state: .idle(backupFrequency: backupFrequency))
    }
    
    private func schedule(backupType: BackupType, intervalInMinutes: Int) async throws {
        try await schedulerRepository.schedule(
            backupFrequency: BackupFrequency(backupType: backupType, intervalInMinutes: intervalInMinutes)
        )
        
        updateEffect(effect: .init(title: "Schedule set", message: "The scheduler has assigned a frequency for the current backup"))
    }
}
