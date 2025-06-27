import SwiftUI

struct GoogleButton: View {
    let font: Font
    let color: Color
    let action: () -> Void
    let width: CGFloat?
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image("googleLogo")
                    .resizable()
                    .interpolation(.high)
                    .scaledToFit()
                    .frame(width: 16, height: 20)
                    .foregroundColor(.white)
                Text("Continue with Google")
                    .font(font)
                    .foregroundColor(AppColors.customBlack)
            }
            .padding()
        }
        .frame(maxWidth: width == nil ? .infinity : width)
        .background(color)
        .cornerRadius(16)
        .buttonStyle(GoogleButtonStyle())
    }
}

struct GoogleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct GoogleButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleButton(
            font: Appfonts.h6Medium,
            color: AppColors.grayscale20,
            action: { print("Button tapped") },
            width: .infinity
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}


