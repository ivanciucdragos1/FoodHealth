import SwiftUI
import PhotosUI

struct PhotoLibraryPicker: View {
    @Binding var imageData: Data?
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @Binding var isPresented: Bool

    var body: some View {
        PhotosPicker(
            selection: $selectedPhoto,
            matching: .images,
            photoLibrary: .shared()
        ) {
            Label("Select a photo", systemImage: "photo.on.rectangle")
                .font(.headline)
        }
        .onChange(of: selectedPhoto) { newValue, _ in
            guard let newValue = newValue else {
                return
            }

            Task {
                do {
                    if let data = try await newValue.loadTransferable(type: Data.self) {
                        imageData = data
                        isPresented = false
                        selectedPhoto = nil
                    }
                } catch {
                    isPresented = false
                    selectedPhoto = nil
                }
            }
        }
        .onChange(of: isPresented) { wasPresented, nowPresented in
            if wasPresented == true && nowPresented == false {
                selectedPhoto = nil
            }
        }
    }
}
