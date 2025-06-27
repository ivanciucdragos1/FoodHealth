import SwiftUI

struct HomeTabPicker: View {
    @Binding var selectedTab: Int
    let tabOptions: [String]

    var body: some View {
        Picker("Category", selection: $selectedTab) {
            ForEach(0..<tabOptions.count, id: \.self) {
                Text(tabOptions[$0])
                    .font(Appfonts.h6Medium)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding(.horizontal)
        .background(AppColors.grayscale20)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
        .tint(AppColors.primaryGreen)
        .padding(.horizontal)
    }
}

#Preview {
    struct HomeTabPickerPreview: View {
        @State private var selectedTab = 0
        private let tabOptions = ["All", "My Meals", "My Recipes", "My Foods"]
        var body: some View {
            HomeTabPicker(selectedTab: $selectedTab, tabOptions: tabOptions)
        }
    }
    return HomeTabPickerPreview()
}
