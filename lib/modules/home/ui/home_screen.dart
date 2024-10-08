import 'package:flutter/material.dart';
import 'package:flutter_application/core/ui_kit/functions/general_functions.dart';
import 'package:flutter_application/modules/home/ui/widgets/net_workouts_widget.dart';
import 'package:flutter_application/modules/home/ui/widgets/workout_category.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  String? inputUserName;
  HomeScreen({super.key, String? inputUserName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String userName;

  @override
  void initState() {
    super.initState();
    userName = widget.inputUserName ?? "Sarah";
  }

  String getGreeting(BuildContext context) {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return AppLocalizations.of(context)!.good_morning;
    } else if (hour < 17) {
      return AppLocalizations.of(context)!.good_afternoon;
    } else if (hour < 20) {
      return AppLocalizations.of(context)!.good_evening;
    } else {
      return AppLocalizations.of(context)!.good_night;
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
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
                    "${localizations.hello} $userName",
                    style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/profileScreen'),
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffD0FD3E),
                          width: 3,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/kakao.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                getGreeting(context),
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localizations.today_workout_plan,
                    style: const TextStyle(
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
                          image: AssetImage("assets/images/t1.png"),
                          fit: BoxFit.cover)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.day,
                        style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      Text(
                        localizations.time,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffD0FD3E)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    localizations.workout_categories,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(
                    localizations.see_all,
                    style: const TextStyle(
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
                    WorkoutCategoryWidget(
                        imageUrl: "t1.png",
                        title: localizations.learn_basic_training,
                        subtitle: localizations.workouts_for_beginner,
                        rangeNumber: 2),
                    WorkoutCategoryWidget(
                        imageUrl: "t1.png",
                        title: localizations.learn_basic_training,
                        subtitle: localizations.workouts_for_beginner,
                        rangeNumber: 3),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                localizations.new_workouts,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    NetWorkoutsWidget(
                        imageUrl: 't1.png',
                        titleKey: localizations.workouts_for_beginner,
                        subtitleKey: 'new_workouts',
                        rangeNumber: 1),
                    NetWorkoutsWidget(
                        imageUrl: 't1.png',
                        titleKey: localizations.workouts_for_beginner,
                        subtitleKey: 'new_workouts',
                        rangeNumber: 1),
                    NetWorkoutsWidget(
                        imageUrl: 't1.png',
                        titleKey: localizations.workouts_for_beginner,
                        subtitleKey: 'new_workouts',
                        rangeNumber: 1),
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
