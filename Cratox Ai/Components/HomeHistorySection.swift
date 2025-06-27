import SwiftUI

struct HomeHistorySection: View {
    let entries: [AnalyzedMeal]
    let onSelectMeal: (AnalyzedMeal) -> Void
    let onDeleteMeal: (AnalyzedMeal) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("History")
                .font(Appfonts.h5Bold)
                .foregroundColor(AppColors.primaryGreen)
                .padding(.top, 8)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 8) {
                ForEach(entries.indices, id: \.self) { index in
                    FoodEntryRow(
                        entry: entries[index],
                        onShowDetails: { onSelectMeal(entries[index]) },
                        onDelete: { onDeleteMeal(entries[index]) }
                    )
                }
            }
        }
        .background(AppColors.grayscale20)
        .cornerRadius(16)
        .padding(.horizontal)
    }
}
