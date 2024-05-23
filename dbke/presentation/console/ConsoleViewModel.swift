//
//  ConsoleViewModel.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

class ConsoleViewModel : ViewModel <ConsoleState, ConsoleIntent, ShowAlertEffect> {
    private let databaseRepository: DatabaseRepository
    
    init(databaseRepository: DatabaseRepository = DatabaseRepositoryImpl()) {
        self.databaseRepository = databaseRepository
        super.init(initialState: ConsoleState.idle)
    }
    
    override func obtainIntent(intent: ConsoleIntent) {
        updateState(state: .loading)
        
        Task {
            switch (intent) {
            case .executeSql(let sqlQuery):
                await self.executeSql(sqlQuery: sqlQuery)
            }
        }
    }
    
    private func executeSql(sqlQuery: String) async {
        do {
            let response = try await databaseRepository.executeSql(
                sqlRequest: SqlRequest(
                    sqlQuery: sqlQuery
                        .replacingOccurrences(of: "`", with: "'")
                        .replacingOccurrences(of: "’", with: "'")
                        .replacingOccurrences(of: "‘", with: "'")
                        .replacingOccurrences(of: "\"", with: "'")
                )
            )
            
            if (response.code != 200) {
                updateEffect(effect: ShowAlertEffect.buildErrorAlert(code: response.code, message: response.message))
                updateState(state: .idle)
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
