// 1. Positional, Optional, Named, & Default Parameters

void buildUser(
  String id, {
  required String username,
  String role = "guest",
}) {
  print("ID: $id, User: $username, Role: $role");
}

// 2. Arrow Function

int square(int n) => n * n;

// 3. First-Class Functions & Anonymous Functions

void executeAction(Function action) {
  action();
}

// 4. Lexical Closures

int Function(int) makeAdder(int addBy) {
  return (int i) => i + addBy;
}

void main() {
  // Calling buildUser with required parameters

  buildUser(
    "101",
    username: "Alex",
  );

  buildUser(
    "102",
    username: "John",
    role: "admin",
  );

  // Arrow function

  print("Square of 5: ${square(5)}");

  // Anonymous function

  executeAction(() {
    print("Executing...");
  });

  // Closure

  final add5 = makeAdder(5);

  print("10 + 5 = ${add5(10)}");
}