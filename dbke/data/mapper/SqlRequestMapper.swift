//
//  SqlRequestMapper.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct SqlRequestMapper {
    public static func map(sqlRequest: SqlRequest) -> SqlRequestEncodable {
        return SqlRequestEncodable(sqlQuery: sqlRequest.sqlQuery.replacingOccurrences(of: "\n", with: " "))
    }
}
