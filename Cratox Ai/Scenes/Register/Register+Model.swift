import Foundation

struct RegisterRequest: Encodable {
    let email: String
    let password: String
    let firstName: String
    let lastName: String
}

struct RegisterResponse: Decodable {
    let message: String
    let token: String
    let user: User
}
