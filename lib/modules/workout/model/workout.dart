import 'package:cloud_firestore/cloud_firestore.dart';

class Workout {
  num caloria;
  int categoryId; // Corrected typo 'categotyId' to 'categoryId'
  Timestamp date;
  String description;
  String imageUrl;
  String time;
  String title;
  num videoTime;
  List<String> videos;

  Workout({
    required this.caloria,
    required this.categoryId,
    required this.date,
    required this.description,
    required this.imageUrl,
    required this.time,
    required this.title,
    required this.videoTime,
    required this.videos,
  });

  factory Workout.fromMap(Map<String, dynamic> data) {
    return Workout(
      caloria: data['caloria'] as num,
      categoryId: data['categoryId'] as int, 
      date: data['date'] as Timestamp,
      description: data['description'] as String,
      imageUrl: data['imageUrl'] as String,
      time: data['time'] as String,
      title: data['title'] as String,
      videoTime: data['videoTime'] as num,
      videos: List<String>.from(data['videos']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'caloria': caloria,
      'categoryId': categoryId,
      'date': date,
      'description': description,
      'imageUrl': imageUrl,
      'time': time,
      'title': title,
      'videoTime': videoTime,
      'videos': videos,
    };
  }
}
