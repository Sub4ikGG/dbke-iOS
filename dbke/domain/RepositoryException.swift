//
//  RepositoryException.swift
//  dbke
//
//  Created by Kirill Efremov on 23.05.2024.
//

import Foundation

struct RepositoryException : Error {
    let code: Int
    let message: String
}
