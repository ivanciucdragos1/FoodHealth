import SwiftUI

struct HomeHeader: View {
    @Binding var selectedMeal: String
    let mealOptions: [String]
    let onLogout: () -> Void

    var body: some View {
        ZStack(alignment: .top) {
            Color(.systemGray6)
                .clipShape(RoundedBottomCorners(radius: 0))
                .ignoresSafeArea(edges: .top)

            HStack {
                Menu {
                    ForEach(mealOptions, id: \.self) { meal in
                        Button(meal) {
                            selectedMeal = meal
                        }
                    }
                } label: {
                    HStack {
                        Text(selectedMeal)
                            .font(.title3)
                            .foregroundStyle(AppColors.primaryGreen)
                        Image(systemName: "chevron.down")
                            .font(.title3)
                            .foregroundStyle(AppColors.primaryGreen)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 6)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                }

                Spacer()

                Menu {
                    Button("My Profile") {
                        print("My Profile tapped")
                    }
                    Button("Settings") {
                        print("Settings tapped")
                    }
                    Button("Logout") {
                        onLogout()
                    }
                } label: {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 38, height: 38)
                        .clipShape(Circle())
                        .foregroundStyle(AppColors.primaryGreen)
                        .padding(.leading, 8)
                }
            }
            .padding(.horizontal)
            .padding(.top, 72)
            .padding(.bottom, 24)
            .ignoresSafeArea(edges: .top)
        }
        .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 3)
    }
}
