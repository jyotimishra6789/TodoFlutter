import 'package:flutter/material.dart';
import 'package:todos/Widgets/todo_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List<String> tasks = [
    'Buy groceries',
    'Check email',
    'Complete Flutter app',
    'Read a book',
    'Attend meeting'
  ];

  // Method to delete task
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index); // Removes the task at the given index
    });
  }

  // Method to add new task
  void _addTask(String task) {
    setState(() {
      tasks.add(task); // Add the new task to the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20,left:20),
              child: Text(
                'All ToDo\'s',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return TodoItem(
                    task: tasks[index],
                    onDelete: () => _deleteTask(index), // Pass the delete function
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskBottomSheet(context);
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      title: const Center(
        child: Text(
          'ToDo List',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void _showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter Task',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    _addTask(_controller.text); // Add the new task to the list
                    _controller.clear(); // Clear the input field
                    Navigator.pop(context); // Close the bottom sheet
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: const Text('Add Task'),
              ),
            ],
          ),
        );
      },
    );
  }
}
