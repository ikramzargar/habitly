// nav_screen.dart
import 'package:flutter/material.dart';
import 'package:habitly/screens/settings.dart';
import 'home.dart';
import 'package:habitly/models/habit.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // Define the selected index for the BottomNavigationBar
  int _selectedIndex = 0;

  // Sample habits list
  final List<Habit> habits = [
    Habit(name: 'Drink Water', iconAssetPath: 'assets/icons/drink-water.png'),
    Habit(name: 'Exercise', iconAssetPath: 'assets/icons/treadmill.png'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(habits: habits),
          SettingsScreen(), // Ensure you have a SettingsScreen defined
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
