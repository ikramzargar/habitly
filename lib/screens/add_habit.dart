// import 'package:flutter/material.dart';
// import 'package:habitly/globals/text_styles.dart';
// import 'package:habitly/models/habit.dart';
//
// import '../globals/colors.dart';
//
// class AddHabitScreen extends StatefulWidget {
//   final void Function(Habit) onAddHabit;
//
//   const AddHabitScreen({super.key, required this.onAddHabit});
//
//   @override
//   _AddHabitScreenState createState() => _AddHabitScreenState();
// }
//
// class _AddHabitScreenState extends State<AddHabitScreen> {
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
//       final newHabit = Habit(
//         name: _nameController.text,
//         iconAssetPath: _selectedIconPath!,
//       );
//       widget.onAddHabit(newHabit);
//       Navigator.of(context).pop();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Create custom habit',
//           style: AppTextStyles.heading2,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'What do you want to do?',
//               style: AppTextStyles.bodyText.copyWith(color: Colors.black),
//             ),
//             SizedBox(height: 20.0),
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 hintText: 'Name of habit',
//                 border: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                     color: AppColors.blue,
//                   ),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text('Pick an Icon:', style: TextStyle(fontSize: 16)),
//             SizedBox(height: 10),
//             DropdownButton<String>(
//               value: _selectedIconPath,
//               hint: Text('Select Icon'),
//               icon: Icon(Icons.arrow_downward),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedIconPath = newValue;
//                 });
//               },
//               items: _availableIcons
//                   .map<DropdownMenuItem<String>>((String iconPath) {
//                 return DropdownMenuItem<String>(
//                   value: iconPath,
//                   child: Row(
//                     children: [
//                       Image.asset(iconPath, width: 24, height: 24),
//                       SizedBox(width: 10),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _addHabit,
//               child: Text('Add Habit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//

import 'package:flutter/material.dart';
import 'package:habitly/globals/text_styles.dart';
import 'package:habitly/models/habit.dart';
import '../globals/colors.dart';

class AddHabitScreen extends StatefulWidget {
  final void Function(Habit) onAddHabit;

  const AddHabitScreen({super.key, required this.onAddHabit});

  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final TextEditingController _nameController = TextEditingController();
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
    if (_nameController.text.isNotEmpty && _selectedIconPath != null) {
      final newHabit = Habit(
        name: _nameController.text,
        iconAssetPath: _selectedIconPath!,
      );
      widget.onAddHabit(newHabit);
      Navigator.of(context).pop();
    }
  }

  void _showIconPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pick an Icon'),
          content: Container(
            width: double.maxFinite,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: _availableIcons.length,
              itemBuilder: (context, index) {
                final iconPath = _availableIcons[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIconPath = iconPath;
                    });
                    Navigator.of(context).pop(); // Close dialog after selection
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _selectedIconPath == iconPath
                            ? AppColors.blue
                            : Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(iconPath),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create custom habit',
          style: AppTextStyles.heading2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What do you want to do?',
              style: AppTextStyles.bodyText.copyWith(color: Colors.black),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name of habit',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.blue,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: _showIconPickerDialog,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 35.0),
                child: Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.tile,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Pick an icon',
                        style: AppTextStyles.bodyText
                            .copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      _selectedIconPath != null
                          ? Image.asset(
                              _selectedIconPath!,
                              width: 24,
                              height: 24,
                            )
                          : Image.asset(
                              'assets/icons/heart.png',
                              width: 24,
                              height: 24,
                            ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Settings',style: AppTextStyles.bodyText,),

            ElevatedButton(
              onPressed: _addHabit,
              child: Text('Add Habit'),
            ),
          ],
        ),
      ),
    );
  }
}
