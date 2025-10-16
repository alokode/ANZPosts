//
//  PostListView.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//


import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
    
//                SearchBar(text: $viewModel.searchText)
//                    .padding(.horizontal)
//            
                ZStack {
                    if viewModel.postFetchState == .loading {
                        ProgressView("Loading...")
                            .progressViewStyle(.circular)
                    } else if let error = viewModel.error {
                        ErrorView(error: error) {
                            Task {
                                await viewModel.fetchPost(isRefresh: false)
                            }
                        }
                    } else {
                        List(viewModel.filteredPosts) { post in
                            NavigationLink(destination: PostDetailView(post: post)) {
                                    PostListItemView(post: post)
                                    .padding(.vertical, 4)
                            }
                        }
                        .refreshable {
                            await viewModel.fetchPost(isRefresh: true)
                        }
                        .searchable(text: $viewModel.searchText)
                    }
                }
            }
            .navigationTitle("ANZ Posts")
            .task {
                await viewModel.fetchPost()
            }
        }
    }
}
struct ErrorView: View {
    let error: ANZApiError
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Text("An error occurred")
                .font(.headline)
            Text(error.localizedDescription)
                .foregroundColor(.secondary)
            Button(action: retryAction) {
                Text("Retry")
                    .font(.callout)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct PostListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.light)
        HomeView()
            .preferredColorScheme(.dark)
    }
}
