# SpicyPickles E-Commerce App 🍴

**SpicyPickles** is a modern e-commerce application built using **Flutter**, designed to provide users with a seamless experience in exploring and purchasing a wide range of pickles. With a clean and intuitive interface, the app combines beautiful UI with robust functionality powered by the **BLoC pattern** and **Clean Architecture** principles.

---

## Key Features
- **Splash Screen**: A visually appealing introduction to the app, setting the tone for a great user experience.
- **Home Screen**: Explore featured pickles, top deals, and exciting offers right on the homepage.
- **Product or Items List**: Browse through a variety of pickles, filter by category, and discover new flavors.
- **Product Details**: Dive into the specifics of each product, including descriptions, pricing, reviews, and recommendations.
- **Profile Screen**: Manage personal details, view order history, and access preferences in a well-organized profile section.

---

## Tech Stack
- **Frontend**: Flutter (Dart)
- **State Management**: BLoC (Business Logic Component)
- **Architecture**: Clean Architecture for modularity and scalability
- **Storage**: SQLite or any preferred local storage (e.g., Hive)
- **Backend**: (Optional - Appwrite, Firebase, or custom backend integration)

---

## Folder Structure
The app is organized using Clean Architecture principles with the following structure:
```
lib/
├── core/                # Shared resources like themes, utilities, constants
├── features/            # Each screen or module is a feature
│   ├── splash/
│   ├── home/
│   ├── product_list/
│   ├── product_details/
│   ├── profile/
├── app/                 # App-level setup (routes, main app widget)
```

---

## Highlights
- **Scalable Codebase**: Modular design ensures scalability as new features are added.
- **Reusable Components**: Core utilities and widgets shared across the app.
- **Smooth User Experience**: Designed with a focus on speed and responsiveness.
- **Custom Pickle Categories**: Showcasing a variety of pickle options tailored to user preferences.

---

## Future Enhancements
- Implementing **payment integration** for seamless checkout.
- Adding a **wishlist feature** for favorite products.
- Enabling **push notifications** for exclusive offers and updates.
- Expanding backend integration with analytics for tracking user preferences.

---

## Folder Structure
The app is organized using Clean Architecture principles with the following structure:

```
lib/
├── core/
│   ├── constants/       # App-wide constants (e.g., colors, fonts, API endpoints)
│   ├── utils/           # Utilities like formatters, validators, helpers
│   ├── error/           # Custom error handling classes
│   ├── theme/           # App-wide theme data
│   ├── widgets/         # Reusable widgets across the app
├── features/
│   ├── splash/
│   │   ├── presentation/
│   │   │   ├── bloc/    # BLoC for Splash Screen
│   │   │   ├── pages/   # Splash Screen UI
│   │   ├── data/        # Data sources or repositories for Splash (if any)
│   │   ├── domain/      # Entities and use cases for Splash (if any)
│   ├── home/
│   │   ├── presentation/
│   │   │   ├── bloc/    # BLoC for Home Screen
│   │   │   ├── pages/   # Home Screen UI
│   │   ├── data/        # Data sources or repositories for Home
│   │   ├── domain/      # Entities and use cases for Home
│   ├── product_list/
│   │   ├── presentation/
│   │   │   ├── bloc/    # BLoC for Product List Screen
│   │   │   ├── pages/   # Product List Screen UI
│   │   ├── data/        # Data sources or repositories for Product List
│   │   ├── domain/      # Entities and use cases for Product List
│   ├── product_details/
│   │   ├── presentation/
│   │   │   ├── bloc/    # BLoC for Product Details Screen
│   │   │   ├── pages/   # Product Details Screen UI
│   │   ├── data/        # Data sources or repositories for Product Details
│   │   ├── domain/      # Entities and use cases for Product Details
│   ├── profile/
│   │   ├── presentation/
│   │   │   ├── bloc/    # BLoC for Profile Screen
│   │   │   ├── pages/   # Profile Screen UI
│   │   ├── data/        # Data sources or repositories for Profile
│   │   ├── domain/      # Entities and use cases for Profile
├── app/
│   ├── router.dart      # App-wide navigation or routing setup
│   ├── app.dart         # Main App Widget
│   ├── main.dart        # Entry Point of the Application
```

### Explanation:
1. **`core/`**  
   Contains reusable components shared across multiple features, like constants, theme data, and utility functions.

2. **`features/`**  
   Each screen is treated as a feature with its own submodules:
    - `presentation/`: Handles UI (`pages`) and state management (`bloc`).
    - `data/`: Handles data sources (e.g., API, local DB) and repositories.
    - `domain/`: Contains entities and use cases for business logic.

3. **`app/`**  
   Handles app-level configurations such as navigation (`router.dart`) and the root widget (`app.dart`).

### Benefits:
- **Scalability**: Adding new screens or features is straightforward.
- **Maintainability**: Each feature is modular, making it easier to debug and test.
- **Separation of Concerns**: Keeps business logic, UI, and data sources decoupled.
