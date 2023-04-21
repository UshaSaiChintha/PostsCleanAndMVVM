//
//  GetPostsUseCase.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 13/04/23.
//

import Foundation
import Network
import SwiftUI

class GetPostsUseCase: ObservableObject {

    @Published var sessionError = false
    
    let monitor = NWPathMonitor()

    let service: FetchPostsDataService
    
    init(service: FetchPostsDataService = PostsDataFetchRepository(endPoint: postsEndPoint, session: URLSession(configuration: URLSessionConfiguration.ephemeral))) {
        URLSessionConfiguration.ephemeral.waitsForConnectivity = true
        self.service = service
    }

    func getPostsData(with completion: @escaping ([Post]?) -> Void) {
        service.fetchPostsData { data in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }
    }
    
}
