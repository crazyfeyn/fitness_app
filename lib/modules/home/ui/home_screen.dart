import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/functions/general_functions.dart';
import 'package:flutter_application/modules/home/ui/widgets/net_workouts_widget.dart';
import 'package:flutter_application/modules/home/ui/widgets/workout_category.dart';

class HomeScreen extends StatefulWidget {
  //!username qabul qilib ol
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String userName = "Sarah";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1E),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "HELLO ${userName.toUpperCase()},",
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, '/profileScreen'),
                      child: const CircleAvatar(child: Icon(Icons.person)))
                ],
              ),
              const Text(
                "Good morning",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today Workout Plan",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    GeneralFunctions.formatDate(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffD0FD3E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/workoutScreen',
                    arguments: {'rangeNumber': 1}),
                child: Container(
                  width: double.infinity,
                  height: 190,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image:
                              AssetImage("assets/images/onboarding_first.png"),
                          fit: BoxFit.cover)),
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Day 01 - Warm Up",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        "07:00 - 08:00 AM",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffD0FD3E)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Workout Categories",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD0FD3E)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    WorkoutCategoryWidget(
                        imageUrl: "onboarding_first.png",
                        title: "Learn the Basic of Training",
                        subtitle: "06 Workouts for Beginner",
                        rangeNumber: 2),
                    WorkoutCategoryWidget(
                        imageUrl: "onboarding_first.png",
                        title: "Learn the Basic of Training",
                        subtitle: "06 Workouts for Beginner",
                        rangeNumber: 3),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "New Workouts",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: const Row(
                  children: [
                    NetWorkoutsWidget(
                        imageUrl: "onboarding_first.png",
                        title: "Learn the Basic of Training",
                        subtitle: "06 Workouts for Beginner",
                        rangeNumber: 4),
                    NetWorkoutsWidget(
                        imageUrl: "onboarding_first.png",
                        title: "Learn the Basic of Training",
                        subtitle: "06 Workouts for Beginner",
                        rangeNumber: 5),
                    NetWorkoutsWidget(
                        imageUrl: "onboarding_first.png",
                        title: "Learn the Basic of Training",
                        subtitle: "06 Workouts for Beginner",
                        rangeNumber: 5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
