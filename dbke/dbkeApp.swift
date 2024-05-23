//
//  dbkeApp.swift
//  dbke
//
//  Created by Kirill Efremov on 20.05.2024.
//

import SwiftUI

@main
struct dbkeApp: App {
    init() {
        Task {
            do {
                try await BackupRepositoryImpl().backups()
            } catch {
                print("Exception \(error)")
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
