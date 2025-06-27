import SwiftUI

enum AppButtonVariant {
    case primary, secondary, tertiary, disabled, state
}

struct AppButton: View {
    let variant: AppButtonVariant
    let color: Color
    let font: Font
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(font)
                .foregroundColor(foregroundColor(for: variant))
                .padding()
                .frame(maxWidth: .infinity)
        }
        .background(background(for: variant, baseColor: color))
        .cornerRadius(16)
        .overlay(border(for: variant, baseColor: color))
        .opacity(buttonOpacity(for: variant))
    }
    
    private func foregroundColor(for variant: AppButtonVariant) -> Color {
        switch variant {
        case .primary, .state:
            return .white
        case .secondary, .tertiary, .disabled:
            return color
        }
    }
    
    @ViewBuilder
    private func background(for variant: AppButtonVariant, baseColor: Color) -> some View {
        switch variant {
        case .primary, .state:
            baseColor
        case .secondary, .tertiary:
            Color.clear
        case .disabled:
            Color.gray.opacity(0.3)
        }
    }
    
    @ViewBuilder
    private func border(for variant: AppButtonVariant, baseColor: Color) -> some View {
        switch variant {
        case .secondary:
            RoundedRectangle(cornerRadius: 16)
                .stroke(baseColor, lineWidth: 2)
        default:
            EmptyView()
        }
    }
    
    private func buttonOpacity(for variant: AppButtonVariant) -> Double {
        switch variant {
        case .disabled:
            return 0.6
        default:
            return 1.0
        }
    }
}

struct AppButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            AppButton(variant: .primary, color: AppColors.primaryGreen, font: Appfonts.h5Medium, title: "Primary Button") {}
            AppButton(variant: .secondary, color: AppColors.primaryGreen, font: Appfonts.h5Medium, title: "Secondary Button") {}
            AppButton(variant: .tertiary, color: AppColors.primaryGreen, font: Appfonts.h5Medium, title: "Tertiary Button") {}
            AppButton(variant: .disabled, color: AppColors.primaryGreen, font: Appfonts.h5Medium, title: "Disabled Button") {}
            AppButton(variant: .state, color: AppColors.successGreen, font: Appfonts.h5Medium, title: "State Button") {}
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

