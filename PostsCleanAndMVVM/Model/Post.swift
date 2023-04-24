//
//  Post.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import Foundation

struct Post: Decodable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

extension Post {
    struct PostDTO: Decodable {
        let id: Int
        let userId: Int
        let title: String
        let body: String
    }
    
    init(from postDTO: PostDTO) {
        id = postDTO.id
        userId = postDTO.userId
        title = postDTO.title
        body = postDTO.body
    }
}
