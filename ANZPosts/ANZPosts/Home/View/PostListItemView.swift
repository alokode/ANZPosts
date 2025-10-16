//
//  PostListItemView.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

import SwiftUI

struct PostListItemView: View {
    var post: Post
    var body: some View {
        VStack(alignment: .leading) {
            Text(post.title)
                .font(.headline)
                .lineLimit(2)
            Text(post.body.prefix(100) + (post.body.count > 100 ? "..." : ""))
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
        }
    }
}

#Preview {
    let post = Post.init(userId: 1, id: 1, title: "Test", body: "test")
    PostListItemView(post: post)
}
