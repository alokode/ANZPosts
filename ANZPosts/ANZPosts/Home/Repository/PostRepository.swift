//
//  PostRepository.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

protocol ANZRepository {
    var networkService: NetworkServiceProtocol { get }
}

protocol PostRepositoryProtocol:ANZRepository {
    func fetchPosts() async throws -> [Post]
}

struct PostRepository: PostRepositoryProtocol {
    var networkService: NetworkServiceProtocol
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    func fetchPosts() async throws -> [Post] {
        try await networkService.fetch([Post].self, from: PostEndpoint.posts())
    }
}
