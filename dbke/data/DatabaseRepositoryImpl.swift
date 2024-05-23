//
//  DatabaseRepositoryImpl.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

class DatabaseRepositoryImpl : DatabaseRepository {
    func executeSql(sqlRequest: SqlRequest) async throws -> HTTPResponse<String> {
        return try await HTTPURLSession.response(
            httpMethod: "POST",
            path: "execute-sql",
            body: SqlRequestMapper.map(sqlRequest: sqlRequest)
        )
    }
    
    func clients() async throws -> [Client] {
        let httpResponse: HTTPResponse<[ClientDecodable]> = try await HTTPURLSession.response(
            path: "\(Constants.databaseName)/\(Constants.clientsTableName)"
        )
        
        guard let clients = httpResponse.data else {
            throw RepositoryException(code: httpResponse.code, message: httpResponse.message)
        }
        
        return clients.map { TableMapper.map(clientDecodable: $0) }
    }
    
    func orders() async throws -> [Order] {
        let httpResponse: HTTPResponse<[OrderDecodable]> = try await HTTPURLSession.response(
            path: "\(Constants.databaseName)/\(Constants.ordersTableName)"
        )
        
        guard let orders = httpResponse.data else {
            throw RepositoryException(code: httpResponse.code, message: httpResponse.message)
        }
        
        return orders.map { TableMapper.map(orderDecodable: $0) }
    }
    
    func truncateDatabase() async {
        let truncateQuery = "DELETE FROM \(Constants.ordersTableName); DELETE FROM \(Constants.clientsTableName);"
        let _ = try? await executeSql(sqlRequest: SqlRequest(sqlQuery: truncateQuery))
    }
}
