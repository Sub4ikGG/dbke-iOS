//
//  DifferentialBackupsFrequencyScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import SwiftUI

struct DifferentialBackupsFrequencyScreen: View {
    @State private var everyHourEnabled: Bool = false
    @State private var everySixHoursEnabled: Bool = true
    @State private var everyTwentyHoursEnabled: Bool = false
    @State private var everyDayEnabled: Bool = false
    
    var body: some View {
        List {
            Toggle(isOn: $everyHourEnabled, label: {
                Text("Every hour")
            })
            
            Toggle(isOn: $everySixHoursEnabled, label: {
                Text("Every 6-hours")
            })
            
            Toggle(isOn: $everyTwentyHoursEnabled, label: {
                Text("Every 12-hours")
            })
            
            Toggle(isOn: $everyDayEnabled, label: {
                Text("Every day")
            })
        }
        .onChange(of: everyHourEnabled, { oldValue, newValue in
            everySixHoursEnabled = false
            everyTwentyHoursEnabled = false
            everyDayEnabled = false
        })
        .navigationTitle("Diff. backups frequency")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DifferentialBackupsFrequencyScreen()
}