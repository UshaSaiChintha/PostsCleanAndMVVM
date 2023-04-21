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
            List(model.posts) { post in
                PostRowView(postName: post.title)
            }
            .listStyle(PlainListStyle())
            .navigationTitle(pageTitle)
            .onAppear {
                model.getData()
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