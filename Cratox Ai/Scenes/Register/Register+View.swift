import SwiftUI

struct RegisterView: View {
    @StateObject private var vm = RegisterViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 4) {
                    Text("Create your account")
                        .font(.title2.bold())
                        .foregroundStyle(.primary)
                    Text("Sign up below to get started.")
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
                              placeholder: "Create a password",
                              isSecureField: true,
                              error: vm.passwordError)
                    TextInput(text: $vm.confirmPassword,
                              label: "Confirm Password",
                              placeholder: "Re-enter your password",
                              isSecureField: true,
                              error: vm.confirmPasswordError)
                    
                    if !vm.errorMessage.isEmpty {
                        Text(vm.errorMessage)
                            .font(.subheadline)
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
                
                Button(action: {
                    vm.register()
                }) {
                    Text("Register")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(vm.isRegisterEnabled ? Color.accentColor : Color.gray.opacity(0.4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(!vm.isRegisterEnabled)
                .padding(.horizontal)
                
                HStack {
                    Spacer()
                    Text("Already have an account?")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Button("Log In") {
                        dismiss()
                    }
                    .font(.subheadline.bold())
                }
                .padding(.horizontal)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .onChange(of: vm.isRegistered) { _, registered in
            if registered {
                dismiss()
            }
        }
    }
}

#Preview {
    RegisterView()
}
