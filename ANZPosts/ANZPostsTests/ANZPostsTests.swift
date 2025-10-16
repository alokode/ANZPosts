//
//  ANZPostsTests.swift
//  ANZPostsTests
//
//  Created by Alok Sagar on 16/10/25.
//

import XCTest
@testable import ANZPosts

class PostRepositoryTests: XCTestCase {
    var repository: PostRepository!
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
        repository = PostRepository(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        repository = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    func testFetchPostsSuccess() async {
        guard let url = Bundle(for: PostRepositoryTests.self).url(forResource: "mockPosts", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            XCTFail("Failed to load posts.json")
            return
        }
        mockNetworkService.dataToReturn = data
        mockNetworkService.responseStatusCode = 200
        do {
            let posts = try await repository.fetchPosts()
            XCTAssertEqual(posts.count, 3, "Should decode 3 posts")
            XCTAssertEqual(posts[0].id, 1, "First post ID should be 1")
            XCTAssertEqual(posts[0].title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
