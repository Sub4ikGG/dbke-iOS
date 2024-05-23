//
//  ClientsState.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

enum TableState <T> : MVIState {
    case loading
    case idle(data: [T])
}
