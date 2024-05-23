//
//  ConfigureScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 21.05.2024.
//

import SwiftUI

struct ConfigureScreen: View {
    @StateObject private var viewModel = ConfigureViewModel()
    @State private var showTruncateAlert = false
    
    var body: some View {
        List {
            Section {
                NavigationLink {
                    BackupsScreen()
                } label: {
                    HStack {
                        Text("Backups")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Section {
                NavigationLink {
                    FullBackupsSchedulerScreen()
                } label: {
                    HStack {
                        Image(.backupsFrequency)
                        Text("Full backups frequency")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
                
                NavigationLink {
                    DifferentialBackupsSchedulerScreen()
                } label: {
                    HStack {
                        Image(.differentialBackupsFrequency)
                        Text("Differential backups frequency")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
                
                NavigationLink {
                    TransactionLogsSchedulerScreen()
                } label: {
                    HStack {
                        Image(.transactionLogsFrequency)
                        Text("Transaction logs frequency")
                    }.frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Section {
                Button(action: {
                    showTruncateAlert = true
                }, label: {
                    HStack {
                        Text("Truncate database")
                        Spacer()
                        Image(systemName: "chevron.right").foregroundStyle(.chevronRight)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                })
            }
        }
        .alert(
            "Truncate database",
            isPresented: $showTruncateAlert,
            actions: {
                Button("Truncate", role: .destructive) {
                    viewModel.truncateDatabase()
                }
                Button("Cancel", role: .cancel) {}
            },
            message: {
                Text("All tables data will be deleted")
            }
        )
        .foregroundStyle(.appBlack)
        .listSectionSpacing(.compact)
        .navigationTitle("Configure")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ConfigureScreen()
}
