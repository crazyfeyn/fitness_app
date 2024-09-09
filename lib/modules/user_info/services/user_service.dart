import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application/modules/user_info/model/user_info_model.dart';

class UserService {
  final usersCollection = FirebaseFirestore.instance.collection('users');
  Future<void> addUser({required UserInfoModel userInfoModel}) async {
    try {
      await usersCollection.add({
        'name': userInfoModel.name,
        'age': userInfoModel.age,
        'email': userInfoModel.email,
        'gender': userInfoModel.gender,
        'goal': userInfoModel.goal,
        'height': userInfoModel.height,
        'level': userInfoModel.level,
        'weight': userInfoModel.weight,
      });
    } catch (e) {
      rethrow;
    }
  }
}
