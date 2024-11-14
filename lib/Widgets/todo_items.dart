import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String task;
  final VoidCallback onDelete;

  const TodoItem({super.key, required this.task, required this.onDelete});

  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false; // Track whether the checkbox is checked

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false; // Toggle the checkbox value
            });
          },
        ),
        title: Text(
          widget.task,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            padding:const EdgeInsets.all(0),
            icon: const Icon(Icons.delete),
            color: Colors.white,
            iconSize: 18,
            onPressed: widget.onDelete,
          ),
        ),
      ),
    );
  }
}
