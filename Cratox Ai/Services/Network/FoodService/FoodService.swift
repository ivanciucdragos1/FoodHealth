import Foundation

final class FoodService {
    static let shared = FoodService()
    private init() {}

    func getHistory(token: String, limit: Int = 50) async throws -> HistoryResponse {
        let request = try FoodEndpoints.history(token: token, limit: limit)
        return try await APIClient.shared.request(request)
    }

    func uploadImage(imageData: Data, filename: String, token: String) async throws -> AnalyzedMeal {
        let request = try FoodEndpoints.uploadImage(imageData: imageData, filename: filename, token: token)
        return try await APIClient.shared.upload(request)
    }
    
    func deleteMeal(id: UUID, token: String) async throws {
        let request = try FoodEndpoints.deleteMeal(id: id, token: token)
        _ = try await APIClient.shared.request(request) as EmptyResponse
    }
}
