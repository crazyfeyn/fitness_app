import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
               GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/profileScreen'),
                 child: const Text(
                  "HELLO SARAH,",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                               ),
               ),
              const Text(
                "Good morning",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today Workout Plan",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    "Mon 26 Apr",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffD0FD3E)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/onboarding_first.png"),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    workoutCategoriy(
                        "onboarding_first.png",
                        "Learn the Basic of Training",
                        "06 Workouts  for Beginner"),
                    workoutCategoriy(
                        "onboarding_first.png",
                        "Learn the Basic of Training",
                        "06 Workouts  for Beginner"),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    newWorkouts(
                        "onboarding_first.png",
                        "Learn the Basic of Training",
                        "06 Workouts  for Beginner"),
                    newWorkouts(
                        "onboarding_first.png",
                        "Learn the Basic of Training",
                        "06 Workouts  for Beginner"),
                    newWorkouts(
                        "onboarding_first.png",
                        "Learn the Basic of Training",
                        "06 Workouts  for Beginner"),
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

Widget workoutCategoriy(String imageUrl, String title, String subtitle) {
  return Row(
    children: [
      Container(
        width: 350,
        height: 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage("assets/images/$imageUrl"),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffD0FD3E)),
            ),
          ],
        ),
      ),
      const SizedBox(width: 20)
    ],
  );
}

Widget newWorkouts(String imageUrl, String title, String subtitle) {
  return Row(
    children: [
      Container(
        width: 200,
        height: 190,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: AssetImage("assets/images/$imageUrl"),
                fit: BoxFit.cover)),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Text(
              subtitle,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffD0FD3E)),
            ),
          ],
        ),
      ),
      const SizedBox(width: 20)
    ],
  );
}
