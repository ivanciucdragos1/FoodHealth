//
//  Register+Model.swift
//  Cratox Ai
//
//  Created by Dragos Ivanciuc on 24.06.2025.
//

import Foundation

struct RegisterModel: Codable {
    let email: String
    let password: String
    let firstName: String
    let lastName: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
        case firstName
        case lastName
    }
}
