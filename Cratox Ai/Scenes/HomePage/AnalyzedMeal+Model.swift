import Foundation

struct AnalyzedMeal: Identifiable, Codable, Hashable {
    let id: UUID
    let itemName: String
    let calories: Int
    let protein: String
    let fat: String
    let carbs: String
    let healthScore: String
    let coachComment: String
    let analyzedAt: String

    var date: Date {
        ISO8601DateFormatter().date(from: analyzedAt) ?? Date()
    }
}

struct HistoryResponse: Codable {
    let analyses: [AnalyzedMeal]
    let count: Int
}

struct EmptyResponse: Decodable {}
