//
//  ConsoleViewModel.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

class ConsoleViewModel : ViewModel <ConsoleState, ConsoleIntent, ShowAlertEffect> {
    private let databaseRepository: DatabaseRepository
    private let consoleQueue = DispatchQueue.global(qos: .userInitiated)
    
    init(databaseRepository: DatabaseRepository = DatabaseRepositoryImpl()) {
        self.databaseRepository = databaseRepository
        super.init(initialState: ConsoleState.idle)
    }
    
    override func obtainIntent(intent: ConsoleIntent) {
        updateState(state: .loading)
        
        consoleQueue.async {
            Task {
                switch (intent) {
                case .executeSql(let sqlQuery):
                    await self.executeSql(sqlQuery: sqlQuery)
                }
            }
        }
    }
    
    private func executeSql(sqlQuery: String) async {
        do {
            let response = try await databaseRepository.executeSql(sqlRequest: SqlRequest(sqlQuery: sqlQuery))
            
            if (response.code != 200) {
                updateEffect(effect: ShowAlertEffect.buildErrorAlert(code: response.code, message: response.message))
                return
            }
            
            updateEffect(effect: ShowAlertEffect(title: "SQL query executed", message: "The request was completed successfully"))
        } catch let rException as RepositoryException {
            updateEffect(effect: ShowAlertEffect.buildErrorAlert(code: rException.code, message: rException.message))
        } catch {
            updateEffect(effect: ShowAlertEffect.buildUndefinedError(message: error.localizedDescription))
        }
        
        updateState(state: .idle)
    }
}
