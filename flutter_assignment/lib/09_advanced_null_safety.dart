// 1. Sound Null Safety & Late Initialization Lifecycle
class DatabaseManager {
  late final String connectionString = _initConnection();

  String _initConnection() {
    print('Connecting to Database...');
    return "postgres://localhost:5432/db";
  }
}

// 2. The Never Type
Never failWithUnreachable(String reason) {
  throw ArgumentError("Fatal Application Error: $reason");
}

// Helper function testing type promotion limits
void processInput(Object? input) {
  // 3. Type Promotion & Fail-Fast Guards
  if (input == null) {
    failWithUnreachable("Input cannot be null");
  }

  print('Input type promoted length: ${input.toString().length}');
}

class Cache {
  String? _cachedData;

  void validateCache() {
    // Copy the private field into a local variable
    // so Dart can safely promote its type.
    final localData = _cachedData;

    if (localData != null) {
      print('Cache data length: ${localData.length}');
    } else {
      print('Cache is empty.');
    }
  }
}

void main() {
  // 1. DatabaseManager
  DatabaseManager database = DatabaseManager();

  print('Connection String: ${database.connectionString}');

  print('-----------------------------');

  // 2. Type promotion and Never
  processInput("Dart Advanced Module");

  print('-----------------------------');

  // 3. Cache validation
  Cache cache = Cache();

  cache.validateCache();

  print('-----------------------------');

  // 4. Late Initialization Edge Case

  // This would cause LateInitializationError:
  //
  // late String unassignedText;
  // print(unassignedText);

  // Correct usage:
  late String unassignedText;

  unassignedText = "Initialized";

  print('Late variable: $unassignedText');

  print('-----------------------------');

  // 5. Null-Aware Operators Combined
  Map<String, List<int>?>? complexData;

  int scoreCount = complexData?['scores']?.length ?? -1;

  print('Scores count: $scoreCount');

  print('-----------------------------');

  // 6. Bang Operator Safety Boundary
  String? conditionalNullable = "Dart 3 Sound Null Safety";

  if (conditionalNullable != null) {
    print(conditionalNullable!.toUpperCase());
  }
}