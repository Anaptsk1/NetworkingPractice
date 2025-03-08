//
//  DataModel.swift
//  NetworkingPractice
//
//  Created by Ana Ptskialadze on 22.02.25.
//

import Foundation

//struct DataModel: Codable {
//    var results: [singleResource] = []
//}

struct Resources: Codable, Identifiable {
    
    let id: Int
    let title: String
    let body: String
    let userId: Int
    
    //    enum codingKeys: String, CodingKey {
    //        case title, body, userId
    //        case currentPrice = "current_price"
    //    }
    
}
