//
//  PostDetailsView.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//
import SwiftUI

struct PostDetailView: View {
    let post: Post
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(post.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Author ID: \(post.userId)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(post.body)
                    .font(.body)
                    .lineSpacing(4)
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Post Details")
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(post: Post(userId: 1, id: 1, title: "Sample Post", body: "This is a sample post body."))
            .preferredColorScheme(.light)
        PostDetailView(post: Post(userId: 1, id: 1, title: "Sample Post", body: "This is a sample post body."))
            .preferredColorScheme(.dark)
    }
}
