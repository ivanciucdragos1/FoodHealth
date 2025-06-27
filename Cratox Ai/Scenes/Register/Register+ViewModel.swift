import Foundation
import Combine

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    @Published var errorMessage: String = ""
    @Published var isRegistered: Bool = false

    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil
    @Published var confirmPasswordError: String? = nil
    @Published var isRegisterEnabled: Bool = false

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
                if rawPassword.rangeOfCharacter(from: .uppercaseLetters) == nil {
                    self.passwordError = "Password must have at least one uppercase letter."
                    return
                }
                if rawPassword.rangeOfCharacter(from: .decimalDigits) == nil {
                    self.passwordError = "Password must have at least one number."
                    return
                }
                let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()-_=+[{]}|;:'\",<.>/?`~")
                if rawPassword.rangeOfCharacter(from: specialCharacterSet) == nil {
                    self.passwordError = "Password must have at least one special character."
                    return
                }
                self.passwordError = nil
            }
            .store(in: &cancellables)

        Publishers.CombineLatest($password, $confirmPassword)
            .sink { [weak self] password, confirmPassword in
                guard let self = self else { return }
                if confirmPassword.isEmpty {
                    self.confirmPasswordError = "Confirm Password must not be empty."
                    return
                }
                if password != confirmPassword {
                    self.confirmPasswordError = "Passwords do not match."
                    return
                }
                self.confirmPasswordError = nil
            }
            .store(in: &cancellables)

        Publishers.CombineLatest3($emailError, $passwordError, $confirmPasswordError)
            .sink { [weak self] eErr, pErr, cErr in
                guard let self = self else { return }
                self.isRegisterEnabled = (eErr == nil && pErr == nil && cErr == nil)
            }
            .store(in: &cancellables)
    }
    
    func register() {
        
    }
}
