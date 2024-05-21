//
//  BackupsFrequencyScreen.swift
//  dbke
//
//  Created by Kirill Efremov on 21.05.2024.
//

import SwiftUI

struct FullBackupsFrequencyScreen: View {
    @State private var everyHourEnabled: Bool = false
    @State private var everySixHoursEnabled: Bool = true
    @State private var everyTwentyHoursEnabled: Bool = false
    @State private var everyDayEnabled: Bool = false
    
    @State private var intervalInMinutes: String = ""
    
    var body: some View {
        List {
            Section {
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
            
            HStack {
                TextField(text: $intervalInMinutes, label: {
                    Text("Interval in minutes")
                })
                .keyboardType(.numberPad)
                
                Button(action: {}, label: {
                    Text("Save")
                })
            }
        }
        .listSectionSpacing(.compact)
        .onChange(of: everyHourEnabled, { oldValue, newValue in
            everySixHoursEnabled = false
            everyTwentyHoursEnabled = false
            everyDayEnabled = false
        })
        .navigationTitle("Backups frequency")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FullBackupsFrequencyScreen()
}
