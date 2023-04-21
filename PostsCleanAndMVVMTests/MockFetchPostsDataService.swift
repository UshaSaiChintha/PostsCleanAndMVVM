//
//  MockFetchPostsDataService.swift
//  PostsCleanAndMVVMTests
//
//  Created by Usha Sai Chintha on 12/04/23.
//

import Foundation

class MockFetchPostsDataService: FetchPostsDataService {
    let mockData: [Post]?
    
    init(mockData: [Post]?) {
        self.mockData = mockData
    }
    
    func fetchPostsData(with completion: @escaping ([Post]?) -> Void) {
        completion(mockData)
    }
}
