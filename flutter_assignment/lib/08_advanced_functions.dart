// Helper class for required & optional named parameter rules
class APIConfig {
  final String endpoint;
  final int timeoutSeconds;
  final bool enableLogs;

  APIConfig({
    required this.endpoint,
    this.timeoutSeconds = 30,
    this.enableLogs = false,
  });
}

// 1. Named and positional parameters
void sendNotification(String recipient, {String message = "Default Hello", bool urgent = false, required String sender}) {
  print(
    'From: $sender -> To: $recipient | '
    'Msg: $message | Urgent: $urgent',
  );
}

// 2. First-Class & Anonymous Functions
List<int> customMap(
  List<int> list,
  int Function(int) action,
) {
  List<int> result = [];

  for (var item in list) {
    result.add(action(item));
  }

  return result;
}

// 3. Lexical Closures
Function createCounter() {
  int count = 0;

  return () {
    count++;
    return count;
  };
}

void main() {
  // APIConfig example
  APIConfig config = APIConfig(
    endpoint: "https://api.example.com",
    timeoutSeconds: 60,
    enableLogs: true,
  );

  print('API Endpoint: ${config.endpoint}');
  print('Timeout: ${config.timeoutSeconds}');
  print('Logs Enabled: ${config.enableLogs}');

  print('-----------------------------');

  // 1. sendNotification
  sendNotification(
    "Alice",
    message: "Your order has been shipped!",
    urgent: true,
    sender: "Admin",
  );

  print('-----------------------------');

  // 2. customMap with anonymous arrow function
  List<int> numbers = [1, 2, 3, 4, 5];

  List<int> squares = customMap(
    numbers,
    (x) => x * x,
  );

  print('Original Numbers: $numbers');
  print('Squared Numbers: $squares');

  print('-----------------------------');

  // 3. Two separate counters
  final counterA = createCounter();
  final counterB = createCounter();

  print('Counter A: ${counterA()}');
  print('Counter A: ${counterA()}');

  print('Counter B: ${counterB()}');
}