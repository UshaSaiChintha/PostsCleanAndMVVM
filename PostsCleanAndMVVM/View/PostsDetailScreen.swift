//
//  PostsDetailScreen.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 04/05/23.
//

import SwiftUI

struct PostsDetailScreen: View {
    
    let postName: String
    
    var body: some View {
        VStack {
        Text("Selected Title")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
        Text(postName)
            .font(.headline)
            .fontWeight(.light)
            .multilineTextAlignment(.center)
        }
    }
}

struct PostsDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PostsDetailScreen(postName: "First Post")
    }
}
