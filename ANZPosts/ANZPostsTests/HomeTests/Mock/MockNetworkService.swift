//
//  MockNetworkService.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//
@testable import ANZPosts
import Foundation

class MockNetworkService: NetworkServiceProtocol {
    var dataToReturn: Data?
    var errorToThrow: Error?
    var responseStatusCode: Int = 200
    
    init(dataToReturn: Data? = nil, errorToThrow: Error? = nil, responseStatusCode: Int = 200) {
        self.dataToReturn = dataToReturn
        self.errorToThrow = errorToThrow
        self.responseStatusCode = responseStatusCode
    }
    func fetch<T: Codable>(_ type: T.Type, from endpoint: any APIEndpoint) async throws -> T {
        if let error = errorToThrow {
            throw error
        }
        guard let data = dataToReturn, let url = URL.init(string: endpoint.url) else {
            throw ANZApiError.invalidData
        }
        let response = HTTPURLResponse(url: url, statusCode: responseStatusCode, httpVersion: nil, headerFields: nil)!
        if response.statusCode < 200 || response.statusCode >= 300 {
            throw ANZApiError.invalidResponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
}
