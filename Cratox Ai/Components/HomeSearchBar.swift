import SwiftUI

struct HomeSearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(Color(.systemGray5))
                .cornerRadius(10)
                .font(.body)
        }
        .padding(.horizontal)
    }
}

