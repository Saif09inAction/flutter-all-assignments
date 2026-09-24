# Dart Fundamentals

A collection of Dart programming assignments covering fundamental and advanced concepts, including variables, control flow, functions, null safety, asynchronous programming, and mock API handling.

---

# Assignment 1 — Dart Fundamentals

## 📚 Topics Covered

* Variables and Data Types
* `var`, `Object`, and `dynamic`
* `final` and `const`
* `int`, `double`, `String`, and `bool`
* String interpolation
* Runes and Unicode
* Lists, Sets, and Maps
* Type conversion
* Arithmetic and relational operators
* Logical and ternary operators
* Type testing and type casting
* Cascade and null-aware cascade
* Conditional statements
* Switch patterns
* Loops
* `break`, `continue`, and `assert`
* Functions and parameters
* Arrow functions
* Anonymous and first-class functions
* Closures
* Sound null safety
* `late` and `Never`
* Nullable and non-nullable types
* Null-aware operators
* Type promotion

## 🛠️ Technologies Used

* **Dart**
* **Dart SDK**
* **Visual Studio Code**

## ⚙️ Setup Instructions

1. Install the Dart SDK or Flutter SDK.
2. Verify the Dart installation:

```bash
dart --version
```

3. Navigate to the project directory.
4. Run any Dart file using:

```bash
dart run <filename>.dart
```

---

# Assignment 2 — Async API & Null Safety

## 🎯 Task

Build a Dart program using **null safety, Future, and async/await** to fetch and display mock API data while handling null and error cases.

## 📚 Concepts Covered

* `Future`
* `async` and `await`
* Null safety
* Nullable types using `?`
* Null-aware operators
* Null-coalescing operator `??`
* `try-catch` error handling
* Mock API simulation using `Future.delayed()`
* JSON-style data handling
* Asynchronous data fetching

## 🛠️ Technologies Used

* **Dart**
* **Dart SDK**
* **Visual Studio Code**

## 📂 File

```text
10_async_api_null_safety.dart
```

## ⚙️ How It Works

The program simulates an API request using `Future.delayed()` and returns mock user data.

The returned data contains:

* User ID
* User name
* Email
* Phone number

The email field is intentionally set to `null` to demonstrate Dart's null safety features.

The program uses `async/await` to handle the asynchronous operation and `try-catch` to handle possible errors.

## ▶️ Run the Program

```bash
dart run 10_async_api_null_safety.dart
```

## 💻 Sample Output

```text
Fetching user data...

--- User Data ---
ID: 101
Name: Saif
Email: Email not available
Phone: +91 9876543210
```

## 🔐 Null & Error Handling

The program uses the null-coalescing operator to provide a default value when data is unavailable:

```dart
user.email ?? 'Email not available'
```

Errors during the asynchronous operation are handled using:

```dart
try {
  ...
} catch (e) {
  ...
}
```

## 📸 Screenshots

### Assignment 1

Add screenshots of the Assignment 1 programs and their outputs here.

### Assignment 2

Add:

* Screenshot of the Dart code
* Screenshot of the terminal output
* Screenshot of the GitHub repository

---

## 👩‍💻 Author

**Saif**

GitHub: [Saif](https://github.com/Saif)
