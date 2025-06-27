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
                              error: vm.emailError
                    ).autocapitalization(.none)
            
                    TextInput(text: $vm.firstName,
                                  label: "First Name",
                                  placeholder: "Enter your first name")
                    
                    TextInput(text: $vm.lastName,
                                  label: "Last Name",
                                  placeholder: "Enter your last name")
                    
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
                
                AppButton(
                    variant: vm.isRegisterEnabled ? .primary : .disabled,
                    color: AppColors.primaryGreen,
                    font: Appfonts.h6Medium,
                    title: "Register",
                    action: {
                        vm.register()
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
                    Text("Already have an account?")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Button("Log In") {
                        dismiss()
                    }
                    .font(.subheadline.bold())
                    .foregroundStyle(AppColors.primaryGreen)
                }
                .padding(.horizontal)
            }
            .padding(.top)
            .frame(maxWidth: .infinity, alignment: .topLeading)
        }
        .navigationDestination(isPresented: $vm.navigateToHome) {
            HomePageView()
        }
    }
}

#Preview {
    RegisterView()
}
