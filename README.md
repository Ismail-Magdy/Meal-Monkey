# Meal Monkey - Food Delivery UI

A fully-featured, pixel perfect mobile user interface for an on-demand food delivery platform, built entirely with Flutter and Dart. This project is strictly a **UI/Frontend implementation** - it does not include a backend, database, or live API integrations. It was created as the developer's **first large scale project**, serving as a comprehensive learning and practice exercise for applying real world mobile UI development skills at scale.

The application replicates a production grade food delivery experience across 20+ screens, covering the complete user journey from onboarding and authentication through restaurant browsing, order management, checkout, and profile customization.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Key Features](#key-features)
- [Screenshots](#screenshots)
- [Project Architecture](#project-architecture)
- [Technologies Used](#technologies-used)
- [Dependencies](#dependencies)
- [Installation and Setup](#installation-and-setup)
- [Folder Structure](#folder-structure)
- [Disclaimer](#disclaimer)
- [License](#license)

---

## Project Overview

Meal Monkey simulates a complete food delivery application interface where users can browse restaurants, explore menu categories, view item details with ratings, manage orders, and proceed through a full checkout flow. The entire application is driven by static, locally defined data models no network calls fetch live data in the current implementation, with the exception of the Google Maps integration on the Change Address screen.

The project was deliberately scoped to focus exclusively on:

- Translating complex UI/UX designs into production quality Flutter code
- Building a scalable, feature-based project architecture from scratch
- Working with responsive layouts, custom components, and adaptive screen sizing
- Handling multi screen navigation flows with proper widget lifecycle management

---

## Key Features

### Onboarding and Authentication

- **Animated Logo Splash Screen** - An initial branded splash screen with the application logo
- **Multi-Page Onboarding Walkthrough** - A three step PageView-based introduction showcasing core value propositions (food discovery, fast delivery, live tracking) with smooth page transitions and dot indicators
- **Welcome Screen** - A branded landing page with Login and Create Account entry points
- **Login Screen** - Email and password form with validation, social login buttons (Facebook and Google), forgot password link, and sign-up redirect
- **Sign-Up Screen** - Full registration form for new user accounts
- **Forgot Password Flow** - A Reset Password screen leading to OTP verification with a pin input field, followed by a New Password screen

### Home and Discovery

- **Home Feed** - A rich, scrollable home screen featuring:
  - Current delivery location display with a dropdown selector
  - Rounded search bar for food search
  - Horizontally scrollable cuisine category chips (Offers, Sri Lankan, Italian, Indian)
  - "Popular Restaurants" section with full-width image cards, star ratings, rating counts, and cuisine type labels
  - "Most Popular" section with a horizontally scrollable card carousel
  - "Recent Items" section with compact list-tile style cards that navigate to item detail views

### Item Details

- **Detailed Item View** - A comprehensive item detail screen featuring a large hero image, item name, star rating bar (using flutter_rating_bar), portion size selector, ingredient list, nutritional info display, price, and quantity controls with an "Add to Cart" action

### Menu Browsing

- **Menu Categories Screen** - A visually distinctive layout with an orange vertical accent bar and stacked, overlapping category cards (Food, Beverages, Desserts, Promotions) each displaying item counts
- **Dessert Sub-Menu Screen** - A dedicated subcategory listing with dessert items displayed as cards with images, names, ratings, and cuisine type indicators
- **Dessert Detail Screen** - A full detail view for individual dessert items with the same level of detail as the main item detail screen

### Offers

- **Latest Offers Screen** - A dedicated offers feed with promotional text, a "Check Offers" action button, and a vertically scrollable list of offer cards with restaurant images, names, star ratings, rating counts, and cuisine labels

### Profile Management

- **Profile Screen** - Editable user profile with:
  - Profile photo display using BLoC state management (ImageStorageCubit)
  - Image picker integration for selecting a new profile photo from the device gallery
  - Profile image persistence across sessions via SharedPreferences
  - Editable form fields for name, email, phone number, address, password, and password confirmation
  - Save action button

### Order Management

- **My Order Screen** - Displays a full order summary from a specific restaurant (e.g., King Burgers) including restaurant info with logo, star rating, cuisine type, and location, followed by an itemized order list with individual prices, delivery instructions section, sub-total, delivery cost, and grand total, with a "Checkout" button

### Checkout Flow

- **Checkout Screen** - A structured checkout process with:
  - Delivery address display with a "Change" option navigating to the address screen
  - Payment method selection (Cash on Delivery, Visa, PayPal) with radio button indicators
  - "Add Card" bottom sheet modal for entering new payment card details
  - Order cost summary (sub-total, delivery cost, discount, total)
  - "Send Order" button triggering an order confirmation bottom sheet

### Address Management

- **Change Address Screen** - An interactive Google Maps integration featuring:
  - Real-time user geolocation with permission handling
  - Custom map markers with labeled pins
  - Search bar with Google Places Autocomplete suggestions
  - Location search via Geocoding API
  - "My Location" floating action button for re-centering
  - "Choose a saved place" option

### Additional Screens (More Tab)

- **Payment Details Screen** - Displays saved payment methods
- **Notifications Screen** - A list of notification items with timestamps, alternating row backgrounds, and status indicators
- **Inbox Screen** - A messaging-style inbox listing promotional messages with dates, descriptions, and star icons
- **About Us Screen** - Informational content sections with bullet-point markers

### Navigation

- **Glass Bottom Navigation Bar** - A five-tab bottom navigation system with a frosted-glass visual effect (Menu, Offer, Home, Profile, More) using the glass_bottom_navigation_bar package, with haptic feedback enabled and PageStorage for preserving scroll states

### Reusable Component Library

The project includes a comprehensive library of 12 custom reusable widgets:

- `CustomAppBar` - Standard app bar with title and cart icon
- `CustomAppBarWithArrow` - App bar with a back navigation arrow
- `CustomAppBarWithoutCart` - Simplified app bar variant without the cart icon
- `CustomButton` - Configurable primary action button (rounded and sharp variants)
- `CustomContainerWithStack` - Stack-based navigation card with image, title, and optional badge
- `CustomIconButton` - Social login button with icon and label
- `CustomMenuCard` - Overlapping menu category card with image, name, and item count
- `CustomNavigation` - Navigation helper widget
- `CustomPaymentCard` - Payment method card with icon, label, and radio selection
- `CustomTextField` - Styled text input field with validation
- `CustomTitleTextField` - Labeled text field with title header and optional password toggle
- `CustomTwoText` - Section header row with left-aligned title and right-aligned action text

---

## Screenshots

### Onboarding and Authentication

| Screen           | Preview                                               |
| ---------------- | ----------------------------------------------------- |
| Logo Splash      | ![Logo Splash](screenshots/logo_splash.png)           |
| Onboarding       | ![Onboarding](screenshots/onboarding.png)             |
| Welcome          | ![Welcome](screenshots/welcome.png)                   |
| Login            | ![Login](screenshots/login.png)                       |
| Sign Up          | ![Sign Up](screenshots/sign_up.png)                   |
| Reset Password   | ![Reset Password](screenshots/reset_password.png)     |
| OTP Verification | ![OTP Verification](screenshots/otp_verification.png) |
| New Password     | ![New Password](screenshots/new_password.png)         |

### Core Screens

| Screen           | Preview                                              |
| ---------------- | ---------------------------------------------------- |
| Home             | ![Home](screenshots/home.png)                        |
| Item Details     | ![Item Details](screenshots/item_details.png)        |
| Menu Categories  | ![Menu Categories](screenshots/menu_categories.png)  |
| Dessert Sub-Menu | ![Dessert Sub-Menu](screenshots/dessert_submenu.png) |
| Dessert Detail   | ![Dessert Detail](screenshots/dessert_detail.png)    |
| Latest Offers    | ![Latest Offers](screenshots/latest_offers.png)      |

### Profile, Orders, and Checkout

| Screen                  | Preview                                                   |
| ----------------------- | --------------------------------------------------------- |
| Profile                 | ![Profile](screenshots/profile.png)                       |
| My Order                | ![My Order](screenshots/my_order.png)                     |
| Checkout                | ![Checkout](screenshots/checkout.png)                     |
| Add Card (Bottom Sheet) | ![Add Card](screenshots/add_card.png)                     |
| Order Confirmation      | ![Order Confirmation](screenshots/order_confirmation.png) |

### Additional Screens

| Screen               | Preview                                             |
| -------------------- | --------------------------------------------------- |
| More Menu            | ![More Menu](screenshots/more_menu.png)             |
| Change Address (Map) | ![Change Address](screenshots/change_address.png)   |
| Payment Details      | ![Payment Details](screenshots/payment_details.png) |
| Notifications        | ![Notifications](screenshots/notifications.png)     |
| Inbox                | ![Inbox](screenshots/inbox.png)                     |
| About Us             | ![About Us](screenshots/about_us.png)               |

---

## Project Architecture

The project follows a **feature-first architecture** with a clear separation between shared core modules and self-contained feature modules:

```
lib/
|-- main.dart                     # Application entry point
|-- meal_monkey.dart              # Root widget (MaterialApp, ScreenUtil, BLoC providers)
|
|-- core/                         # Shared, cross-feature modules
|   |-- helpers/                  # Utility functions (spacing helpers)
|   |-- logic/                    # Global state management
|   |   |-- bloc/                 # BLoC pattern classes
|   |   |-- cubit/                # Cubit classes (ImageStorageCubit)
|   |-- models/                   # Shared data models
|   |-- themes/                   # App-wide theming (AppColors)
|   |-- widgets/                  # Reusable custom widget library
|
|-- features/                     # Self-contained feature modules
    |-- splashs/                  # Logo, onboarding, and welcome screens
    |-- login/                    # Login screen and auth widgets
    |-- sign_up/                  # Registration screen and widgets
    |-- forgot_password/          # Password reset and new password screens
    |-- otp/                      # OTP verification screen
    |-- root/                     # Root scaffold with bottom navigation
    |-- home/                     # Home feed and item details
    |-- menu/                     # Menu categories, sub-menus, and item details
    |-- offers/                   # Offers listing screen
    |-- profile/                  # User profile management
    |-- last_screens/             # More tab screens (orders, checkout, address,
                                  #   notifications, inbox, payment, about us)
```

---

## Technologies Used

| Technology                            | Purpose                                      |
| ------------------------------------- | -------------------------------------------- |
| **Flutter** (SDK ^3.9.0)              | Cross-platform UI framework                  |
| **Dart**                              | Programming language                         |
| **BLoC / Cubit** (flutter_bloc, bloc) | State management pattern                     |
| **flutter_screenutil**                | Responsive screen adaptation and sizing      |
| **flutter_svg**                       | SVG asset rendering                          |
| **flutter_rating_bar**                | Interactive star rating widget               |
| **image_picker**                      | Device gallery image selection               |
| **shared_preferences**                | Lightweight local key-value persistence      |
| **google_maps_flutter**               | Google Maps integration                      |
| **geolocator**                        | Device geolocation services                  |
| **custom_map_markers**                | Custom-styled map marker widgets             |
| **dio**                               | HTTP client (for Google Places API calls)    |
| **glass_bottom_navigation_bar**       | Frosted-glass bottom navigation bar          |
| **otp_pin_field**                     | OTP pin code input widget                    |
| **equatable**                         | Value equality for BLoC states               |
| **Metropolis (Custom Font)**          | Custom typography throughout the application |

---

## Dependencies

Full dependency list from `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_screenutil: ^5.9.3
  otp_pin_field: ^1.3.1
  flutter_svg: ^2.2.1
  flutter_rating_bar: ^4.0.1
  image_picker: ^1.2.0
  bloc: ^9.0.0
  flutter_bloc: ^9.1.1
  shared_preferences: ^2.5.3
  equatable: ^2.0.7
  flutter_localization: ^0.3.3
  responsive_builder: ^0.7.1
  google_maps_flutter: 2.12.1
  custom_map_markers: ^0.0.2+1
  geolocator: ^14.0.2
  http: ^1.5.0
  dio: ^5.9.0
  glass_nav_bar: ^0.0.5
  glass_bottom_navigation_bar: ^0.0.4

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0
  flutter_launcher_icons: ^0.13.1
```

---

## Installation and Setup

### Prerequisites

- Flutter SDK (version 3.9.0 or higher)
- Dart SDK (bundled with Flutter)
- Android Studio or VS Code with Flutter/Dart plugins
- An Android emulator, iOS simulator, or a physical device

### Steps

1. **Clone the repository**

   ```bash
   git clone https://github.com/Ismail-Magdy/Meal-Monkey.git
   cd Meal-Monkey
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Configure Google Maps API Key (optional)**

   The Change Address screen uses the Google Maps SDK. To enable full map functionality:
   - Obtain a Google Maps API key from the [Google Cloud Console](https://console.cloud.google.com/)
   - **Android:** Add your key to `android/app/src/main/AndroidManifest.xml` inside the `<application>` tag:
     ```xml
     <meta-data
         android:name="com.google.android.geo.API_KEY"
         android:value="YOUR_API_KEY_HERE"/>
     ```
   - **iOS:** Add your key to `ios/Runner/AppDelegate.swift`
   - Update the `apiKey` constant in `lib/features/last_screens/change_screen_address.dart`

   > **Note:** The application runs fully without a Maps API key. Only the address change screen requires it for live map and search functionality.

4. **Run the application**

   ```bash
   flutter run
   ```

5. **Build for release (optional)**

   ```bash
   flutter build apk        # Android
   flutter build ios         # iOS
   ```

---

## Folder Structure

```
meal_monkey/
|-- android/                  # Android platform-specific code
|-- ios/                      # iOS platform-specific code
|-- assets/
|   |-- fonts/                # Metropolis font family (Regular, Medium, SemiBold, Bold, ExtraBold)
|   |-- images/               # PNG image assets (icons, illustrations, food images)
|   |-- svgs/                 # SVG vector assets (star icons, indicators)
|-- lib/                      # Dart source code (see Project Architecture above)
|-- test/                     # Unit and widget test directory
|-- pubspec.yaml              # Project configuration and dependencies
|-- analysis_options.yaml     # Dart analyzer and lint rules
```

---

## Disclaimer

This project is a **UI-only implementation** created for educational and portfolio purposes. It does not include:

- Backend server or API infrastructure
- Database or persistent data storage (beyond SharedPreferences for the profile image path)
- Real authentication or user session management
- Live payment processing
- Real-time order tracking

All data displayed throughout the application (restaurant listings, menu items, order details, notifications, inbox messages) is statically defined within the Dart source files using local model objects.

---

## License

This project is open source and available for educational reference.
