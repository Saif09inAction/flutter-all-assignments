# Todo List App with State

A simple and functional **Todo List application built using Flutter and Dart**. This project demonstrates how to manage changing data in Flutter using **StatefulWidget** and **setState()**.

The application allows users to add tasks, mark tasks as completed, and delete tasks.

---

## 📌 Assignment Information

**Assignment:** Assignment 5 – Todo List App with State
**Subject:** Flutter Development
**Technology:** Flutter & Dart
**Concept:** StatefulWidget and setState()
**Application Type:** Todo List / Task Management App

---

## 🎯 Objective

The main objective of this assignment is to understand **state management in Flutter using StatefulWidget and setState()**.

The application demonstrates how the user interface can change dynamically when the underlying data changes.

The Todo List application supports the following operations:

* Add a new Todo
* Display Todo items
* Mark a Todo as completed
* Mark a completed Todo as incomplete
* Delete a Todo
* Dynamically update the UI using `setState()`

---

## 🛠️ Technologies Used

* **Flutter** – UI framework for building the application
* **Dart** – Programming language used by Flutter
* **StatefulWidget** – Used for managing changing application state
* **setState()** – Used to rebuild the UI when the state changes
* **TextField** – Used to enter Todo items
* **ListView.builder** – Used to display the Todo list
* **Checkbox** – Used to mark tasks as completed
* **IconButton** – Used to delete tasks
* **Material Design** – Used for the application interface

---

## ✨ Features

### 1. Add Todo

Users can enter a task in the text field and press the **Add** button.

For example:

```text
Complete Flutter Assignment
```

After clicking Add, the task appears in the Todo list.

---

### 2. Display Todo List

All added tasks are displayed in a scrollable list.

Each Todo contains:

* Checkbox
* Task title
* Delete button

Example:

```text
☐ Complete Flutter Assignment       🗑️
☐ Learn StatefulWidget              🗑️
☐ Practice setState                 🗑️
```

---

### 3. Mark Todo as Completed

Users can click the checkbox beside a Todo.

When a Todo is completed:

* Checkbox becomes checked
* Task text gets a line through it
* Text color changes to grey

Example:

```text
☑ Complete Flutter Assignment
```

The user can also click the checkbox again to mark the task as incomplete.

---

### 4. Delete Todo

Each Todo has a delete button.

When the delete button is pressed, the selected Todo is removed from the list.

---

### 5. Empty Todo State

When there are no Todo items, the application displays:

```text
No todos yet!
```

This provides feedback to the user when the list is empty.

---

### 6. Enter Key Support

The application also allows users to press the **Enter/Return key** after typing a Todo.

The Todo will be added without requiring the user to click the Add button.

---

## 🧠 Main Flutter Concepts Used

### StatefulWidget

A `StatefulWidget` is used because the Todo list changes while the application is running.

For example:

* A new Todo can be added.
* A Todo can be completed.
* A Todo can be deleted.

Since these changes affect the UI, a `StatefulWidget` is appropriate.

The main StatefulWidget is:

```dart
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}
```

---

### setState()

`setState()` tells Flutter that the application's state has changed and that the UI should be rebuilt.

For example, while adding a Todo:

```dart
setState(() {
  _todos.add({
    'title': task,
    'completed': false,
  });
});
```

Similarly, `setState()` is used when completing or deleting a Todo.

---

### List

A list is used to store all Todo items.

```dart
final List<Map<String, dynamic>> _todos = [];
```

Each Todo contains two important pieces of information:

```text
title
completed
```

Example:

```text
{
  title: "Complete Flutter Assignment",
  completed: false
}
```

---

### TextEditingController

A `TextEditingController` is used to read the text entered by the user.

```dart
final TextEditingController _controller =
    TextEditingController();
```

The entered task can then be accessed using:

```dart
_controller.text
```

After adding a Todo, the text field is cleared using:

```dart
_controller.clear();
```

---

### ListView.builder

`ListView.builder` is used to display the Todo items dynamically.

It creates a list item for each Todo stored in the list.

```dart
ListView.builder(
  itemCount: _todos.length,
  itemBuilder: (context, index) {
    ...
  },
)
```

---

### Checkbox

The Checkbox is used to change the completion status of a Todo.

```dart
Checkbox(
  value: todo['completed'],
  onChanged: (_) {
    _toggleTodo(index);
  },
)
```

---

### IconButton

The delete icon is implemented using `IconButton`.

```dart
IconButton(
  icon: const Icon(
    Icons.delete,
    color: Colors.red,
  ),
  onPressed: () {
    _deleteTodo(index);
  },
)
```

---

## 📂 Project Structure

The important project structure is:

```text
todo_list_app/
│
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
│
├── lib/
│   └── main.dart
│
├── test/
│
├── pubspec.yaml
├── README.md
└── analysis_options.yaml
```

The main application code is written inside:

```text
lib/main.dart
```

---

## 🔄 Application Flow

The basic working flow of the application is:

```text
Start Application
       ↓
Todo List Screen
       ↓
Enter Todo
       ↓
Click Add
       ↓
setState()
       ↓
Todo Added to List
       ↓
UI Rebuilds
       ↓
Todo Displayed
       ↓
User Can:
 ┌─────┼─────┐
 ↓     ↓     ↓
Complete  Delete  Add More
 ↓         ↓
setState() setState()
 ↓         ↓
UI Updates Todo Removed
```

---

## ➕ Add Todo Flow

When the user enters a task:

```text
User enters task
       ↓
TextField stores text
       ↓
User clicks Add
       ↓
_addTodo() is called
       ↓
Check if text is not empty
       ↓
setState()
       ↓
Todo added to _todos
       ↓
TextField cleared
       ↓
UI updates
```

---

## ✅ Complete Todo Flow

```text
User clicks Checkbox
       ↓
_toggleTodo() is called
       ↓
setState()
       ↓
completed value changes
       ↓
UI rebuilds
       ↓
Checkbox changes
       ↓
Text gets line-through
```

---

## 🗑️ Delete Todo Flow

```text
User clicks Delete
       ↓
_deleteTodo() is called
       ↓
setState()
       ↓
removeAt(index)
       ↓
Todo removed from list
       ↓
UI rebuilds
```

---

## 💻 Installation and Setup

### Step 1: Install Flutter

Make sure Flutter is installed on your system.

Check Flutter installation using:

```bash
flutter --version
```

---

### Step 2: Create Flutter Project

Create a new Flutter project using:

```bash
flutter create todo_list_app
```

---

### Step 3: Open Project

Move into the project folder:

```bash
cd todo_list_app
```

Open the project in VS Code:

```bash
code .
```

---

### Step 4: Add the Code

Open:

```text
lib/main.dart
```

Remove the existing code and add the Todo List application code.

---

### Step 5: Run the Application

Run:

```bash
flutter run
```

You can also run the application using the **Run** button in VS Code.

---

## 🧪 Testing

The application was tested for the following operations:

### Test 1 – Add Todo

**Input:**

```text
Complete Flutter Assignment
```

**Expected Result:**

The Todo should appear in the list.

**Status:** Passed

---

### Test 2 – Add Multiple Todos

**Input:**

```text
Complete Flutter Assignment
Learn StatefulWidget
Practice setState
```

**Expected Result:**

All three Todo items should appear.

**Status:** Passed

---

### Test 3 – Mark Todo Complete

**Action:**

Click the checkbox of a Todo.

**Expected Result:**

The checkbox becomes checked and the task gets a line through it.

**Status:** Passed

---

### Test 4 – Mark Todo Incomplete

**Action:**

Click the checked checkbox again.

**Expected Result:**

The Todo becomes incomplete and the line-through disappears.

**Status:** Passed

---

### Test 5 – Delete Todo

**Action:**

Click the delete icon.

**Expected Result:**

The selected Todo is removed.

**Status:** Passed

---

### Test 6 – Empty List

**Action:**

Delete all Todo items.

**Expected Result:**

The message:

```text
No todos yet!
```

is displayed.

**Status:** Passed

---

### Test 7 – Empty Input

**Action:**

Click Add without entering any text.

**Expected Result:**

No empty Todo should be added.

**Status:** Passed

---

## 📸 Screenshots

The following screenshots can be added to demonstrate the working application.

### Screenshot 1 – Initial Screen

Show the Todo List application before adding any task.

Expected screen:

```text
TODO LIST

[ Enter a task                 ] [Add]

          No todos yet!
```

---

### Screenshot 2 – Todo Items Added

Add multiple Todo items and take a screenshot.

Example:

```text
TODO LIST

[ Enter a task                 ] [Add]

☐ Complete Flutter Assignment       🗑️
☐ Learn StatefulWidget              🗑️
☐ Practice setState                 🗑️
```

---

### Screenshot 3 – Completed Todo

Mark one Todo as completed.

Example:

```text
TODO LIST

☑ Complete Flutter Assignment       🗑️
☐ Learn StatefulWidget              🗑️
☐ Practice setState                 🗑️
```

---

### Screenshot 4 – Todo Deleted

Delete one Todo and show that it has been removed from the list.

---

## 📚 Important Methods

### `_addTodo()`

This method adds a new Todo to the list.

```dart
void _addTodo() {
  String task = _controller.text.trim();

  if (task.isNotEmpty) {
    setState(() {
      _todos.add({
        'title': task,
        'completed': false,
      });
    });

    _controller.clear();
  }
}
```

---

### `_toggleTodo()`

This method changes the completion status.

```dart
void _toggleTodo(int index) {
  setState(() {
    _todos[index]['completed'] =
        !_todos[index]['completed'];
  });
}
```

---

### `_deleteTodo()`

This method removes a Todo.

```dart
void _deleteTodo(int index) {
  setState(() {
    _todos.removeAt(index);
  });
}
```

---

## 🎓 Viva Questions and Answers

### 1. Why did you use StatefulWidget?

We use `StatefulWidget` because the Todo list changes during runtime. Adding, completing, and deleting tasks changes the application state.

---

### 2. What is setState()?

`setState()` is a Flutter method used to notify Flutter that the state has changed and the UI needs to be rebuilt.

---

### 3. Why is setState() required?

Without `setState()`, the data may change internally but Flutter will not automatically rebuild the UI to show the change.

---

### 4. What is a TextField?

`TextField` is a Flutter widget that allows the user to enter text.

In this application, it is used to enter Todo tasks.

---

### 5. Why do we use TextEditingController?

`TextEditingController` allows us to access and control the text entered inside the TextField.

---

### 6. What is ListView.builder?

`ListView.builder` creates a scrollable list of widgets dynamically.

It is useful when the number of list items can change.

---

### 7. What does `removeAt(index)` do?

`removeAt(index)` removes an item from the list at the specified index.

---

### 8. What does `add()` do?

The `add()` method adds a new item to the end of a list.

---

### 9. Why do we use Checkbox?

The Checkbox allows the user to change the completion status of a Todo.

---

### 10. What happens when a Todo is completed?

The `completed` value changes from `false` to `true`, and the UI displays the task as completed with a checked checkbox and line-through text.

---

### 11. What is the purpose of `List<Map<String, dynamic>>`?

It is used to store multiple Todo items, where every Todo contains information such as its title and completion status.

---

### 12. What is the purpose of `dispose()`?

`dispose()` releases resources used by the `TextEditingController` when the widget is removed from the widget tree.

---

## 📝 Learning Outcome

After completing this assignment, I learned:

* How to create a `StatefulWidget`
* How Flutter manages changing state
* How to use `setState()`
* How to take input using `TextField`
* How to use `TextEditingController`
* How to store data in a List
* How to display dynamic data using `ListView.builder`
* How to use Checkbox for completion status
* How to delete items from a list
* How the Flutter UI rebuilds when state changes

---

## 🚀 Future Improvements

The application can be improved in the future by adding:

* Persistent storage using SharedPreferences
* Firebase database
* Todo categories
* Due dates
* Priority levels
* Search functionality
* Edit Todo functionality
* Dark mode
* Notifications and reminders
* Authentication
* Cloud synchronization

These features are not required for the current assignment.

---

## ✅ Conclusion

The Todo List application successfully demonstrates **state management using StatefulWidget and setState() in Flutter**.

The application provides the basic functionality required for a Todo application, including adding tasks, displaying tasks, marking tasks as completed, and deleting tasks.

This assignment helped in understanding how Flutter manages changing data and automatically updates the user interface using `setState()`.

---

## 👩‍💻 Author

**Saif**

**B.Tech Computer Science Engineering**

---

## ⭐ Assignment Requirements Checklist

* [x] Create Flutter application
* [x] Use StatefulWidget
* [x] Use setState()
* [x] Add Todo
* [x] Display Todo
* [x] Mark Todo as completed
* [x] Mark Todo as incomplete
* [x] Delete Todo
* [x] Handle empty Todo list
* [x] Handle empty input
* [x] Use Flutter and Dart
* [x] Test all major operations

---

**Assignment 5 – Todo List App with State**

**Flutter | Dart | StatefulWidget | setState()**
