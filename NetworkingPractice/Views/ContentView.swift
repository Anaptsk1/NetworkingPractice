//
//  ContentView.swift
//  NetworkingPractice
//
//  Created by Ana Ptskialadze on 15.02.25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var postViewModel = PostViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(postViewModel.resources) { resources in
                    NavigationLink("-", destination: SingleResourceView(resources: resources))
                }
            }
            .navigationTitle("Your Feed")
            .padding()
            .overlay {
                if let error = postViewModel.errorMessage {
                    Text(error)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

