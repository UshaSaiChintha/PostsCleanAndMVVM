//
//  PostViewModel.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import Foundation
import Network

class PostViewModel: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var isConnected = true
    @Published var sessionError = false
    
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "DataFetcher")
    
    let service: ServiceProtocol
    init(service: ServiceProtocol = DataFetcher(url: URL(string: baseUrl + postsEndPoint)!)) {
        self.service = service
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
    
    func getData() {
        service.fetchData { data in
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
