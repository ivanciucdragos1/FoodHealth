import Foundation

final class FoodManager {
    static let shared = FoodManager()
    private init() {}

    func fetchHistory(limit: Int = 50) async throws -> [AnalyzedMeal] {
        guard let token = KeychainService.getToken() else {
            throw APIError.serverMessage("Missing token.")
        }

        let response = try await FoodService.shared.getHistory(token: token, limit: limit)

        return response.analyses
    }

    func uploadMeal(imageData: Data, filename: String = "meal.jpg") async throws -> AnalyzedMeal {
        guard let token = KeychainService.getToken() else {
            throw APIError.serverMessage("Missing token.")
        }

        let result = try await FoodService.shared.uploadImage(imageData: imageData, filename: filename, token: token)

        return result
    }
    
    func deleteMeal(id: UUID) async throws {
        guard let token = KeychainService.getToken() else {
            throw APIError.serverMessage("Missing token.")
        }

        try await FoodService.shared.deleteMeal(id: id, token: token)
    }
}
