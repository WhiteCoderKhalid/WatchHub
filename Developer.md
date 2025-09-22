# ⌚ WatchHub – Flutter E-Commerce App

![Flutter](https://img.shields.io/badge/Flutter-Framework-blue)
![Firebase](https://img.shields.io/badge/Firebase-Backend-orange)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📖 Overview
**WatchHub** is a sustainable and modular **Flutter e-commerce application** built with **Firebase**.  
It is designed for **watch lovers and businesses**, providing a smooth shopping experience with features like authentication, product browsing, cart, checkout, and order tracking.

---

## 🚀 Features
- 👤 **Authentication** – Sign up, Sign in, Forgot Password  
- 🏠 **Home & Categories** – Browse products with filters and search  
- 🛒 **Cart & Wishlist** – Add, remove, and manage products  
- 💳 **Checkout & Orders** – Place and track orders  
- 📩 **Notifications** – Stay updated  
- ⚙️ **Profile & Settings** – Manage account, theme toggle  
- 📜 **Help Center & Policies** – Privacy, Terms, Support  

---
## 🏛️ Project Structure
lib/
├── controllers/
│   ├── auth_controller.dart
│   ├── navigation_controller.dart
│   └── theme_controller.dart
├── features/
│   ├── checkOut/
│   ├── editProfile/
│   ├── helpcenter/
│   ├── myOrder/
│   ├── notifications/
│   ├── orderConfirmation/
│   ├── privacy/
│   ├── shipping/
│   └── termsOfService/
├── models/
│   └── view/
│       └── products.dart
├── services/
│   ├── firebase_auth_service.dart
│   └── firebase_service.dart
├── utils/
│   ├── app_textstyle.dart
│   └── app_theme.dart
├── view/
│   ├── account_screen.dart
│   ├── allProduct_screen.dart
│   ├── cart_screen.dart
│   ├── categories_screen.dart
│   ├── custom_textfields.dart
│   ├── custom_buttons.dart
│   ├── customSearch.dart
│   ├── filterBottomS.dart
│   ├── forgotpassword_screen.dart
│   ├── home_screen.dart
│   ├── main_screen.dart
│   ├── onboarding_screen.dart
│   ├── productCard.dart
│   ├── productDetail_screen.dart
│   ├── productGrid.dart
│   ├── salesBanner_screen.dart
│   ├── setting_screen.dart
│   ├── shopping_screen.dart
│   ├── signin_screen.dart
│   ├── signUp_screen.dart
│   ├── sizeSelector_screen.dart
│   ├── wishlist_screen.dart
└── widget/
│   └── splash_screen.dart
├── firebase_options.dart
└── main.dart

yaml
name: watch_app
description: "A new Flutter project."
# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: 'none' # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: ^3.8.1

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  flutter:
    sdk: flutter

  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.8
  google_fonts: ^6.2.1
  get: ^4.6.6
  get_storage: ^2.1.1
  share_plus: ^10.1.2 
  lottie: ^3.1.2
  firebase_core: ^4.1.0
  firebase_auth: ^6.0.2
  cloud_firestore: ^6.0.1  

dev_dependencies:
  flutter_test:
    sdk: flutter

  # The "flutter_lints" package below contains a set of recommended lints to
  # encourage good coding practices. The lint set provided by the package is
  # activated in the `analysis_options.yaml` file located at the root of your
  # package. See that file for information about deactivating specific lint
  # rules and activating additional ones.
  flutter_lints: ^5.0.0

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec

# The following section is specific to Flutter packages.
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/images/
    - assets/animations/
  #   - images/a_dot_ham.jpeg

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/to/resolution-aware-images

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/to/asset-from-package

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/to/font-from-package


---

## 🛠️ Tech Stack
- **Frontend:** Flutter (Dart)  
- **Backend:** Firebase (Auth, Firestore, Storage)  
- **State Management:** GetX / Provider  
- **Design:** Material 3 + Custom Theme  

---

## ⚙️ Installation & Setup

### 1️⃣ Prerequisites
- Flutter SDK (latest stable) → [Install Flutter](https://docs.flutter.dev/get-started/install)  
- Dart SDK (comes with Flutter)  
- Firebase Project → [Setup Firebase](https://firebase.google.com/docs/flutter/setup)  

### 2️⃣ Clone Repository
```bash
git clone https://github.com/your-username/watchhub.git
cd watchhub
3️⃣ Install Dependencies
bash
Copy code
flutter pub get
4️⃣ Setup Firebase
Add your google-services.json (Android) in /android/app/

Add your GoogleService-Info.plist (iOS) in /ios/Runner/

Ensure firebase_options.dart is properly generated

5️⃣ Run App
bash
Copy code
flutter run
🧪 Testing
Run unit & widget tests:

bash
Copy code
flutter test
📦 Build APK
bash
Copy code
flutter build apk --release
The APK will be generated in:

swift
Copy code
/build/app/outputs/flutter-apk/app-release.apk
🌍 Sustainability Practices
🧩 Feature-first modular structure

🎨 Single source of truth for theming

♻️ Reusable widgets (buttons, cards, textfields)

🔒 Firebase Security Rules for safe data

🔮 Future Enhancements
🌙 Dark mode toggle

💳 Payment Integration (Paystack/Stripe)

🔔 Push Notifications

📶 Offline Support (Hive/SQLite)

🤖 AI-based product recommendations

🤝 Contributing
Fork this repo

Create a new branch (feature/new-feature)

Commit your changes

Push and open a Pull Request 🚀

📜 License
This project is licensed under the MIT License – see the LICENSE file for details.

👨‍💻 Acknowledgment
Thanks to:

Flutter & Firebase communities 💙

Aptech mentors & peers 🎓

Open-source contributors 🌍

✨ Happy Coding with WatchHub ⌚


