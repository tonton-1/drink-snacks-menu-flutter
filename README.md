# Drink & Snacks Menu App (Flutter)

A modern and interactive Drink & Snacks Menu application built with Flutter. The app allows users to browse through a selection of beverages (Must Try & New Arrivals), view detailed ingredients, manage item quantities, and preview their cart total. It also features a fully functional Light and Dark mode theme that saves user preferences locally.

## 📱 Features

- **Light/Dark Theme Support:** Users can toggle between light and dark modes via the side navigation drawer. The chosen theme is persisted locally using `shared_preferences`, so the app remembers the setting even after a restart.
- **New Arrival Section:** A horizontal scrollable list displaying the latest seasonal or highlighted drinks.
- **Must Try Menu:** A vertical scrolling list featuring core menu items along with their pricing and a quick "add to cart" quantity selector.
- **Interactive Item Details:** Tapping on any drink triggers a smooth slide-up dialog (Bottom Sheet style) displaying comprehensive details about the drink, including:
  - High-quality image
  - Full description
  - Cup size and Type (Hot, Iced, Blended)
  - Sugar-level info / Dietary tags
  - Specific ingredients list
- **Cart System:** Users can adjust the quantity of each drink using the `+` and `-` buttons. The app dynamically calculates the total quantity and overall price, updating the floating cart summary at the bottom of the screen.

## 🛠️ Project Structure

The source code in the `lib/` directory is logically separated into different components for maintainability:

- **`main.dart`**: The core entry point of the application. It handles the `MaterialApp` configuration, Light/Dark theme setups, the side drawer, and the main screen layout (combining the "Must Try" list and the Cart). It also contains the `showGeneralDialog` logic for the detailed item view.
- **`recommend.dart`**: Contains the `RecommendDrinks` widget. It renders the "New Arrival" horizontal scrolling list and its underlying data mockups.
- **`quantityselector.dart`**: A reusable stateful widget (`QuantitySelector`) responsible for the `+` and `-` buttons on the menu list. It calculates the individual item quantity and passes updates back to the main cart state.
- **`drinkcarts.dart`**: Contains the `DrinksCart` widget which acts as a sticky bottom bar displaying the `Total Price` and a `Next` button based on the user's selections.

## 📦 Dependencies

The app relies on the following major packages (as seen in `pubspec.yaml`):

- `flutter` (SDK)
- `shared_preferences: ^2.5.3` - Used for saving and loading the user's Light/Dark mode choice.
- `cupertino_icons: ^1.0.8`

## 🚀 How It Works

1. **State Management**: The app primarily relies on standard Flutter `StatefulWidget` to manage the UI state. When the quantity of a drink changes in `quantityselector.dart`, a callback function updates the `totalQuantity` and `totalPrice` in the parent `main.dart` state, triggering a UI rebuild for the cart.
2. **Theming**: Two main `ThemeData` variables (`lightTheme` and `darkTheme`) are defined in `main.dart`. The scaffold colors, text themes, and app bar colors are meticulously swapped based on a simple boolean flag `isDarkMode`.
3. **Animations**: The detail view utilizes a custom `PageRouteBuilder` via `showGeneralDialog` combined with a `SlideTransition` to create a premium bottom-up sliding animation rather than a standard alert dialog.
