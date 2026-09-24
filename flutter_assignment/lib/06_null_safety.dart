class UserProfile {
  // 1. late Keyword

  late String bio;

  void initBio() {
    bio = "Developer from NYC";
  }
}

// 2. Never Type

Never throwFatalError(String msg) {
  throw Exception("Fatal Error: $msg");
}

void main() {
  // 3. Non-Nullable vs Nullable Types

  int nonNullable = 10;
  int? nullableVal = null;

  print("Non-nullable value: $nonNullable");
  print("Nullable value: $nullableVal");

  // 4. If-Null Operator (??) & Null-Aware Assignment (??=)

  int result = nullableVal ?? 0;

  print("Result using ??: $result");

  nullableVal ??= 5;

  print("Nullable value after ??=: $nullableVal");

  // 5. Null-Aware Access (?.) & Bang Operator (!)

  String? text;

  print("Text length: ${text?.length}");

  text = "Dart";

  print("Text length using !: ${text!.length}");

  // 6. Type Promotion

  Object data = "Smart Cast";

  if (data is String) {
    // data is automatically promoted from Object to String
    print(data.toUpperCase());
  }

  // late keyword demonstration

  UserProfile user = UserProfile();

  user.initBio();

  print("Bio: ${user.bio}");

  // Never function is defined above but not called,
  // because calling it would intentionally throw an exception.
}