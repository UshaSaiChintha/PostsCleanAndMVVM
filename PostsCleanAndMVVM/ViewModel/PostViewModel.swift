//
//  PostViewModel.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import Foundation
import Network
import SwiftUI

class PostViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var isConnected = true
    @Published var sessionError = false
    
    var getPostsUseCase = GetPostsUseCase()
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "PostsDataFetchRepository")
    
    init(getPostsUseCase: GetPostsUseCase = GetPostsUseCase()) {
        self.getPostsUseCase = getPostsUseCase
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        
        monitor.start(queue: queue)
    }
    
    var connectionDescription: String {
        if isConnected {
            return ""
        } else {
            return "It looks like you're not connected to the internet. Make sure WiFi is enabled and try again"
        }
    }
    
    var sessionErrorDescription: String {
        if sessionError {
            return "Unable to retrieve the required data at the moment. Try later"
        } else {
            return ""
        }
    }
    
    func getPostsData() {
        getPostsUseCase.getPostsData { data in
            guard let data = data else {
                DispatchQueue.main.async {
                    self.sessionError = true
                }
                return

            }
            DispatchQueue.main.async {
                self.posts = data
            }
        }
    }
}
