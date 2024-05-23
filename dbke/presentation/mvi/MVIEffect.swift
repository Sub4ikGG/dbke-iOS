//
//  Effect.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

protocol MVIEffect {}

struct EmptyEffect : MVIEffect {}

struct ShowAlertEffect : MVIEffect {
    let title: String
    let message: String
    
    public static func buildErrorAlert(code: Int, message: String) -> ShowAlertEffect {
        let alertMessage = message.isEmpty ? "Something went wrong!!1" : message
        return ShowAlertEffect(title: "Error with \(code) code", message: alertMessage)
    }
    
    public static func buildUndefinedError(message: String? = nil) -> ShowAlertEffect {
        return ShowAlertEffect(title: "Undefined error", message: message ?? "Something went wrong!!1")
    }
}
