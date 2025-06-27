//
//  APIError.swift
//  Cratox Ai
//
//  Created by Dragos Ivanciuc on 24.06.2025.
//
import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decodingError(Error)
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .invalidResponse:
            return "The server response was invalid."
        case .statusCode(let code):
            return "Request failed with status code \(code)."
        case .decodingError:
            return "Failed to decode the server response."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
