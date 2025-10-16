//
//  HomeViewModel.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

import Combine
import Foundation
enum PostFetchState {
    case loading
    case finsihed
}
class HomeViewModel: ObservableObject {
    private var posts: [Post] = []
    @Published var filteredPosts: [Post] = []
    @Published var error: ANZApiError?
    @Published var postFetchState: PostFetchState = .loading
    @Published var searchText: String = "" {
        didSet {
            applyFilter()
        }
    }
    private var repository: PostRepositoryProtocol
    init(repository: PostRepositoryProtocol = PostRepository()) {
        self.repository = repository
    }
    func fetchPost(isRefresh:Bool = false) async {
        if !isRefresh {
            await MainActor.run {
                postFetchState  = .loading
                error = nil
            }
        }
        do {
            // Adding a sleep wait to show the loader for sometime.
            try await Task.sleep(for: .seconds(3))
            let posts = try await repository.fetchPosts()
            await MainActor.run {
                self.posts = posts
                applyFilter()
                self.postFetchState  = .finsihed
                error = nil
            }
        } catch is CancellationError {
            // Ignore cancellation errors from pull-to-refresh
            await MainActor.run {
                self.postFetchState  = .finsihed
            }
        }  catch {
            await MainActor.run {
                self.postFetchState  = .finsihed
                self.error = (error as? ANZApiError) ?? ANZApiError.invalidData
            }
            
        }
    }
    
    func applyFilter() {
        if searchText.isEmpty {
            filteredPosts = posts
        } else {
            filteredPosts = posts.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
