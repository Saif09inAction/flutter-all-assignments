# Assignment 8

A Flutter app that fetches posts from a public API and stores them in local cache using `shared_preferences` so the app can show previously loaded data when the network is unavailable.

## Overview

This project demonstrates how to:

- fetch JSON data from an external API
- parse the response into Dart model objects
- cache data locally on the device
- fall back to cached data when the API request fails
- display a simple list of posts with a refresh action

## Features

- API request to JSONPlaceholder
- Local caching using `shared_preferences`
- Offline fallback behavior
- Refresh button to reload data
- Material design UI with an SVG header
- Error state when there is no internet and no cached data

## Project Structure

- `lib/main.dart` — app logic, API client, cache logic, and UI
- `assets/api_logo.svg` — app header icon
- `test/widget_test.dart` — basic widget smoke test

## Prerequisites

Make sure Flutter is installed and configured:

- Flutter SDK
- Emulator, simulator, or browser enabled for testing

## Getting Started

1. Open the project folder:
   ```bash
   cd assignment8
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## App Behavior

- On launch, the app tries to fetch the latest posts from the API.
- If the request succeeds, the results are saved locally.
- If the request fails, the app loads cached posts if available.
- If no cached content exists, it shows an error message.

## Dependencies

This project uses:

- `flutter`
- `http`
- `shared_preferences`
- `flutter_svg`

This app is a beginner-friendly example of API integration and simple data caching in Flutter.
