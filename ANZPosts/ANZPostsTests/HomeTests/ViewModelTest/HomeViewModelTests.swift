//
//  HomeViewModelTests.swift
//  ANZPostsTests
//
//  Created by Alok Sagar on 16/10/25.
//

import XCTest
@testable import ANZPosts

final class HomeViewModelTests: XCTestCase {
    
    private var posts: [Post] = []
    var filteredPosts: [Post] = []
    var error: ANZApiError?
    var viewModel : HomeViewModel!
    private var repository: PostRepositoryProtocol!
    
    override func setUpWithError() throws {
        repository = MockPostRepository()
        viewModel = HomeViewModel(repository: repository)
    }

    override func tearDownWithError() throws {
       
    }

    func testFetchPosts() async {
        await viewModel.fetchPost()
        let posts = viewModel.filteredPosts
        XCTAssertEqual(posts.count, 3)
        XCTAssertEqual(posts[0].id, 1)
        XCTAssertEqual(posts[0].title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
    }
    
    func testSearchPostSuccess() async {
        await viewModel.fetchPost()
        viewModel.searchText =  "sunt aut facere"
        XCTAssertTrue(viewModel.filteredPosts.count == 1)
        XCTAssertEqual(viewModel.filteredPosts[0].title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
        XCTAssertEqual(viewModel.filteredPosts[0].id, 1)
    }
    
    func testSearchPost_when_no_result() async {
        await viewModel.fetchPost()
        viewModel.searchText =  "random text to search"
        XCTAssertTrue(viewModel.filteredPosts.isEmpty)
    }

}
