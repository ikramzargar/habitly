// import 'package:flutter/material.dart';
// import 'package:habitly/models/habit.dart';
// import 'package:habitly/screens/home.dart';
// import 'package:uuid/uuid.dart';
//
// class SetupScreen extends StatefulWidget {
//   @override
//   _SetupScreenState createState() => _SetupScreenState();
// }
//
// class _SetupScreenState extends State<SetupScreen> {
//   List<Habit> habits = [
//     Habit(name: 'Exercise', description: 'Daily exercise for 30 minutes'),
//     Habit(name: 'Read', description: 'Read for 20 minutes'),
//     Habit(name: 'Meditate', description: 'Meditate for 15 minutes'),
//   ];
//
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//
//   void _addHabit() {
//     if (_nameController.text.isNotEmpty &&
//         _descriptionController.text.isNotEmpty) {
//       setState(() {
//         habits.add(Habit(
//           name: _nameController.text,
//           description: _descriptionController.text,
//         ));
//         _nameController.clear();
//         _descriptionController.clear();
//       });
//     }
//   }
//   void _continue(){
//
//   }
//
//   void _deleteHabit(String id) {
//     setState(() {
//       habits.removeWhere((habit) => habit.id == id);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Setup Habits'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: habits.length,
//               itemBuilder: (context, index) {
//                 final habit = habits[index];
//                 return ListTile(
//                   title: Text(habit.name),
//                   subtitle: Text(habit.description),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () => _deleteHabit(habit.id),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: _nameController,
//                   decoration: InputDecoration(labelText: 'Habit Name'),
//                 ),
//                 TextField(
//                   controller: _descriptionController,
//                   decoration: InputDecoration(labelText: 'Description'),
//                 ),
//                 ElevatedButton(
//                   onPressed: (){
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen(habits: habits)));
//                   },
//                   child: Text('Add Habit'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _continue,
//                   child: Text('continue'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:habitly/models/habit.dart';
import 'package:habitly/screens/home.dart';

class SetupScreen extends StatefulWidget {
  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  List<Habit> habits = [
    Habit(name: 'Exercise', description: 'Daily exercise for 30 minutes', iconAssetPath: 'assets/icons/training.png'),
    Habit(name: 'Read', description: 'Read for 20 minutes', iconAssetPath: 'assets/icons/read.png'),
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String? _selectedIconPath;

  // Predefined icons to choose from (PNG paths)
  final List<String> _availableIcons = [
    'assets/icons/drink-water.png',
    'assets/icons/house.png',
    'assets/icons/meditation.png',
    'assets/icons/treadmill.png',
    // Add more icons here
  ];

  void _addHabit() {
    if (_nameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _selectedIconPath != null) {
      setState(() {
        habits.add(Habit(
          name: _nameController.text,
          description: _descriptionController.text,
         iconAssetPath: _selectedIconPath!,
        ));
        _nameController.clear();
        _descriptionController.clear();
        _selectedIconPath = null;
      });
    }
  }

  void _deleteHabit(String id) {
    setState(() {
      habits.removeWhere((habit) => habit.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup Habits'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                return ListTile(
                  leading: habit.iconAssetPath != null
                      ? Image.asset(habit.iconAssetPath!)
                      : null,
                  title: Text(habit.name),
                  subtitle: Text(habit.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteHabit(habit.id),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Habit Name'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 20),
                Text(
                  'Pick an Icon:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                DropdownButton<String>(
                  value: _selectedIconPath,
                  hint: Text('Select Icon'),
                  icon: Icon(Icons.arrow_downward),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedIconPath = newValue;
                    });
                  },
                  items: _availableIcons.map<DropdownMenuItem<String>>((String iconPath) {
                    return DropdownMenuItem<String>(
                      value: iconPath,
                      child: Row(
                        children: [
                          Image.asset(iconPath, width: 24, height: 24),
                          SizedBox(width: 10),
                          Text(iconPath.split('/').last),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _addHabit,
                  child: Text('Add Habit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(habits: habits),
                      ),
                    );
                  },
                  child: Text('Continue to Home'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
