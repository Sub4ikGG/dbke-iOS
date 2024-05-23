//
//  URLSessionUtils.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct URLSessionUtils {
    private static func buildUrl(host: String = Constants.host, path: String) -> URL {
        return URL(string: "\(host)/\(path)")!
    }
    
    public static func buildURLWithQueryParameters(path: String, parameters: [String: String]) -> URL {
        var urlComponents = URLComponents(string: URLSessionUtils.buildUrl(path: path).absoluteString)
        urlComponents?.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return urlComponents!.url!
    }
}
