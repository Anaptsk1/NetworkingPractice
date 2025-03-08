//
//  NetworkingService.swift
//  NetworkingPractice
//
//  Created by Ana Ptskialadze on 22.02.25.
//

import Foundation

class NetworkingService {
    
    private let urlString = "https://jsonplaceholder.typicode.com/posts"
    
    func fetchData(completion: @escaping(Result<[Resources], APIError>) -> Void) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(.unknownError(error: error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(.failure(.requestFailed(description: "request failed")))
                return
            }
            
            guard httpResponse.statusCode == 200 else {
                completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([Resources].self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.jsonParsingFailure))
            }
        }.resume()
    }
    
    
    //    func fetchData(completion: @escaping(String) -> Void) {
    //
    //        let urlString = "https://jsonplaceholder.typicode.com/posts/1"
    //        guard let url = URL(string: urlString) else {return}
    //
    //        print("fetching posts...")
    //
    //        URLSession.shared.dataTask(with: url) { data, response, error in
    //            DispatchQueue.main.async {
    //
    //                if let error = error {
    //                    print("Error fetching the data \(error.localizedDescription)")
    ////                    self.errorMessage = error.localizedDescription
    //                    return
    //                }
    //
    //                guard let httpURLResponse = response as? HTTPURLResponse else {
    ////                    self.errorMessage = "Bad HTTP Response"
    //                    return
    //                }
    //
    //                guard httpURLResponse.statusCode == 200 else {
    ////                    self.errorMessage = "Failed to fetch data with error code: \(httpURLResponse.statusCode)"
    //                    return
    //                }
    //
    //                guard let data = data else {return}
    //                print("did recieve \(data)")
    //                guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {return}
    //
    //                guard let titleValue = jsonObject["title"] as? String else {return}
    //                guard let bodyValue = jsonObject["body"] as? String else {return}
    //                guard let userIdValue = jsonObject["userId"] as? Int else {return}
    //
    ////                self.title = titleValue
    ////                self.body = bodyValue
    ////                self.userId = "\(userIdValue)"
    //                completion(titleValue)
    //
    //
    //            }
    //        }.resume()
    //        print("did reach the end of the function")
    //    }
    //
    
}
