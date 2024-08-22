import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habitly/models/habit.dart';

class HabitService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addHabit(String userId, Habit habit) async {
    await _firestore.collection('users').doc(userId).collection('habits').doc(habit.id).set(habit.toMap());
  }

  Future<List<Habit>> getHabits(String userId) async {
    QuerySnapshot snapshot = await _firestore.collection('users').doc(userId).collection('habits').get();
    return snapshot.docs.map((doc) => Habit.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<void> deleteHabit(String userId, String habitId) async {
    await _firestore.collection('users').doc(userId).collection('habits').doc(habitId).delete();
  }
}
