//
//  PostsDataFetchRepository.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import Foundation

class PostsDataFetchRepository: FetchPostsDataService {
    
    
    let endPoint: String
    let session: URLSessionProtocol
    
    init(endPoint: String, session: URLSessionProtocol) {
        self.endPoint = endPoint
        self.session = session
    }
    
    func fetchPostsData(with completion: @escaping ([Post]?) -> Void) {
        let task = session.dataTask(with: URL(string: baseUrl + endPoint)!) { data, _, error in
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
}
