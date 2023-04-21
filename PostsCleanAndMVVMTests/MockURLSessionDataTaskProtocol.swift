//
//  MockProtocols.swift
//  PostsCleanAndMVVMTests
//
//  Created by Usha Sai Chintha on 12/04/23.
//

import Foundation

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    func resume() {}
}

class MockURLSession: URLSessionProtocol {

    var dataTask = MockURLSessionDataTask()
    var completionHandler: (Data?, URLResponse?, Error?)

    init(completionHandler: (Data?, URLResponse?, Error?)) {
        self.completionHandler = completionHandler
    }

    func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        completionHandler(self.completionHandler.0, self.completionHandler.1, self.completionHandler.2)
        return dataTask
    }
}
