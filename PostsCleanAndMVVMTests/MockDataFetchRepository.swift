//
//  MockDataFetchRepository.swift
//  PostsCleanAndMVVMTests
//
//  Created by Usha Sai Chintha on 18/04/23.
//

import Foundation

class MockDataFetchRepository: PostsDataFetchRepository {
    
    let mockData: [Post]?

    init(mockData: [Post]?) {
        self.mockData = mockData
        super.init(endPoint: postsEndPoint, session: URLSession(configuration: URLSessionConfiguration.ephemeral))
    }
    
    override func fetchPostsData(with completion: @escaping ([Post]?) -> Void) {
        completion(mockData)
    }
    
}
