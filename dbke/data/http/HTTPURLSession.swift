//
//  HTTPURLSession.swift
//  dbke
//
//  Created by Kirill Efremov on 22.05.2024.
//

import Foundation

struct HTTPURLSession {
    private static let maxMessageLength = 64
    
    public static func response <D> (
        httpMethod: String = "GET",
        path: String,
        parameters: [String: String] = [:]
    ) async throws -> HTTPResponse<D> {
        let request = HTTPURLSession.buildRequest(httpMethod: httpMethod, path: path, body: "", parameters: parameters)
        let (data, response) = try await URLSession.shared.data(for: request)
        let httpUrlResponse = response as? HTTPURLResponse
        
        let httpMessage = httpUrlResponse?.statusCode != 200 ? ellipsisMessage(String(data: data, encoding: .utf8) ?? "") : "-1"
        return HTTPResponse(
            code: httpUrlResponse?.statusCode ?? -1,
            message: httpMessage,
            data: try? JSONDecoder().decode(D.self, from: data)
        )
    }
    
    public static func response <D, B: Encodable> (
        httpMethod: String = "GET",
        path: String,
        body: B? = nil,
        parameters: [String: String] = [:]
    ) async throws -> HTTPResponse<D> {
        let request = HTTPURLSession.buildRequest(httpMethod: httpMethod, path: path, body: body, parameters: parameters)
        let (data, response) = try await URLSession.shared.data(for: request)
        let httpUrlResponse = response as? HTTPURLResponse
        
        let httpMessage = httpUrlResponse?.statusCode != 200 ? ellipsisMessage(String(data: data, encoding: .utf8) ?? "") : "-1"
        return HTTPResponse(
            code: httpUrlResponse?.statusCode ?? -1,
            message: httpMessage,
            data: try? JSONDecoder().decode(D.self, from: data)
        )
    }
    
    private static func buildRequest <B: Encodable> (
        httpMethod: String = "GET",
        path: String,
        body: B?,
        parameters: [String: String]
    ) -> URLRequest {
        let url = URLSessionUtils.buildURLWithQueryParameters(path: path, parameters: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if (httpMethod != "GET") {
            request.httpBody = try? JSONEncoder().encode(body)
        }
        
        return request
    }
    
    private static func ellipsisMessage(_ message: String) -> String {
        if (message.count > HTTPURLSession.maxMessageLength) {
            return message.prefix(HTTPURLSession.maxMessageLength) + "..."
        }
        
        return message
    }
}
