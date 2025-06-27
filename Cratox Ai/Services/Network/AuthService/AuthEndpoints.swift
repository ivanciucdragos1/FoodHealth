import Foundation

enum AuthEndpoints {
    static let baseURL = AppEnvironment.authAPIBaseURL

    static func login(_ body: LoginRequest) throws -> URLRequest {
        try makeRequest(path: "/login", method: "POST", body: body)
    }

    static func register(_ body: RegisterRequest) throws -> URLRequest {
        try makeRequest(path: "/register", method: "POST", body: body)
    }

    static func logout(token: String) throws -> URLRequest {
        var request = try makeRequest(path: "/logout", method: "POST", body: EmptyBody())
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }

    static func me(token: String) throws -> URLRequest {
        var request = try makeRequest(path: "/me", method: "GET")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }

    static func health() throws -> URLRequest {
        try makeRequest(path: "/health", method: "GET")
    }

    // MARK: - Private helper

    private static func makeRequest<T: Encodable>(path: String, method: String, body: T) throws -> URLRequest {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try JSONEncoder().encode(body)
        return request
    }

    private static func makeRequest(path: String, method: String) throws -> URLRequest {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw APIError.invalidURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }

    private struct EmptyBody: Encodable {}
}
