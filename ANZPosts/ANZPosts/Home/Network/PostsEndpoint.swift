//
//  PostsEndpoint.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

import Foundation

struct PostEndpoint: APIEndpoint {
    let baseURL: String
    let path: String
    let method: HTTPMethod
    let headers: [String: String]?
    let parameters: [String: Any]?
    init(path: String, method: HTTPMethod = .get, headers: [String: String]? = nil, parameters: [String: Any]? = nil) {
        self.baseURL = ANZConstants.API.baseURLString
        self.path = path
        self.method = method
        self.headers = headers
        self.parameters = parameters
    }
    static func posts() -> PostEndpoint {
        PostEndpoint(path: ANZConstants.API.Endpoints.posts)
    }
}

