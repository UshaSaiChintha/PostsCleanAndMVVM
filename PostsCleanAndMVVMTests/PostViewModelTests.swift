//
//  PostViewModelTests.swift
//  PostsCleanAndMVVMTests
//
//  Created by Usha Sai Chintha on 12/04/23.
//

import Foundation
import XCTest

class PostViewModelTests: XCTestCase {

    func testSuccessFetchData() {
        let expectedResult = [Post.with()]
        let getPostsUseCase = MockGetPostsUseCase(mockData: expectedResult)

        let viewModel = PostViewModel(getPostsUseCase: getPostsUseCase)

        viewModel.getPostsData()
        let expectation = self.expectation(description: "TestSuccessDataOfMovie")
        DispatchQueue.main.async {
            expectation.fulfill()
        }

        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertNotNil(viewModel.posts)
        XCTAssertEqual(viewModel.posts.first?.id, 1)
        XCTAssertEqual(viewModel.posts.first?.userId, 1)
        XCTAssertEqual(viewModel.posts.first?.title, "sample title 1")
        XCTAssertEqual(viewModel.posts.first?.body, "sample body 1")
    }

    func testEmptyData() {
        let expectedResult: [Post] = [Post]()
        let getPostsUseCase = MockGetPostsUseCase(mockData: expectedResult)

        let viewModel = PostViewModel(getPostsUseCase: getPostsUseCase)

        viewModel.getPostsData()

        let expectation = self.expectation(description: "TestEmptyDataOfPost")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(viewModel.posts.count, 0)
    }
    
    func testNilData() {
        let expectedResult: [Post]? = nil
        let getPostsUseCase = MockGetPostsUseCase(mockData: expectedResult)

        let viewModel = PostViewModel(getPostsUseCase: getPostsUseCase)

        viewModel.getPostsData()

        let expectation = self.expectation(description: "TestEmptyDataOfPost")
        DispatchQueue.main.async {
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
        XCTAssertEqual(viewModel.posts.count, 0)
    }

    func testConnectionMessageWhenNetAvailable() {
        let viewModel = PostViewModel()
        viewModel.isConnected = true

        XCTAssertTrue(viewModel.connectionDescription.isEmpty)
    }

    func testConnectionMessageWhenNetUnAvailable() {
        let viewModel = PostViewModel()
        viewModel.isConnected = false

        XCTAssertEqual(viewModel.connectionDescription, "It looks like you're not connected to the internet. Make sure WiFi is enabled and try again")
    }

    func testSessionErrorMessageWhenDataIsRetrieved() {
        let viewModel = PostViewModel()
        viewModel.sessionError = false

        XCTAssertTrue(viewModel.sessionErrorDescription.isEmpty)
    }

    func testSessionErrorMessageWhenDataNotRetrieved() {
        let viewModel = PostViewModel()
        viewModel.sessionError = true

        XCTAssertEqual(viewModel.sessionErrorDescription, "Unable to retrieve the required data at the moment. Try later")
    }
}
