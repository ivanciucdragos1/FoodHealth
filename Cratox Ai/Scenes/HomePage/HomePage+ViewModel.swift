import Foundation
import Combine

@MainActor
class HomePageViewModel: ObservableObject {
    @Published var entries: [AnalyzedMeal] = []
    @Published var isLoggedOut = false
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isUploading = false
    @Published var uploadError: String? = nil
    @Published var deleteError: String? = nil

    init(preload: Bool = true) {
        if preload {
            Task {
                await Self.loadSafely(into: self)
            }
        }
    }

    static func loadSafely(into viewModel: HomePageViewModel) async {
        guard KeychainService.getToken() != nil else {
            viewModel.isLoggedOut = true
            return
        }

        viewModel.isLoading = true
        defer { viewModel.isLoading = false }

        do {
            let result = try await FoodManager.shared.fetchHistory()
            viewModel.entries = result
        } catch {
            if let apiError = error as? APIError, case .statusCode(401) = apiError {
                viewModel.isLoggedOut = true
            } else {
                viewModel.errorMessage = error.localizedDescription
            }
        }
    }

    func logout() {
        AuthManager.shared.logout()
        isLoggedOut = true
    }
    
    func uploadImage(_ data: Data) async {
        isUploading = true
        uploadError = nil

        Task {
            do {
                let analyzed = try await FoodManager.shared.uploadMeal(imageData: data)
                entries.insert(analyzed, at: 0)
            } catch {
                uploadError = error.localizedDescription
            }
            isUploading = false
        }
    }
    
    func deleteMeal(_ meal: AnalyzedMeal) async {
        deleteError = nil
        do {
            try await FoodManager.shared.deleteMeal(id: meal.id)
            entries.removeAll { $0.id == meal.id }
        } catch {
            deleteError = error.localizedDescription
        }
    }
}
