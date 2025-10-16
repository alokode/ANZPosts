//
//  APINet.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

protocol NetworkServiceProtocol {
    func fetch<T: Codable>(_ type: T.Type, from endpoint: APIEndpoint) async throws -> T
}
