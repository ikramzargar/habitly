import 'package:uuid/uuid.dart';

class Habit {
  final String id;
  final String name;
  final String iconAssetPath; // Path for custom asset icons (PNG or other image files)
  bool isDone;
  int hours; // New field for timer duration in hours
  int minutes; // New field for timer duration in minutes

  Habit({
    required this.name,
    required this.iconAssetPath, // Always require a custom image path
    this.isDone = false,
    this.hours = 0, // Initialize hours to 0 by default
    this.minutes = 0, // Initialize minutes to 0 by default
  }) : id = const Uuid().v4();

  // Convert the Habit to a map for saving to a database or local storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone': isDone,
      'iconAssetPath': iconAssetPath, // Save the asset path for the custom image icon
      'hours': hours, // Save hours for timer
      'minutes': minutes, // Save minutes for timer
    };
  }

  // Create a Habit from a map (retrieved from a database or local storage)
  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      name: map['name'] ?? '',
      isDone: map['isDone'] ?? false,
      iconAssetPath: map['iconAssetPath'] ?? '', // Ensure there's always an asset path
      hours: map['hours'] ?? 0, // Load hours from the map, defaulting to 0
      minutes: map['minutes'] ?? 0, // Load minutes from the map, defaulting to 0
    );
  }
}
