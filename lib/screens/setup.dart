// import 'package:flutter/material.dart';
// import 'package:habitly/globals/colors.dart';
// import 'package:habitly/globals/text_styles.dart';
// import 'package:habitly/models/habit.dart';
// import 'package:habitly/screens/home.dart';
// import 'package:habitly/widgtes/blue_button.dart';
//
// class SetupScreen extends StatefulWidget {
//   const SetupScreen({super.key});
//
//   @override
//   _SetupScreenState createState() => _SetupScreenState();
// }
//
// class _SetupScreenState extends State<SetupScreen> {
//   List<Habit> habits = [
//     Habit(name: 'Exercise', iconAssetPath: 'assets/icons/training.png'),
//     Habit(name: 'Read', iconAssetPath: 'assets/icons/read.png'),
//   ];
//
//   final TextEditingController _nameController = TextEditingController();
//   String? _selectedIconPath;
//
//   // Predefined icons to choose from (PNG paths)
//   final List<String> _availableIcons = [
//     'assets/icons/drink-water.png',
//     'assets/icons/house.png',
//     'assets/icons/meditation.png',
//     'assets/icons/treadmill.png',
//     // Add more icons here
//   ];
//
//   void _addHabit() {
//     if (_nameController.text.isNotEmpty && _selectedIconPath != null) {
//       setState(() {
//         habits.add(Habit(
//           name: _nameController.text,
//           iconAssetPath: _selectedIconPath!,
//         ));
//         _nameController.clear();
//         _selectedIconPath = null;
//       });
//     }
//   }
//
//   void _showAddHabitDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Add New Habit'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Habit Name'),
//               ),
//               SizedBox(height: 20),
//               Text('Pick an Icon:', style: TextStyle(fontSize: 16)),
//               SizedBox(height: 10),
//               DropdownButton<String>(
//                 value: _selectedIconPath,
//                 hint: Text('Select Icon'),
//                 icon: Icon(Icons.arrow_downward),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _selectedIconPath = newValue;
//                   });
//                 },
//                 items: _availableIcons
//                     .map<DropdownMenuItem<String>>((String iconPath) {
//                   return DropdownMenuItem<String>(
//                     value: iconPath,
//                     child: Row(
//                       children: [
//                         Image.asset(iconPath, width: 24, height: 24),
//                         SizedBox(width: 10),
//                         Text(iconPath.split('/').last),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 _addHabit();
//                 Navigator.of(context).pop(); // Close the dialog after adding
//               },
//               child: Text('Add'),
//             ),
//           ],
//         );
//       },
//     );
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
//         title: Center(
//             child: Text(
//           'Setup Habits',
//           style: AppTextStyles.heading2,
//         )),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: habits.length,
//               itemBuilder: (context, index) {
//                 final habit = habits[index];
//                 return Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 20.0, vertical: 10.0),
//                   child: ListTile(
//                     tileColor: AppColors.tile,
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     leading: habit.iconAssetPath.isNotEmpty
//                         ? Image.asset(habit.iconAssetPath)
//                         : null,
//                     title: Text(habit.name),
//                     trailing: IconButton(
//                       icon: Icon(Icons.delete),
//                       onPressed: () => _deleteHabit(habit.id),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: MaterialButton(
//               onPressed: () {
//                 _showAddHabitDialog;
//               },
//               height: 55.0,
//               minWidth: 350.0,
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(color: AppColors.blue, width: 2),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.add,
//                     color: AppColors.blue,
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Text(
//                     'Add Habit',
//                     style:
//                         AppTextStyles.bodyText.copyWith(color: AppColors.blue),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 15.0),
//             child: BlueButton(
//               text: 'Continue to Home',
//               callback: () {
//                 Navigator.of(context).pushReplacement(
//                   MaterialPageRoute(
//                     builder: (context) => HomeScreen(habits: habits),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:habitly/globals/colors.dart';
import 'package:habitly/globals/text_styles.dart';
import 'package:habitly/models/habit.dart';
import 'package:habitly/screens/home.dart';

import '../widgtes/blue_button.dart';
import 'add_habit.dart';  // Import the new screen

class SetupScreen extends StatefulWidget {
  const SetupScreen({super.key});

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  List<Habit> habits = [
    Habit(name: 'Exercise', iconAssetPath: 'assets/icons/training.png'),
    Habit(name: 'Read', iconAssetPath: 'assets/icons/read.png'),
  ];

  void _deleteHabit(String id) {
    setState(() {
      habits.removeWhere((habit) => habit.id == id);
    });
  }

  void _navigateToAddHabit() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddHabitScreen(
          onAddHabit: (habit) {
            setState(() {
              habits.add(habit);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Setup Habits',
            style: AppTextStyles.heading2,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: habits.length,
              itemBuilder: (context, index) {
                final habit = habits[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: ListTile(
                    tileColor: AppColors.tile,
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    leading: habit.iconAssetPath.isNotEmpty
                        ? Image.asset(habit.iconAssetPath)
                        : null,
                    title: Text(habit.name),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteHabit(habit.id),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: _navigateToAddHabit,
              height: 55.0,
              minWidth: 350.0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: AppColors.blue, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.blue,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Add Habit',
                    style: AppTextStyles.bodyText.copyWith(color: AppColors.blue),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: BlueButton(
              text: 'Continue to Home',
              callback: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(habits: habits),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

