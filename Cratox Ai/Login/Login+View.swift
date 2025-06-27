import SwiftUI

struct LoginView: View {
    @StateObject private var vm = LoginViewModel()
    @Environment(\.dismiss) private var dismiss
    
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
                              error: vm.emailError)
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
                
                Button(action: {
                    vm.login()
                }) {
                    Text("Log In")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(vm.isLoginEnabled ? Color.accentColor : Color.gray.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(!vm.isLoginEnabled)
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Text("Don't have an account?")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Button("Sign Up") {
                        dismiss()
                    }
                    .font(.subheadline.bold())
                }
                .padding(.horizontal)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .onChange(of: vm.isLoggedIn) { _, loggedIn in
            if loggedIn {
                dismiss()
            }
        }
    }
}

#Preview {
    LoginView()
}
