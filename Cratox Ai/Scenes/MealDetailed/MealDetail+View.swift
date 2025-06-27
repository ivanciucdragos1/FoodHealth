import SwiftUI

struct MealDetailView: View {
    let meal: AnalyzedMeal

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(meal.itemName)
                .font(.largeTitle.bold())
                .foregroundColor(AppColors.primaryGreen)

            Text("Calories: \(meal.calories)")
            Text("Protein: \(meal.protein)")
            Text("Fat: \(meal.fat)")
            Text("Carbs: \(meal.carbs)")
            Text("Health Score: \(meal.healthScore)")
            Text("Coach's Comment:")
                .font(.headline)
            Text(meal.coachComment)
                .italic()
                .padding(.bottom)

            Spacer()
        }
        .padding()
        .navigationTitle("Meal Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
