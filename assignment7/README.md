# Assignment 7

A Flutter registration app built as a simple form-based workflow with validation and a confirmation screen.

## Overview

This project demonstrates a basic multi-screen registration flow:

- Welcome screen with a call-to-action button
- Registration form with input validation
- Success screen showing submitted user details
- Navigation using named routes

## Features

- User-friendly home screen
- Form fields for name, phone, email, and password
- Validation for required fields and email/password rules
- Confirmation page displaying the entered information
- Clean Material 3 styling

## Project Structure

- `lib/main.dart` — app logic, screens, routes, and validation

## Prerequisites

Before running the app, make sure you have Flutter installed and configured:

- Flutter SDK
- An emulator or physical device connected
- VS Code or Android Studio (optional, for development)

## Getting Started

1. Open the project directory:
   ```bash
   cd assignment7
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## App Flow

1. Launch the app and open the home screen.
2. Tap "Register Now".
3. Fill in the form and submit.
4. Review the saved details on the confirmation page.

## Notes

The app uses Flutter named routes to move between:

- `/` → Home screen
- `/form` → Registration form
- `/detail` → Confirmation details screen

This project is intended as a beginner-friendly example of form handling and screen navigation in Flutter.
