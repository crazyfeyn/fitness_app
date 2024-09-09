class UserInfoModel {
  String name;
  int weight;
  int age;
  String email;
  String gender;
  String goal;
  int height;
  String level;

  UserInfoModel({
    required this.name,
    required this.weight,
    required this.age,
    required this.email,
    required this.gender,
    required this.goal,
    required this.height,
    required this.level,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'weight': weight,
      'age': age,
      'email': email,
      'gender': gender,
      'goal': goal,
      'height': height,
      'level': level,
    };
  }

  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      name: json['name'],
      weight: json['weight'],
      age: json['age'],
      email: json['email'],
      gender: json['gender'],
      goal: json['goal'],
      height: json['height'],
      level: json['level'],
    );
  }
}
