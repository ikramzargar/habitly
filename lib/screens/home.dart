// home_screen.dart
import 'package:flutter/material.dart';
import 'package:habitly/models/habit.dart';

class HomeScreen extends StatefulWidget {
  final List<Habit> habits;

  const HomeScreen({Key? key, required this.habits}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _toggleHabitDone(int index) {
    setState(() {
      widget.habits[index].isDone = !widget.habits[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.habits.length,
        itemBuilder: (context, index) {
          final habit = widget.habits[index];
          return ListTile(
            title: Text(habit.name),
            trailing: Checkbox(
              value: habit.isDone,
              onChanged: (bool? value) {
                _toggleHabitDone(index);
              },
            ),
          );
        },
      ),
    );
  }
}
