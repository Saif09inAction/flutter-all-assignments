import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TodoPage(),
    );
  }
}

// StatefulWidget because the Todo list changes
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // Controller to get text from TextField
  final TextEditingController _controller = TextEditingController();

  // List of Todo items
  final List<Map<String, dynamic>> _todos = [];

  // Add a new Todo
  void _addTodo() {
    String task = _controller.text.trim();

    if (task.isNotEmpty) {
      setState(() {
        _todos.add({
          'title': task,
          'completed': false,
        });
      });

      // Clear text field
      _controller.clear();
    }
  }

  // Mark Todo as completed/uncompleted
  void _toggleTodo(int index) {
    setState(() {
      _todos[index]['completed'] = !_todos[index]['completed'];
    });
  }

  // Delete Todo
  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [

            // TextField + Add Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter a task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    // Press Enter to add Todo
                    onSubmitted: (_) {
                      _addTodo();
                    },
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: _addTodo,
                  child: const Text('Add'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Todo List
            Expanded(
              child: _todos.isEmpty
                  ? const Center(
                      child: Text(
                        'No todos yet!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _todos.length,

                      itemBuilder: (context, index) {
                        final todo = _todos[index];

                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),

                          child: ListTile(

                            // Checkbox
                            leading: Checkbox(
                              value: todo['completed'],
                              onChanged: (_) {
                                _toggleTodo(index);
                              },
                            ),

                            // Todo title
                            title: Text(
                              todo['title'],
                              style: TextStyle(
                                fontSize: 16,

                                // Strike through completed Todo
                                decoration: todo['completed']
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,

                                color: todo['completed']
                                    ? Colors.grey
                                    : Colors.black,
                              ),
                            ),

                            // Delete button
                            trailing: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                _deleteTodo(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}