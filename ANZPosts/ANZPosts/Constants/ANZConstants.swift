//
//  APIConstants.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

struct ANZConstants {
    struct API{
        static let baseURLString = "https://jsonplaceholder.typicode.com"
        struct Endpoints {
            static let posts: String = "/posts"
//            static func post(id: Int) -> String {
//                "/posts/\(id)"
//            }
        }
    }
}

/*
 
 import Foundation

 struct PostEndpoint: APIEndpoint {
     let baseURL: URL
     let path: String
     let method: HTTPMethod
     let headers: [String: String]?
     let parameters: [String: Any]?
     
     init(path: String, method: HTTPMethod = .get, headers: [String: String]? = nil, parameters: [String: Any]? = nil) {
         self.baseURL = URL(string: "https://jsonplaceholder.typicode.com")!
         self.path = path
         self.method = method
         self.headers = headers
         self.parameters = parameters
     }
     
     static func posts() -> PostEndpoint {
         PostEndpoint(path: "/posts")
     }
     
     static func post(id: Int) -> PostEndpoint {
         PostEndpoint(path: "/posts/\(id)")
     }
 }

 protocol PostRepositoryProtocol {
     func fetchPosts() async throws -> [Post]
     func fetchPost(id: Int) async throws -> Post
 }

 struct PostRepository: PostRepositoryProtocol {
     private let networkService: NetworkServiceProtocol
     
     init(networkService: NetworkServiceProtocol = NetworkService()) {
         self.networkService = networkService
     }
     
     func fetchPosts() async throws -> [Post] {
         try await networkService.fetch([Post].self, from: PostEndpoint.posts())
     }
     
     func fetchPost(id: Int) async throws -> Post {
         try await networkService.fetch(Post.self, from: PostEndpoint.post(id: id))
     }
 }
 
 */
