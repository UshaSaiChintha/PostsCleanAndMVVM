//
//  FetchPostsDataService.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import Foundation

// protocols can be named as services or other operation
protocol FetchPostsDataService {
    func fetchPostsData(with completion: @escaping ([Post]?) -> Void)
}
