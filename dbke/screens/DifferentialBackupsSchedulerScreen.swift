//
//  DifferentialBackupsFrequencyScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import SwiftUI

struct DifferentialBackupsSchedulerScreen: View {
    @StateObject private var viewModel = SchedulerViewModel()
    @State private var intervalInMinutes: String = ""
    
    @State private var showScheduleAlert: Bool = false
    @State private var scheduleAlert: ShowAlertEffect? = nil
    
    var body: some View {
        List {
            switch (viewModel.state) {
            case .loading: ProgressView().id(UUID())
            case .idle(let backupFrequency):
                HStack {
                    TextField(text: $intervalInMinutes, label: {
                        Text("Interval in minutes")
                    })
                    .keyboardType(.numberPad)
                    
                    Button(action: {
                        viewModel.obtainIntent(
                            intent: .schedule(
                                backupType: .differential,
                                intervalInMinutes: Int(intervalInMinutes) ?? -1
                            )
                        )
                    }, label: {
                        Text("Save")
                    })
                }
                .onAppear {
                    if let interval = backupFrequency?.intervalInMinutes {
                        intervalInMinutes = String(interval)
                    }
                }
            }
        }
        .alert(
            scheduleAlert?.title ?? "Unknown title",
            isPresented: $showScheduleAlert,
            actions: {},
            message: { Text(scheduleAlert?.message ?? "Unknown message") }
        )
        .onReceive(viewModel.$effect, perform: { effect in
            if let scheduleAlert = effect {
                showSchedulerAlert(alert: scheduleAlert)
            }
        })
        .onAppear(perform: {
            viewModel.obtainIntent(intent: .getSchedule(backupType: .differential))
        })
        .listSectionSpacing(.compact)
        .navigationTitle("Diff. backups frequency")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func showSchedulerAlert(alert: ShowAlertEffect) {
        scheduleAlert = alert
        showScheduleAlert = true
    }
}

#Preview {
    DifferentialBackupsSchedulerScreen()
}
