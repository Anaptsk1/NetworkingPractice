//
//  postViewModel.swift
//  NetworkingPractice
//
//  Created by Ana Ptskialadze on 16.02.25.
//

import Foundation

class PostViewModel: ObservableObject {
    
    @Published var resources = [Resources]()
    @Published var errorMessage: String?
    private let service = NetworkingService()
    
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        //        service.fetchData { titleValue in
        //            self.title = titleValue
        //        }
        service.fetchData { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let resources):
                    self.resources = resources
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
