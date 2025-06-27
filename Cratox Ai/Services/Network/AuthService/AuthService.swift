import Foundation

final class AuthService {
    static let shared = AuthService()
    private init() {}
    

    func login(request: LoginRequest) async throws -> LoginResponse {
        let urlRequest = try AuthEndpoints.login(request)
        return try await APIClient.shared.request(urlRequest)
    }

    func register(request: RegisterRequest) async throws -> RegisterResponse {
        let urlRequest = try AuthEndpoints.register(request)
        return try await APIClient.shared.request(urlRequest)
    }

    func logout(token: String) async throws {
        let urlRequest = try AuthEndpoints.logout(token: token)
        _ = try await APIClient.shared.request(urlRequest) as EmptyResponse
    }

    func me(token: String) async throws -> User {
        let urlRequest = try AuthEndpoints.me(token: token)
        return try await APIClient.shared.request(urlRequest)
    }

    func health() async throws -> String {
        let urlRequest = try AuthEndpoints.health()
        struct HealthResponse: Decodable {
            let message: String
        }
        let response = try await APIClient.shared.request(urlRequest) as HealthResponse
        return response.message
    }

    private struct EmptyResponse: Decodable {}
}
