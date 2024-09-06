import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/modules/workout/model/workout.dart';

class WorkoutService {
  Future<List<Workout>> getWorkouts() async {
    try {
      CollectionReference<Map<String, dynamic>> workouts =
          FirebaseFirestore.instance.collection('workout');

      QuerySnapshot<Map<String, dynamic>> snapshot = await workouts.get();

      if (snapshot.docs.isNotEmpty) {
        List<Workout> workoutList = snapshot.docs.map((doc) {
          return Workout.fromMap(doc.data());
        }).toList();

        return workoutList;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
