import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';
import '../widgets/add_task_dialog.dart';

class TasksScreen extends StatelessWidget {
  final List<Task> tasks;
  final VoidCallback onUpdate;

  const TasksScreen({
    super.key,
    required this.tasks,
    required this.onUpdate,
  });

  void addTask(Task task) {
    tasks.add(task);
    onUpdate();
  }

  void toggleTask(int index) {
    tasks[index].isDone = !tasks[index].isDone;
    onUpdate();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    onUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task: tasks[index],
            onTap: () => toggleTask(index),
            onDelete: () => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        onPressed: () => showAddTaskDialog(context, addTask),
        child: const Icon(Icons.add),
      ),
    );
  }
}