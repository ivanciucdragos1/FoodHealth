import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct LoginResponse: Decodable {
    let message: String
    let token: String
    let user: User
}

struct User: Decodable {
    let id: UUID
    let email: String
    let firstName: String
    let lastName: String
}
