# Assignment 6 - Product Listing App

This project is a simple Flutter application that shows a list of products and lets the user search products by name or category.

It is a beginner-friendly app built to understand how to:

- create a data model
- display data using a list
- filter data with a search field
- design a clean screen with Material widgets
- use `StatefulWidget` for dynamic behavior

---

## What this app does

When the app starts, it opens a screen titled "Product Listing".

The app contains a list of sample products such as:

- Laptop
- Smartphone
- Headphones
- Running Shoes
- Backpack
- Smart Watch
- Water Bottle

Each product has:

- a name
- a price
- a category

The user can type in the search box and the app will immediately filter the list.

For example:

- typing "Laptop" shows the laptop
- typing "Electronics" shows all electronic products
- typing something not found shows the message: "No products found"

---

## Main features

### 1. Product list
The app creates a list of product objects and displays them in a vertical list.

### 2. Search functionality
The search box uses `TextField` and listens to changes with `onChanged`.

When a user types:

- the app checks product name and category
- matching items are kept
- non-matching items are removed

### 3. Product cards
Each product is shown inside a `Card` with:

- product name
- category
- price
- first letter shown in a circle avatar

### 4. Empty state
If no item matches the search, the app shows a message:

- "No products found"

This makes the app user-friendly and easy to understand.

---

## App structure

The project is simple and mostly located in one file:

- `lib/main.dart` - contains the app logic, product data, search filter, and screen UI
- `pubspec.yaml` - contains project dependencies and Flutter package details

---

## Important code ideas

### Product model
A `Product` class is created with these properties:

- `name`
- `price`
- `category`

This class helps store product details in a structured way.

### Stateful widget
The app uses `StatefulWidget` because the list changes when the user searches.

The state class stores:

- all products
- filtered products

### Search logic
The `searchProducts` method does this:

1. takes the text entered by the user
2. converts it to lowercase
3. compares it with product names and categories
4. updates the visible list

---

## How the app works step by step

1. The app starts in `main()`.
2. `ProductApp` is created.
3. The `ProductListPage` screen is displayed.
4. A list of products is stored in memory.
5. The app shows all products at first.
6. As the user types in the search box, the list is filtered.
7. Matching product cards are displayed.
8. If no products match, a message is shown instead.

---

## Screenshots concept

The app looks like a clean mobile screen with:

- an app bar at the top
- a search bar below it
- product cards in a list format
- simple and modern Material Design styling

---

## Run this project

Open the project folder in the terminal and run:

```bash
flutter pub get
flutter run
```

If you are using VS Code, you can also run it from the Run and Debug section.

---

## Requirements

To run this app, you need:

- Flutter installed on your system
- Android/iOS emulator or a real device connected
- VS Code or Android Studio for development

---

## Learning goal of this assignment

This assignment helps students understand how to:

- work with custom classes in Dart
- manage state in Flutter
- create interactive UI
- use search and filtering in apps
- build a clean user interface with basic Material widgets

---

## Summary

This is a small but useful Flutter app that demonstrates how to build a product listing screen with a live search feature. It is a great example of how data can be displayed dynamically in mobile apps using Flutter.

If you are learning Flutter, this project is a good starting point for understanding lists, state management, and user input.
