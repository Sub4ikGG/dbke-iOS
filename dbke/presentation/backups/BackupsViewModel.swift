//
//  BackupsViewModel.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

class BackupsViewModel : ViewModel <BackupsState, BackupsIntent, BackupsEffect> {
    private let backupRepository: BackupRepository
    
    init(backupRepository: BackupRepository = BackupRepositoryImpl()) {
        self.backupRepository = backupRepository
        super.init(initialState: .loading)
    }
    
    override func obtainIntent(intent: BackupsIntent) {
        updateState(state: .loading)
        
        Task {
            do {
                switch (intent) {
                    case .getBackups:
                        try await getBackups()
                    case .restoreDatabase(let backup):
                        try await restoreDatabase(backup: backup)
                }
            } catch let rException as RepositoryException {
                updateEffect(effect: .showErrorAlert(title: "Error with \(rException.code)", message: rException.message))
            } catch {
                updateEffect(effect: .showErrorAlert(title: "Undefined error", message: error.localizedDescription))
            }
        }
    }
    
    private func getBackups() async throws {
        let backups = Array(try await backupRepository.backups().reversed())
        updateState(state: .idle(backups: backups))
    }
    
    private func restoreDatabase(backup: Backup) async throws {
        let restoreDatabase = RestoreDatabase(position: backup.position)
        let response = try await backupRepository.restore(restoreDatabase: restoreDatabase)
        
        if (response.code != 200) {
            updateEffect(effect: .showErrorAlert(title: "Couldn't restore database", message: response.message))
            obtainIntent(intent: .getBackups)
            return
        }
        
        updateEffect(effect: .showSuccessRestoreAlert)
        obtainIntent(intent: .getBackups)
    }
}
