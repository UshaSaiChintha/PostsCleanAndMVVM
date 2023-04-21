//
//  GetPostsUseCaseTests.swift
//  PostsCleanAndMVVMTests
//
//  Created by Usha Sai Chintha on 18/04/23.
//

import Foundation
import XCTest

class GetPostsUseCaseTests: XCTestCase {
    
    func testSuccessFetchData() {
        let expectedResult = [Post.with()]
        let postsDataFetchRepository = MockDataFetchRepository(mockData: expectedResult)

        let postsUseCase = GetPostsUseCase(service: postsDataFetchRepository)
        
        postsUseCase.getPostsData(with: { data in
            XCTAssertNotNil(data)
            let postContent = data?.first
            XCTAssertEqual(postContent?.id, Post.with().id)
            XCTAssertEqual(postContent?.userId, Post.with().userId)
            XCTAssertEqual(postContent?.title, Post.with().title)
            XCTAssertEqual(postContent?.body, Post.with().body)
        })
    }
    
    func testEmptyData() {
        let expectedResult: [Post] = [Post]()
        let postsDataFetchRepository = MockDataFetchRepository(mockData: expectedResult)

        let postsUseCase = GetPostsUseCase(service: postsDataFetchRepository)
        
        postsUseCase.getPostsData(with: { data in
            XCTAssertEqual(data?.count, 0)
        })
    }
    
    func testNilData() {
        let expectedResult: [Post]? = nil
        let postsDataFetchRepository = MockDataFetchRepository(mockData: expectedResult)

        let postsUseCase = GetPostsUseCase(service: postsDataFetchRepository)
        
        postsUseCase.getPostsData(with: { data in
            XCTAssertNil(data)
        })
    }
}
