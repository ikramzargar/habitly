import 'package:flutter/material.dart';
import 'package:habitly/models/habit.dart';

class HomeScreen extends StatelessWidget {
  final List<Habit> habits;

  HomeScreen({required this.habits});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Habits'),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          final habit = habits[index];
          return ListTile(
            title: Text(habit.name),
            trailing: Checkbox(
              value: habit.isDone, // Assume you have an isDone field in Habit
              onChanged: (bool? value) {
                // Handle marking the habit as done
              },
            ),
          );
        },
      ),
    );
  }
}
