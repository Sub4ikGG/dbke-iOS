//
//  DatabaseRepository.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

protocol DatabaseRepository {
    func executeSql(sqlRequest: SqlRequest) async throws -> HTTPResponse<String>
    func clients() async throws -> [Client]
    func orders() async throws -> [Order]
}
