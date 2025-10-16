//
//  APIError.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

enum ANZApiError: Error, Equatable{
    case invalidURL
    case invalidResponse
    case invalidData
    case serverError(statusCode: Int)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL provided."
        case .invalidResponse:
            return "Invalid response from server."
        case .serverError(let statusCode):
            return "Server error with status code: \(statusCode)"
        case .invalidData:
            return "Invalid data."
        }
    }
}
