import SwiftUI

extension Notification.Name {
    static let authStatusDidChange = Notification.Name("authStatusDidChange")
}

struct SplashscreenView: View {
    @State private var showRegister = false
    @State private var isAuthenticated = AuthManager.shared.isAuthenticated()

    var body: some View {
        NavigationStack {
            Group {
                if isAuthenticated {
                    HomePageView()
                } else {
                    LoginView(
                        onLoginSuccess: {
                            isAuthenticated = true
                        },
                        onGoToRegister: {
                            showRegister = true
                        }
                    )
                }
            }
            .onAppear {
                isAuthenticated = AuthManager.shared.isAuthenticated()
            }
            .onReceive(NotificationCenter.default.publisher(for: .authStatusDidChange)) { _ in
                isAuthenticated = AuthManager.shared.isAuthenticated()
            }
            .navigationDestination(isPresented: $showRegister) {
                RegisterView()
            }
        }
    }
}


#Preview {
    SplashscreenView()
}

