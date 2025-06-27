import SwiftUI

struct TextInput: View {
    @Binding var text: String
    
    var label: String
    var placeholder: String?
    var isSecureField: Bool = false
    var error: String? = nil
    
    @State private var isSecureTextEntry: Bool = false
    @State private var iconScale: CGFloat = 1.0
    @FocusState private var isFocused: Bool
    @State private var hasStartedEditing: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.subheadline)
                .foregroundColor(.primary)
            inputField
            if hasStartedEditing, let error = error {
                Text(error)
                    .font(.caption)
                    .foregroundColor(AppColors.errorRed)
                    .padding(.leading, 16)
            }
        }
    }
    
    private var inputField: some View {
        Group {
            if isSecureField {
                secureTextField
            } else {
                regularTextField
            }
        }
        .onChange(of: text) { _, _ in hasStartedEditing = true }
        .focused($isFocused)
        .padding(16)
        .background(isFocused ? Color.clear : AppColors.grayscale20)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(errorBorderColor, lineWidth: 2)
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    private var regularTextField: some View {
        TextField(placeholder ?? "", text: $text)
    }
    
    private var secureTextField: some View {
        ZStack {
            if isSecureTextEntry {
                SecureField(placeholder ?? "", text: $text)
            } else {
                regularTextField
            }
            secureTextFieldToggle
        }
    }
    
    private var secureTextFieldToggle: some View {
        Image(systemName: isSecureTextEntry ? "eye.slash" : "eye")
            .frame(maxWidth: .infinity, alignment: .trailing)
            .scaleEffect(iconScale)
            .onTapGesture {
                withAnimation {
                    isSecureTextEntry.toggle()
                    iconScale = 1.1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation { iconScale = 1.0 }
                }
            }
    }
    
    private var errorBorderColor: Color {
        if hasStartedEditing, error != nil {
            return AppColors.errorRed
        } else if isFocused {
            return AppColors.primaryGreen
        } else {
            return Color.clear
        }
    }
}

#Preview {
    @Previewable @State var text = ""
    VStack(spacing: 16) {
        TextInput(text: $text, label: "Full Name", placeholder: "Enter your full name", error: nil)
            .padding()
        TextInput(text: $text, label: "Password", placeholder: "Enter Password", isSecureField: true, error: nil)
            .padding()
    }
}

