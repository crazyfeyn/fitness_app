import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> editUserInfo({
    String? name,
  }) async {
    User? currentUser = _firebaseAuth.currentUser;

    try {
      if (currentUser != null) {
        if (name != null) {
          await usersCollection.doc(currentUser.uid).update({'name': name});
          await currentUser.updateDisplayName(name);
        }

        await currentUser.reload();
      }
    } catch (e) {
      rethrow;
    }
  }

  // Future<User?> fetchCurrentUserByUid(String uid) async {
  //   try {
  //     User? user = _firebaseAuth.currentUser;
  //     if (user != null && user.uid == uid) {
  //       return user;
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
