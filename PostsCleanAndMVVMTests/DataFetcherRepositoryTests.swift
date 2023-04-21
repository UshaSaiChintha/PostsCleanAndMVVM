//
//  DataFetcherTests.swift
//  DataFetcherTests
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import XCTest

final class DataFetcherTests: XCTestCase {

    var sut: DataFetcher!
    var mockSession: MockURLSessionProtocol!
    
    override func tearDown() {
        sut = nil
        mockSession = nil
        super.tearDown()
    }
    
    func testNilDataWhenInvalidURL() {
        mockSession = createMockSession(fromJsonFile: "A", andError: nil)
        sut = DataFetcher(url: URL(string: "https://invalidurl")!, session: mockSession)
        
        sut.fetchData(with: { data in
            XCTAssertNil(data)
        })
    }
    
    func testNilDataWhenInvalidDataBeingReturnedByAPI() {
        mockSession = createMockSession(fromJsonFile: "A", andError: nil)
        sut = DataFetcher(url: URL(string: baseUrl + postsEndPoint)!, session: mockSession)
        
        sut.fetchData(with: { data in
            XCTAssertNil(data)
        })
    }
    
    func testSuccessDataWhenValidDataBeingReturnedByAPI() {
        mockSession = createMockSession(fromJsonFile: "Post", andError: nil)
        sut = DataFetcher(url: URL(string: baseUrl + postsEndPoint)!, session: mockSession)
        
        sut.fetchData(with: { data in
            XCTAssertNotNil(data)
            let postContent = data?.first
            XCTAssertEqual(postContent?.id, Post.with().id)
            XCTAssertEqual(postContent?.userId, Post.with().userId)
            XCTAssertEqual(postContent?.title, Post.with().title)
            XCTAssertEqual(postContent?.body, Post.with().body)
        })
    }
    
    private func loadJsonData(file: String) -> Data? {
        
        if let jsonFilePath = Bundle(for: type(of: self)).path(forResource: file, ofType: "json") {
            let jsonFileURL = URL(fileURLWithPath: jsonFilePath)
            
            if let jsonData = try? Data(contentsOf: jsonFileURL) {
                return jsonData
            }
        }
        return nil
    }
    
    private func createMockSession(fromJsonFile file: String,
                                   andError error: Error?) -> MockURLSessionProtocol? {
        
        let data = loadJsonData(file: file)
        let response = HTTPURLResponse(url: URL(string: "randomUrl")!, statusCode: 200, httpVersion: nil, headerFields: nil)
        return MockURLSessionProtocol(completionHandler: (data, response, error))
    }
}
