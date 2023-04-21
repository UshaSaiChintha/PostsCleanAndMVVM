//
//  URLSessionDataTaskProtocol.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
