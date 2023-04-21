//
//  MockPost.swift
//  PostsCleanAndMVVMTests
//
//  Created by Usha Sai Chintha on 12/04/23.
//

import Foundation

extension Post {
    static func with(id: Int = 1,
                     userId: Int = 1,
                     title: String = "sample title 1",
                     body: String = "sample body 1") -> Post {
        return Post(
            id: id,
            userId: userId,
            title: title,
            body: body
        )
    }
}
