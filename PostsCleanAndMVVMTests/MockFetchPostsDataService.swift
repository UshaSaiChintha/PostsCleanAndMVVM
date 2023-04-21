//
//  MockFetchPostsDataProtocol.swift
//  PostsCleanAndMVVMTests
//
//  Created by Usha Sai Chintha on 12/04/23.
//

import Foundation

class MockFetchPostsDataProtocol: FetchPostsDataProtocol {
    let mockData: [Post]?
    
    init(mockData: [Post]?) {
        self.mockData = mockData
    }
    
    func fetchPostsData(with completion: @escaping ([Post]?) -> Void) {
        completion(mockData)
    }
}
