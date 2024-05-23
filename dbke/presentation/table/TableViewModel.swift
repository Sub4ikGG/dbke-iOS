//
//  ClientsViewModel.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

class TableViewModel <T> : ViewModel <TableState<T>, TableIntent, ShowAlertEffect> {
    private let databaseRepository: DatabaseRepository
    
    init(databaseRepository: DatabaseRepository = DatabaseRepositoryImpl()) {
        self.databaseRepository = databaseRepository
        super.init(initialState: .loading)
    }
    
    override func obtainIntent(intent: TableIntent) {
        updateState(state: .loading)
        
        Task {
            do {
                switch (intent) {
                case .getClientsTable:
                    try await getClientsTable()
                case .getOrdersTable:
                    try await getOrdersTable()
                }
            } catch let rException as RepositoryException {
                updateEffect(effect: .buildErrorAlert(
                    code: rException.code,
                    message: rException.message)
                )
            } catch {
                updateEffect(effect: .buildUndefinedError(message: error.localizedDescription))
            }
        }
    }
    
    private func getClientsTable() async throws {
        let clients = try await databaseRepository.clients() as! [T]
        updateState(state: .idle(data: clients))
    }
    
    private func getOrdersTable() async throws {
        let orders = try await databaseRepository.orders() as! [T]
        updateState(state: .idle(data: orders))
    }
}
