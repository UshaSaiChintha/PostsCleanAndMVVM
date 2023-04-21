//
//  PostRowView.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import SwiftUI

struct PostRowView: View {
    
    let postName: String
    
    var body: some View {
        HStack{
            Text(postName)
            Spacer()
        }
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(postName: "First Post")
    }
}
