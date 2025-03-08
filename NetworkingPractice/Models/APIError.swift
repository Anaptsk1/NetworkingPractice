//
//  APIError.swift
//  NetworkingPractice
//
//  Created by Ana Ptskialadze on 07.03.25.
//

import Foundation

enum APIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData:
            return "invalid data"
        case .jsonParsingFailure:
            return "failed to parse JSON"
        case let .requestFailed(description):
            return "request failed: \(description)"
        case let .invalidStatusCode(statusCode):
            return "invalid status code: \(statusCode)"
        case let .unknownError(error):
            return "An unknown error occured \(error.localizedDescription)"
        }
    }
}
