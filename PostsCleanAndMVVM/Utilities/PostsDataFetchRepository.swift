//
//  DataFetcherRepository.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import Foundation

//update class, functions and protocol names wrt POSTS (renaming and refactoring)
class DataFetcherRepository: FetchPostsDataProtocol {
    
    let url: URL
    let session: URLSessionProtocol
    
    init(url: URL, session: URLSessionProtocol) {
        self.url = url
        self.session = session
    }
    
    // container mechanism, service-locator pattern, DI...
    
    func fetchData(with completion: @escaping ([Post]?) -> Void) {
        let task = session.dataTask(with: url) { data, _, error in
            if error != nil {
                print("URLSession Error: \(String(describing: error?.localizedDescription))")
                completion(nil)
            } else {
                    guard let data = data else {
                        completion(nil)
                        return
                    }
                    let decoder = JSONDecoder()
                    completion(try? decoder.decode([Post].self, from: data))
                }
        }
        task.resume()
    }
    // repository
}
