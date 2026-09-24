void main() {
  // 1. List

  List<int> numbers = [10, 20, 30];

  numbers.add(40);
  numbers.remove(10);

  print("List: $numbers");
  print("Second item: ${numbers[1]}");

  // 2. Set

  Set<String> fruits = {
    "apple",
    "banana",
    "apple",
  };

  print("Set: $fruits");

  // 3. Map

  Map<String, dynamic> student = {
    "name": "Alex",
    "grade": "A",
  };

  student["age"] = 20;

  print("Student Map: $student");

  // 4. Type Conversion

  String numberString = "123";

  int number = int.parse(numberString);

  print("Converted String to int: $number");

  double price = 45.67;

  String formattedPrice = price.toStringAsFixed(1);

  print("Converted double to String: $formattedPrice");
}