import 'package:flutter/material.dart';
import '../models/task.dart';
import '../utils/helpers.dart';

class ScheduleScreen extends StatelessWidget {
  final List<Task> tasks;

  const ScheduleScreen({
    super.key,
    required this.tasks,
  });

  @override
  Widget build(BuildContext context) {
    final todayTasks = tasks.where((t) => isToday(t.dateTime)).toList();
    final upcomingTasks = tasks.where((t) => isUpcoming(t.dateTime)).toList();

    Widget buildList(List<Task> list) {
      if (list.isEmpty) {
        return const Center(child: Text("No tasks"));
      }

      return ListView(
        children: list.map((task) {
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(task.title),
              subtitle: Text(formatDateTime(task.dateTime)),
            ),
          );
        }).toList(),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Schedule"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Today"),
              Tab(text: "Upcoming"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildList(todayTasks),
            buildList(upcomingTasks),
          ],
        ),
      ),
    );
  }
}