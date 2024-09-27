class UserInfoModel {
  final String uid;      // Unique identifier for the user
  final String name;
  final int age;
  final String email;
  final String gender;
  final String goal;
  final double height;
  final String level;
  final double weight;

  UserInfoModel({
    required this.uid,
    required this.name,
    required this.age,
    required this.email,
    required this.gender,
    required this.goal,
    required this.height,
    required this.level,
    required this.weight,
  });

  // Factory method to create UserInfoModel from a Map
  factory UserInfoModel.fromMap(Map<String, dynamic> data) {
    return UserInfoModel(
      uid: data['uid'] as String,
      name: data['name'] as String,
      age: data['age'] as int,
      email: data['email'] as String,
      gender: data['gender'] as String,
      goal: data['goal'] as String,
      height: data['height'] as double,
      level: data['level'] as String,
      weight: data['weight'] as double,
    );
  }

  // Method to convert UserInfoModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'age': age,
      'email': email,
      'gender': gender,
      'goal': goal,
      'height': height,
      'level': level,
      'weight': weight,
    };
  }
}
