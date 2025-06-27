# 🥗 Cratox Ai – SwiftUI Food Analysis App

Welcome! This is a sample **SwiftUI app** for food photo analysis, user authentication, and nutrition info display.  
It is designed as a **technical challenge** and demonstrates modern iOS techniques, including secure authentication, photo library integration, and API consumption.

----------------------------------

## 🚀 Getting Started

### 🧰 System Requirements
- macOS 12.0+
- Xcode 14+ (latest recommended)
- Backend services running locally (authentication and food analysis APIs)

---

### 1️⃣ Clone and Open the Project

```bash
git clone https://github.com/ivanciucdragos1/FoodHealth.git
cd FoodHealth
open "Cratox Ai.xcodeproj"
```
----------------------------------

### 2️⃣ Configure API Endpoints

This app uses environment variables for backend endpoints.
In Xcode, go to:

Product > Scheme > Edit Scheme > Run > Arguments > Environment Variables

Add the following:
FOOD_API_URL_SIMULATOR = http://localhost:5052  
FOOD_API_URL_DEVICE    = http://localhost:5052  
AUTH_API_URL_SIMULATOR = http://localhost:5051  
AUTH_API_URL_DEVICE    = http://localhost:5051 

----------------------------------

### 3️⃣ Start Backend Services

Make sure your authentication and food analysis services are running (Docker or otherwise) on the specified ports.

----------------------------------

### 4️⃣ Build and Run
	•	Select a simulator or real device in Xcode.
	•	Press Run.
	•	Register a new user and test the full photo → nutrition analysis flow.


----------------------------------

 📱 Features
	•	🔐 Authentication: Register/login with email & password, token stored securely in Keychain.
	•	📷 Photo Picker: Select meals using the iOS photo library.
	•	🍱 Food Analysis: Upload images to the backend, retrieve calories and nutrition info.
	•	📜 History: View previous meals, delete entries.
	•	🧠 Architecture: Clean MVVM separation using, @ObservableObject, @StateObject and @Published.

----------------------------------

🧪 Implementation Notes
	•	I used MVVM for clear separation of concerns and async/await for smooth networking.
	•	The biggest challenge was handling image selection from the photo library — especially making sure the picker reset correctly and worked reliably on real devices.
	•	Views and ViewModels are grouped in folders together for simplicity and ease of access.

----------------------------------

 🆘 Troubleshooting
	•	Backend not responding?
Make sure Docker services are running and accessible at the configured URLs.
	•	Auth issues?
Double-check your environment variable setup.
	•	Image upload failing?
Ensure the auth token is valid and the image is being correctly selected from the device.
