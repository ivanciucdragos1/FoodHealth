import SwiftUI

struct LoginView: View {
    @StateObject private var vm = LoginViewModel()
    @Environment(\.dismiss) private var dismiss
    var onLoginSuccess: (() -> Void)? = nil
    var onGoToRegister: (() -> Void)? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 4) {
                    Text("Welcome back!")
                        .font(.title2.bold())
                        .foregroundStyle(.primary)
                    Text("Log in to your account.")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)
                
                VStack(spacing: 16) {
                    TextInput(text: $vm.email,
                              label: "Email",
                              placeholder: "Enter your email",
                              error: vm.emailError
                    ).autocapitalization(.none)
                    
                    TextInput(text: $vm.password,
                              label: "Password",
                              placeholder: "Enter your password",
                              isSecureField: true,
                              error: vm.passwordError)
                    
                    if !vm.errorMessage.isEmpty {
                        Text(vm.errorMessage)
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                AppButton(
                    variant: vm.isLoginEnabled ? .primary : .disabled,
                    color: AppColors.primaryGreen,
                    font: Appfonts.h6Medium,
                    title: "Log In",
                    action: {
                        vm.login()
                        if vm.navigateToHome {
                            onLoginSuccess?()
                        }
                    }
                )
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                
                GoogleButton(
                    font: Appfonts.h6Medium,
                    color: AppColors.grayscale20,
                    action: {},
                    width: nil
                )
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Text("Don't have an account?")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Button("Sign Up") {
                        onGoToRegister?()
                    }
                    .font(.subheadline.bold())
                    .foregroundStyle(AppColors.primaryGreen)
                }
                .padding(.horizontal)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .navigationDestination(isPresented: $vm.navigateToRegister) {
            RegisterView()
        }
    }
}

#Preview {
    LoginView()
}
