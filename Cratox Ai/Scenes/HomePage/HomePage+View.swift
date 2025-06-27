import SwiftUI
import PhotosUI

struct HomePageView: View {
    @StateObject private var vm = HomePageViewModel()
    
    @State private var selectedMeal = "Breakfast"
    @State private var searchText = ""
    @State private var selectedMealForDetail: AnalyzedMeal? = nil

    @State private var selectedPhoto: PhotosPickerItem? = nil
    @State private var imageData: Data? = nil
    @State private var isPhotoPickerPresented = false
    @State private var showSuccess = false
    @State private var showDeleteSuccess = false
    
    let mealOptions = ["Breakfast", "Lunch", "Dinner"]

    var filteredEntries: [AnalyzedMeal] {
        if searchText.isEmpty {
            return vm.entries
        } else {
            return vm.entries.filter { $0.itemName.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationStack {
            if vm.isLoggedOut {
                LoginView()
            } else {
                ZStack(alignment: .top) {
                    Color(.systemGray6)
                        .ignoresSafeArea(edges: .top)

                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            HomeHeader(
                                selectedMeal: $selectedMeal,
                                mealOptions: mealOptions,
                                onLogout: {
                                    vm.logout()
                                })

                            HomeSearchBar(searchText: $searchText)

                            HStack(spacing: 16) {
                                ScanButton(icon: "square.and.arrow.up", title: "Upload Meal") {
                                    isPhotoPickerPresented = true
                                }
                            }
                            .padding(.horizontal)

                            if vm.isUploading {
                                ProgressView("Uploading image...")
                                    .padding()
                            }

                            if let error = vm.uploadError {
                                Text("Upload failed: \(error)")
                                    .foregroundColor(.red)
                                    .padding(.horizontal)
                            }

                            HomeHistorySection(
                                entries: filteredEntries,
                                onSelectMeal: { selected in
                                    selectedMealForDetail = selected
                                },
                                onDeleteMeal: { meal in
                                    Task {
                                        await vm.deleteMeal(meal)
                                        if vm.deleteError == nil {
                                            showDeleteSuccess = true
                                        }
                                    }
                                }
                            )
                        }
                    }
                    .sheet(isPresented: $isPhotoPickerPresented) {
                        PhotosPicker(
                            selection: $selectedPhoto,
                            matching: .images,
                            photoLibrary: .shared()
                        ) {
                            Text("Select a photo to upload")
                        }
                        .onChange(of: selectedPhoto) { _, newItem in
                            guard let newItem else { return }

                            Task {
                                do {
                                    let data = try await newItem.loadTransferable(type: Data.self)
                                    if let data {
                                        imageData = data
                                        await vm.uploadImage(data)
                                        if vm.uploadError == nil {
                                            showSuccess = true
                                        }
                                    }
                                } catch {
                                    vm.uploadError = error.localizedDescription
                                }
                                
                                selectedPhoto = nil
                            }
                            
                            isPhotoPickerPresented = false
                        }
                    }
                }
                .navigationTitle("")
                .navigationBarHidden(true)
                .ignoresSafeArea(edges: .all)
                .alert("Deleted successfully", isPresented: $showDeleteSuccess) {
                    Button("OK", role: .cancel) {}
                }
                .navigationDestination(item: $selectedMealForDetail) { meal in
                    MealDetailView(meal: meal)
                }
            }
        }
    }
}

#Preview {
    HomePageView()
}
