import 'package:flutter/material.dart';
import '../models/task.dart';
import 'tasks_screen.dart';
import 'schedule_screen.dart';
import 'notes_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Task> tasks = []; // ✅ GLOBAL TASK LIST

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack( // ✅ IMPORTANT (state save karega)
        index: currentIndex,
        children: [
          TasksScreen(tasks: tasks, onUpdate: () => setState(() {})),
          ScheduleScreen(tasks: tasks),
          NotesScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.indigo,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.task), label: "Tasks"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Schedule"),
          BottomNavigationBarItem(icon: Icon(Icons.note), label: "Notes"),
        ],
      ),
    );
  }
}