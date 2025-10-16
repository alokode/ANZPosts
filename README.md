# ANZPosts
It's a sample SwiftUI app with Networklayer. The basic features are  list posts, search by title, view details.

# Technologies and FrameWorks used 
-> Swift & SwiftUI: For building the app and its UI.
-> Combine
-> Async/Await
-> URLSession: Fetches data from the API.
-> XCTest: Tests the app’s core logic.

# Architectural approach
-> Followed MVVM architecture
1. Model Layer:
    * Post.swift: A Codable  struct model representing a post
    * ANZApiError.swift: enum for representing different errors
2. Networking Layer:

    * NetworkServiceProtocol : A protocol with basic network fetch method
    * NetworkService.swift: Implements NetworkServiceProtocol.
    * APIEndpoint : A protocol for the API endpoints with API related details like base url, headers ,etc. For each API calls we can create end points with this details
    * PostEndpoint.swift: Conforms to APIEndpoint protocol, defining endpoints for /posts to represents get post API call
    * Uses URLSession with async/await for network calls and throws ANZApiError for error cases.
4. Repository Layer:
    * PostRepository.swift: Implements PostRepositoryProtocol with fetchPosts(). This protocol is used for dependency injection in UnitTesting.
    * Acts as an intermediary between NetworkService and the ViewModel, abstracting data source details.
5. ViewModel Layer:
    * PostListViewModel.swift: Manages app posts lists, filter post list and post fetching states.
    * Uses Combine for reactive search filtering and async/await for fetching posts.
6. View Layer:
    * PostListView.swift: Displays a searchable list of posts with pull-to-refresh, error handling
    * PostDetailView.swift: Shows details for a selected post.
7. Testing:
    * Unit tests for NetworkService, PostRepository, and PostListViewModel using XCTest.

# Possible future improvements
 * -> Can use caching mechanism to avoid fetching api everytime
 * -> Can use pagination to avoid loading a huge bulk of data at initial time.
