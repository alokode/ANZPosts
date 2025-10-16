//
//  MockPostRepository.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

import Foundation
@testable import ANZPosts
import XCTest
class MockPostRepository : PostRepositoryProtocol {
    var networkService:  ANZPosts.NetworkServiceProtocol
    func fetchPosts() async throws -> [Post] {
        try await networkService.fetch([Post].self, from: PostEndpoint.posts())
    }
    
    init?() {
        guard let url = Bundle(for: PostRepositoryTests.self).url(forResource: "mockPosts", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            XCTFail("Failed to load posts.json")
            return nil
        }
        networkService = MockNetworkService.init(dataToReturn: data, responseStatusCode: 200)
    }
}
