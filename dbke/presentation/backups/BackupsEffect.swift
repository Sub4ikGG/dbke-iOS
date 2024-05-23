//
//  BackupsEffect.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

enum BackupsEffect : MVIEffect {
    case showSuccessRestoreAlert
    case showErrorAlert(title: String, message: String)
}
