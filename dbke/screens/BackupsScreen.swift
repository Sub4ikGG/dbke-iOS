//
//  BackupsScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 21.05.2024.
//

import SwiftUI

struct BackupsScreen: View {
    let backups: [Backup] = []
    
    var body: some View {
        List {
            Section {
                ForEach(backups) { backup in
                    Button(action: {
                        
                    }) {
                        Text("Backup with \(backup.id) position from \(backup.id)")
                    }
                }
            }
        }
        .navigationTitle("Backups")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BackupsScreen()
}
