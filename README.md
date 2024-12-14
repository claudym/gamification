# Gamification App

## Overview

Gamification is a Flutter application designed to enhance employee engagement and provide rewards. This app uses modern Flutter frameworks and Firebase services to deliver a seamless experience for users. The modular architecture ensures that the application is scalable and maintainable.

---

## Features

- **Employee Engagement**: Tools to improve collaboration and motivation within teams.
- **Reward System**: Recognize and reward employees for their achievements.
- **Push Notifications**: Keep users informed with real-time updates.
- **Localization**: Support for multiple languages.
- **Secure and Efficient**: Implements secure authentication and optimized performance.

---

## Project Structure

The app follows a modular architecture for scalability and maintainability:

```
lib/
├── l10n/          # Localization and internationalization
├── models/        # Data models
├── providers/     # State management (using Provider)
├── screens/       # UI screens
├── services/      # Business logic and APIs
├── utils/         # Utilities and helper functions
├── widgets/       # Reusable UI components
├── main.dart      # App entry point
└── routes.dart    # Navigation and route configuration
```

---

## Getting Started

### Prerequisites

- Flutter SDK: `>=3.0.0 <4.0.0`
- Dart: Compatible with Flutter 3.0 or higher

### Installation

1. Clone the repository:
   ```bash
   git clone <repository_url>
   ```
2. Navigate to the project directory:
   ```bash
   cd gamification
   ```
3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Ensure you have the necessary Firebase configuration files (e.g., `google-services.json` for Android and `GoogleService-Info.plist` for iOS).

---

## Dependencies

The app uses the following packages:

- **State Management**: `provider`
- **Authentication**: `firebase_auth`
- **Backend Services**: `firebase_core`, `cloud_firestore`, `cloud_functions`
- **Push Notifications**: `firebase_messaging`
- **Local Storage**: `shared_preferences`
- **Localization**: `flutter_localizations`, `intl`
- **HTTP Requests**: `http`
- **Device Info**: `device_info_plus`

---

## Development

### Running the App

1. Connect a physical device or start an emulator.
2. Run the app:
   ```bash
   flutter run
   ```

### Testing

Run the test suite:

```bash
flutter test
```

### Building for Release

To build the app for production:

```bash
flutter build apk  # For Android
flutter build ios  # For iOS
```

---

## Modular Architecture Benefits

1. **Scalability**: Easy to add new features or modules without disrupting existing code.
2. **Maintainability**: Clear separation of concerns ensures that each module has a single responsibility.
3. **Reusability**: Common components are isolated and can be reused across the app.

---

## Firebase Setup

1. Set up a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
2. Download the configuration files and place them in the appropriate directories:
   - `android/app/google-services.json`
   - `ios/Runner/GoogleService-Info.plist`
3. Ensure the Firebase services required for the app are enabled (e.g., Firestore, Authentication).

---

## Localization

The app includes support for multiple languages using Flutter's localization framework. To add a new language:

1. Update the `l10n` folder with the new `.arb` files.
2. Regenerate the localization classes:
   ```bash
   flutter pub run intl_utils:generate
   ```
3. Update the UI to include the new translations.

---

## Contributors

- **Software Architec**: Claudy Mejia
- **Developer**: Marcos Lora
- **UI/UX Designer**: Nelson Lora
- **QA Engineer**: Nelson Lora

Feel free to contribute! Fork the repository and submit a pull request with your changes.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.

---

## Contact

For questions or support, please reach out to:

- Email: claudym
- GitHub: https://github.com/claudym/gamification

---
