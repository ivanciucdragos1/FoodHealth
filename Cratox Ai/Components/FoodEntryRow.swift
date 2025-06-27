import SwiftUI

struct FoodEntryRow: View {
    let entry: AnalyzedMeal
    let onShowDetails: () -> Void
    let onDelete: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(entry.itemName)
                    .font(Appfonts.h6Bold)
                    .foregroundColor(AppColors.customBlack)
                Text(entry.healthScore)
                    .font(Appfonts.h6Medium)
                    .foregroundColor(AppColors.primaryGreen)
            }
            Spacer()
            Text("\(entry.calories) cals")
                .font(Appfonts.h6Medium)
                .foregroundColor(AppColors.primaryGreen)

            Menu {
                Button("Details") {
                    onShowDetails()
                }
                Button("Delete", role: .destructive) {
                    onDelete()
                }
            } label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(AppColors.primaryGreen)
                    .font(.title2)
            }
        }
        .padding()
        .background(AppColors.grayscale30)
        .cornerRadius(14)
        .shadow(color: Color.black.opacity(0.04), radius: 4, x: 0, y: 2)
    }
}
