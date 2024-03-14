## Threads Clone
This project aims to replicate the core functionalities of a popular social networking app like Threads, emphasizing user authentication, thread creation, real-time updates, and a user-friendly interface built with SwiftUI.
It leverages Firebase's robust backend services for seamless data management and real-time interactions.

## Features:
- User Authentication: Users can sign up for new accounts or log in with existing credentials using secure Firebase Authentication.
- Thread Creation: Users can create threads with titles and optional images to spark discussions on various topics.
- Feed View: Browse a scrollable feed displaying all created threads in real-time.
- Search View: Search for specific threads by title for easy navigation.
- Activity View: View user activity, including threads created and interactions.
- Settings View: Manage user profile and account settings.
- Session Management: Combine publishers and subscribers ensure seamless user session handling throughout the app.

  ## Screenshots
  <p>
   <img src="https://github.com/Huss3n/ThreadsClone/blob/main/screenshots/feed.png", width="200"/>
   <img src="https://github.com/Huss3n/ThreadsClone/blob/main/screenshots/search.png", width="200"/>
   <img src="https://github.com/Huss3n/ThreadsClone/blob/main/screenshots/newThread.png", width="200"/>
   <img src="https://github.com/Huss3n/ThreadsClone/blob/main/screenshots/activity.png", width="200"/>
   <img src="https://github.com/Huss3n/ThreadsClone/blob/main/screenshots/profile.png", width="200"/>
</p>

## Prerequisites:

### Development Environment:
- Xcode (latest version recommended)
- Swift and SwiftUI support in Xcode
- Basic familiarity with Swift, SwiftUI, and Git for version control
- Firebase Project:
- Create a new Firebase project or use an existing one
- Enable the required Firebase services (Authentication, Firestore, Storage)
- Download the GoogleService-Info.plist file and add it to your project

## Installation 
1. Clone this repository using Git:
```
git clone https://github.com/Huss3n/ThreadsClone
```
2. Open the project in Xcode.

### Setup:

1. Navigate to your Firebase project console and copy the configuration values for the following:

- API Key
- Project ID
- Database URL
- Storage Bucket
  
2. In your Xcode project, create a file named Constants.swift and add the following code, replacing the placeholder values with your actual Firebase configuration:

```
import Firebase

struct Constants {
    static let ApiKey = "YOUR_API_KEY"
    static let ProjectId = "YOUR_ projekt_ID"
    static let DatabaseURL = "YOUR_DATABASE_URL"
    static let StorageBucket = "YOUR_STORAGE_BUCKET"
}

```
3. Within AppDelegate.swift, configure Firebase using the values from Constants.swift:
```
import UIKit
import FirebaseCore

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

    // ... other methods
}

```


## Development:
1. Implement the core functionalities using Swift and SwiftUI while integrating with Firebase services:
 - User authentication using Firebase Authentication (email/password, social logins, etc.)
 - Thread creation and management using Cloud Firestore (data storage, retrieval, updates)
 - Optional: Cloud Storage for media attachments (if applicable)
 - Real-time updates using Cloud Firestore listeners or Cloud Functions (for complex scenarios)
 - Develop a user-friendly interface with SwiftUI to create a visually appealing and intuitive experience.

## Testing:

Thoroughly test the application on different devices and simulators to ensure functionality and user experience across various scenarios.
Implement unit and integration tests to verify the correctness of individual components and their integration.

## Deployment:

Follow Firebase's documentation for configuration and deployment to App Store Connect or Google Play Store.
Ensure proper provisioning profiles and certificates are in place for app signing and distribution.

