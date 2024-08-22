import 'package:uuid/uuid.dart';

class Habit {
  final String id;
  final String name;
  final String iconAssetPath;  // Path for custom asset icons (PNG or other image files)
  bool isDone;

  Habit({
    required this.name,
    required this.iconAssetPath,  // Always require a custom image path
    this.isDone = false,
  }) : id = const Uuid().v4();

  // Convert the Habit to a map for saving to a database or local storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone,
      'iconAssetPath': iconAssetPath,  // Save the asset path for the custom image icon
    };
  }

  // Create a Habit from a map (retrieved from a database or local storage)
  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      name: map['name'] ?? '',
      isDone: map['isDone'] ?? false,
      iconAssetPath: map['iconAssetPath'] ?? '',  // Ensure there's always an asset path
    );
  }
}
