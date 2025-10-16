//
//  APIEndPoints.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

import Foundation

protocol APIEndpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
}

extension APIEndpoint {
    var url: String {
        baseURL + path
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

//enum APIError: Error {
//    case invalidResponse
//    case invalidData
//}
