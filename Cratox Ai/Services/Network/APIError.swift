import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case serverMessage(String)
    case decodingError(Error)
    case unauthorized
    case unknown(Error)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .invalidResponse:
            return "The server response was invalid."
        case .statusCode(let code):
            return "Request failed with status code \(code)."
        case .serverMessage(let message):
            return message
        case .decodingError:
            return "Failed to decode the server response."
        case .unauthorized:
            return "You are not authorized. Please log in again."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
