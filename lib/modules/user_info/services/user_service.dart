import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  Future<void> addUser({
    required String name,
    required int age,
    required String email,
    required String gender,
    required String goal,
    required int height,
    required String level,
    required int weight,
  }) async {
    try {
      await usersCollection.add({
        'name': name,
        'age': age,
        'email': email,
        'gender': gender,
        'goal': goal,
        'height': height,
        'level': level,
        'weight': weight,
      });
    } catch (e) {
      rethrow;
    }
  }
}
