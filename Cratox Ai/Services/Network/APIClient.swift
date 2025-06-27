import Foundation

final class APIClient {
    static let shared = APIClient()
    private init() {}

    func request<T: Decodable>(_ request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        print("HTTP Status Code: \(httpResponse.statusCode)")

        if let json = String(data: data, encoding: .utf8) {
            print("Server response body: \(json)")
        }

        if (200...299).contains(httpResponse.statusCode) {
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                return decoded
            } catch {
                throw APIError.decodingError(error)
            }
        } else {
            if let serverError = try? JSONDecoder().decode(ServerErrorResponse.self, from: data) {
                throw APIError.serverMessage(serverError.displayMessage)
            }
            throw APIError.statusCode(httpResponse.statusCode)
        }
    }
    
    func upload<T: Decodable>(_ request: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        if (200...299).contains(httpResponse.statusCode) {
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                return decoded
            } catch {
                throw APIError.decodingError(error)
            }
        } else {
            if let serverError = try? JSONDecoder().decode(ServerErrorResponse.self, from: data) {
                throw APIError.serverMessage(serverError.displayMessage)
            }
            throw APIError.statusCode(httpResponse.statusCode)
        }
    }
}

struct ServerErrorResponse: Decodable {
    let message: String?
    let error: String?

    var displayMessage: String {
        message ?? error ?? "An unknown server error occurred."
    }
}
