import Foundation
import SwiftUI

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}

    func login(request: LoginRequest) async throws -> LoginResponse {
        let response = try await AuthService.shared.login(request: request)
        
        let saved = KeychainService.saveToken(response.token)
        if !saved {
            throw APIError.serverMessage("Failed to save token.")
        }
        
        NotificationCenter.default.post(name: .authStatusDidChange, object: nil)
        return response
    }

    func register(request: RegisterRequest) async throws -> LoginResponse {
        let registerResponse = try await AuthService.shared.register(request: request)
        let saved = KeychainService.saveToken(registerResponse.token)
        if !saved {
            throw APIError.serverMessage("Failed to save token.")
        }
        NotificationCenter.default.post(name: .authStatusDidChange, object: nil)
        return LoginResponse(message: registerResponse.message, token: registerResponse.token, user: registerResponse.user)
    }

    func logout() {
        _ = KeychainService.deleteToken()
        NotificationCenter.default.post(name: .authStatusDidChange, object: nil)
    }

    func isAuthenticated() -> Bool {
        return KeychainService.getToken() != nil
    }
}
