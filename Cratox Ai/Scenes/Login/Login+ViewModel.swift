import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    @Published var errorMessage: String = ""
    @Published var navigateToHome: Bool = false

    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil
    @Published var isLoginEnabled: Bool = false
    
    @Published var navigateToRegister = false

    private var cancellables: Set<AnyCancellable> = []

    init() {
        $email
            .sink { [weak self] rawEmail in
                guard let self = self else { return }
                let trimmed = rawEmail.trimmingCharacters(in: .whitespaces)
                if trimmed.isEmpty {
                    self.emailError = "Email must not be empty."
                    return
                }
                let pattern = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
                let pred = NSPredicate(format: "SELF MATCHES %@", pattern)
                if !pred.evaluate(with: trimmed) {
                    self.emailError = "Please enter a valid email address."
                    return
                }
                self.emailError = nil
            }
            .store(in: &cancellables)

        $password
            .sink { [weak self] rawPassword in
                guard let self = self else { return }
                if rawPassword.isEmpty {
                    self.passwordError = "Password must not be empty."
                    return
                }
                if rawPassword.count < 8 {
                    self.passwordError = "Password must be at least 8 characters."
                    return
                }
                self.passwordError = nil
            }
            .store(in: &cancellables)

        Publishers.CombineLatest($emailError, $passwordError)
            .sink { [weak self] eErr, pErr in
                guard let self = self else { return }
                self.isLoginEnabled = (eErr == nil && pErr == nil)
            }
            .store(in: &cancellables)
    }
    
    func goToRegister() {
            navigateToRegister = true
    }

    func login() {
        let request = LoginRequest(email: email, password: password)
        Task {
            do {
                _ = try await AuthManager.shared.login(request: request)
                DispatchQueue.main.async {
                    self.navigateToHome = true
                    self.errorMessage = ""
                    self.email = ""
                    self.password = ""
                }
            } catch {
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.navigateToHome = false
                }
            }
        }
    }
}

