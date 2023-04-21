//
//  MockGetPostsUseCase.swift
//  PostsCleanAndMVVMTests
//
//  Created by Usha Sai Chintha on 18/04/23.
//

import Foundation

class MockGetPostsUseCase: GetPostsUseCase {
    
    let mockData: [Post]?

    init(mockData: [Post]?) {
        self.mockData = mockData
    }
    
    override func getPostsData(with completion: @escaping ([Post]?) -> Void) {
        completion(mockData)
    }
    
}
