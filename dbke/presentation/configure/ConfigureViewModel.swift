//
//  ConfigureViewModel.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

class ConfigureViewModel : ObservableObject {
    let databaseRepository: DatabaseRepository
    
    init(databaseRepository: DatabaseRepository = DatabaseRepositoryImpl()) {
        self.databaseRepository = databaseRepository
    }
    
    func truncateDatabase() {
        Task {
            await databaseRepository.truncateDatabase()
        }
    }
}
