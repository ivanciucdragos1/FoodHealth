import Foundation

enum AppEnvironment {
    static var foodAPIBaseURL: String {
        #if targetEnvironment(simulator)
        return ProcessInfo.processInfo.environment["FOOD_API_URL_SIMULATOR"] ?? ""
        #else
        return ProcessInfo.processInfo.environment["FOOD_API_URL_DEVICE"] ?? ""
        #endif
    }

    static var authAPIBaseURL: String {
        #if targetEnvironment(simulator)
        return ProcessInfo.processInfo.environment["AUTH_API_URL_SIMULATOR"] ?? ""
        #else
        return ProcessInfo.processInfo.environment["AUTH_API_URL_DEVICE"] ?? ""
        #endif
    }
}
