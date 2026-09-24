void main() {
  // 1. var Keyword
  var cityName = "Tokyo";

  print("City: $cityName");
  print("Runtime Type: ${cityName.runtimeType}");

  // 2. Object vs dynamic

  Object objVal = 42;

  // Object does not allow calling arbitrary methods directly.
  // Uncommenting the line below will cause a compile-time error:
  // objVal.nonExistentMethod();

  dynamic dynVal = "Hello";

  print("Dynamic value: $dynVal");

  dynVal = 100;

  // Calling toUpperCase() on an int causes a runtime error.
  // We use try-catch so the rest of the program can continue.
  try {
    print(dynVal.toUpperCase());
  } catch (e) {
    print("Runtime Error: $e");
  }

  // 3. final vs const

  final DateTime currentTime = DateTime.now();

  const double piValue = 3.14159;

  print("Current Time: $currentTime");
  print("Pi Value: $piValue");

  // final can be assigned at runtime, so DateTime.now() is allowed.
  // const must be known at compile time, so DateTime.now() cannot be const.

  // 4. int & double

  int age = 25;
  double temperature = 98.6;

  print("Age: $age");
  print("Temperature: $temperature");
  print("Age divided by 2: ${age / 2}");

  // 5. String & Interpolation

  String firstName = "Ada";
  String lastName = "Lovelace";

  String fullName = "$firstName $lastName";

  print("User: $fullName (Length: ${fullName.length})");

  // 6. bool

  bool isLoggedIn = false;

  print("Before toggle: $isLoggedIn");

  isLoggedIn = !isLoggedIn;

  print("After toggle: $isLoggedIn");

  // 7. Runes & UTF-32

  String emoji = "🎯";

  print("Emoji: $emoji");
  print("Code Units: ${emoji.codeUnits}");
  print("Runes: ${emoji.runes}");
}