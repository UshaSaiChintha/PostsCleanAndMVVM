//
//  ContentView.swift
//  PostsCleanAndMVVM
//
//  Created by Usha Sai Chintha on 11/04/23.
//

import SwiftUI

struct PostsView: View {

    @ObservedObject private var model = PostViewModel()
    
    var body: some View {
        if !model.isConnected {
            Text(model.connectionDescription)
                .foregroundColor(Color.black)
                .font(.headline)
                .padding(.horizontal, 10)
        } else if model.sessionError {
            Text(model.sessionErrorDescription)
                .foregroundColor(Color.black)
                .font(.headline)
                .padding(.horizontal, 10)
        } else {
            NavigationStack {
                List(model.posts) { post in
                    NavigationLink {
                        PostsDetailScreen(postName: post.title)
                    } label: {
                        PostRowView(postName: post.title, postBody: post.body)
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle(pageTitle)
                .onAppear {
                    model.getPostsData()
                }
            }
        }
    }
}

struct PostsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PostsView()
        }
    }
}
