//
//  ConsoleIntent.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

enum ConsoleIntent : MVIIntent {
    case executeSql(sqlQuery: String)
}
