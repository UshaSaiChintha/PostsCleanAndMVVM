//
//  PostRowView.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import SwiftUI

struct PostRowView: View {
    
    let postName: String
    let postBody: String
    
    var body: some View {
        HStack{
            VStack{
                Text(postName)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Text(postBody)
                    .fontWeight(.ultraLight)
                    .font(.body)
                    .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(postName: "First Post", postBody: "First Body")
    }
}
