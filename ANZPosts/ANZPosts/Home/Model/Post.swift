//
//  Post.swift
//  ANZPosts
//
//  Created by Alok Sagar on 16/10/25.
//

struct Post: Codable,Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
