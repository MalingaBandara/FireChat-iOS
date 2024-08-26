
# FireChat iOS

## Project Overview

FireChat is a real-time chat application for iOS built using Swift and Firebase. The app leverages Firebase Authentication for secure user login and registration, and Firestore for real-time messaging capabilities. FireChat is designed to provide a simple and clean user experience, making it easy for users to send and receive messages in real time.

## Key Features

- **User Authentication**: Register and login using Firebase Authentication.
- **Real-Time Messaging**: Leverages Firebase Firestore to sync messages in real-time.
- **Simple UI**: A user-friendly interface with a modern design.

## Technologies Used

- **Swift (UIKit)**
- **Firebase Authentication**
- **Firebase Firestore**
- **CocoaPods for Dependency Management**

## Project Structure and Code Explanation

1. **Authentication**:
   - Users can register and log in to the app using Firebase Authentication.
   - The app supports validation and error handling during the login and registration processes.
   ```swift
   func loginUser(email: String, password: String) {
       Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
           if let e = error {
               print(e.localizedDescription)
           } else {
               // Navigate to chat screen
           }
       }
   }
   ```

2. **Real-Time Chat**:
   - Messages are stored and retrieved from Firestore, allowing for real-time updates in the chat interface.
   - The chat screen is responsive and updates as new messages are sent or received.
   ```swift
   func loadMessages() {
       db.collection("messages").order(by: "timestamp").addSnapshotListener { querySnapshot, error in
           if let e = error {
               print("Error retrieving messages: \(e)")
           } else {
               // Update chat view with new messages
           }
       }
   }
   ```

## Project Output

Here are some screenshots showing the key features and output of the application:


   <h4>01). Main Screen</h4>
 <img src="https://github.com/MalingaBandara/FireChat-iOS/blob/main/main.png" width="25%" >


<h4>02). Register Screen</h4>
 <img src="https://github.com/MalingaBandara/FireChat-iOS/blob/main/reg.png" width="25%" >

<h4>03). Login Screen</h4>
 <img src="https://github.com/MalingaBandara/FireChat-iOS/blob/main/login.png" width="25%" >

<h4>04). Chat</h4>
<img src="https://github.com/MalingaBandara/FireChat-iOS/blob/main/%20Chat.png" width="25%" >




## How to Run the Project

1. Clone the repository:
   ```bash
   git clone https://github.com/MalingaBandara/FireChat-iOS.git
   ```
2. Open the project in Xcode.
3. Run `pod install` to install necessary dependencies.
4. Build and run the project on an iOS simulator or device.

## Purpose and Future Enhancements

The FireChat project was developed to demonstrate real-time chat functionality and Firebase integration in iOS apps. Future enhancements may include adding push notifications, group chat functionality, and user profile management.

## License

This project is licensed under the MIT License.
