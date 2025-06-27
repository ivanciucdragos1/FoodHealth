import SwiftUI

struct ScanButton: View {
    let icon: String
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 28))
                    .frame(width: 60, height: 60)
                    .background(AppColors.grayscale20)
                    .clipShape(Circle())
                    .foregroundColor(AppColors.primaryGreen)
                Text(title)
                    .font(Appfonts.h6Medium)
                    .foregroundColor(AppColors.primaryGreen)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(AppColors.grayscale30)
            .cornerRadius(14)
            .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        ScanButton(icon: "camera.fill", title: "Scan a Meal") {}
        ScanButton(icon: "barcode.viewfinder", title: "Scan a Barcode") {}
    }
    .padding()
    .background(AppColors.secondaryWhite)
}
