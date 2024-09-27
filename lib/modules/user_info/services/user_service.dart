import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/modules/user_info/model/user_info_model.dart';

class UserService {
  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> addUser({required UserInfoModel userInfoModel}) async {
    try {
      await usersCollection.doc(userInfoModel.uid).set({
        'name': userInfoModel.name,
        'age': userInfoModel.age,
        'gender': userInfoModel.gender,
        'goal': userInfoModel.goal,
        'height': userInfoModel.height,
        'level': userInfoModel.level,
        'weight': userInfoModel.weight,
      });
    } catch (e) {
      print('Error adding user: $e');
      rethrow;
    }
  }

  Future<UserInfoModel?> getUserByUid(String uid) async {
    try {
      DocumentSnapshot snapshot = await usersCollection.doc(uid).get();
      if (snapshot.exists) {
        return UserInfoModel.fromMap(snapshot.data() as Map<String, dynamic>);
      } else {
        print('User not found');
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }

  // Optional: Method to fetch user information by email (not recommended for direct use)
  Future<UserInfoModel?> getUserByEmail(String email) async {
    try {
      // Consider using an index or a different method for searching by email
      // This is just an example
      QuerySnapshot snapshot = await usersCollection.where('email', isEqualTo: email).get();
      if (snapshot.docs.isNotEmpty) {
        return UserInfoModel.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      } else {
        print('User not found');
        return null;
      }
    } catch (e) {
      print('Error fetching user: $e');
      return null;
    }
  }
}
