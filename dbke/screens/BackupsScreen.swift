//
//  BackupsScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 21.05.2024.
//

import SwiftUI

struct BackupsScreen: View {
    @StateObject private var viewModel: BackupsViewModel = BackupsViewModel()
    
    @State private var showSuccessRestoreAlert: Bool = false
    
    @State private var showRestoreAlert: Bool = false
    @State private var restoreBackup: Backup? = nil
    
    @State private var showErrorAlert: Bool = false
    @State private var errorAlertTitle: String = ""
    @State private var errorAlertMessage: String = ""
    
    var body: some View {
        List {
            switch (viewModel.state) {
                case .loading: ProgressView().id(UUID())
                case .idle(let backups):
                    Section {
                        ForEach(backups) { backup in
                            Button(action: {
                                restoreBackup = backup
                                showRestoreAlert = true
                            }) {
                                HStack {
                                    Text("\(backup.backupName) #\(backup.position)\n\(backup.backupSize) size")
                                        .foregroundStyle(.appBlack)
                                    
                                    Spacer()
                                    Image(systemName: "chevron.right").foregroundStyle(.chevronRight)
                                }
                            }
                        }
                    }
                    .alert(
                        "Restore \(restoreBackup?.backupName ?? "unknown backup")",
                        isPresented: $showRestoreAlert, 
                        actions: {
                            Button(role: .cancel, action: {}, label: {
                                Text("Cancel")
                            })
                            
                            Button(action: {
                                if let backup = restoreBackup {
                                    viewModel.obtainIntent(intent: .restoreDatabase(backup: backup))
                                }
                            }, label: {
                                Text("Restore")
                            })
                        },
                        message: {
                            Text("The data will be recovered from this full \(restoreBackup?.backupName ?? "unknown backup")")
                        }
                    )
            }
        }
        .alert(errorAlertTitle, isPresented: $showErrorAlert, actions: {}, message: { Text(errorAlertMessage) })
        .alert("Restore executed", isPresented: $showSuccessRestoreAlert, actions: {}, message: { Text("The restore was completed successfully") })
        .onReceive(viewModel.$effect, perform: { effect in
            switch (effect) {
                case .showSuccessRestoreAlert:
                    showSuccessRestoreAlert = true
                
                case .showErrorAlert(let title, let message):
                    showErrorAlert(title: title, message: message)
                
                default: break
            }
        })
        .navigationTitle("Backups")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.obtainIntent(intent: .getBackups)
        }
    }
    
    private func showErrorAlert(title: String, message: String) {
        errorAlertTitle = title
        errorAlertMessage = message
        
        showErrorAlert = true
    }
}

#Preview {
    BackupsScreen()
}
