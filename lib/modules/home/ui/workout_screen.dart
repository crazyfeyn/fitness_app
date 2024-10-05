import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/workouts.dart';
import 'package:flutter_application/modules/home/ui/widgets/rest_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class WorkoutScreen extends StatefulWidget {
  final int rangeNumber;

   const WorkoutScreen({super.key, required this.rangeNumber});

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<String>? workoutList = [];
  late PageController _pageController;
  int _remainingTime = 10;
  Timer? _timer;
  bool isRest = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    if (widget.rangeNumber == 1) {
      workoutList = Workouts.workouts_1;
    } else if (widget.rangeNumber == 2) {
      workoutList = Workouts.workouts_2;
    } else if (widget.rangeNumber == 3) {
      workoutList = Workouts.workouts_3;
    } else if (widget.rangeNumber == 4) {
      workoutList = Workouts.workouts_4;
    } else if (widget.rangeNumber == 5) {
      workoutList = Workouts.workouts_5;
    }

    if (workoutList != null && workoutList!.isNotEmpty) {
      _startTimer();
    }
  }

  void addTime(int seconds) {
    setState(() {
      _remainingTime += seconds;
    });
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          if (isRest) {
            setState(() {
              isRest = false;
              _remainingTime = 40;
            });
          } else {
            if (_pageController.hasClients &&
                _pageController.page != null &&
                _pageController.page!.toInt() < workoutList!.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {
                _remainingTime = 10;
                isRest = true;
              });
            } else {
              _timer?.cancel();
            }
          }
        }
      });
    });
  }

  void _handleSkip() {
    setState(() {
      _remainingTime = 0;
      if (isRest) {
        isRest = false;
        _remainingTime = 60;
      } else {
        if (_pageController.hasClients &&
            _pageController.page != null &&
            _pageController.page!.toInt() < workoutList!.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          _remainingTime = 10;
          isRest = true;
        } else {
          _timer?.cancel();
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations =
        AppLocalizations.of(context)!; 

    return Scaffold(
      backgroundColor:
          isRest ? const Color(0xFF005FFF) : const Color(0xFFFCFCFE),
      body: workoutList == null || workoutList!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: _pageController,
              itemCount: workoutList!.length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                if (index == workoutList!.length - 1 && !isRest) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xFF3375FF),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            ),
                          ),
                          child: Text(
                            localizations
                                .workoutCompleted, // Use localized string
                            style: const TextStyle(
                              fontSize: 27,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Flexible(
                        flex: 5,
                        child: Row(children: [
                          Lottie.asset(
                            'assets/animations/celebration.json',
                            height: 500,
                            width: 400,
                            repeat: true,
                          ),
                        ]),
                      ),
                      Flexible(
                        flex: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const CircleAvatar(
                              radius: 75,
                              backgroundColor: Color(0xFF005FFF),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 60,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isRest)
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset(
                            workoutList![index],
                            height: 200,
                          ),
                        ),
                      RestWidget(
                        remainingTime: _remainingTime,
                        isRest: isRest,
                        onSkipRest: _handleSkip,
                        onAddTime: addTime,
                      ),
                      if (!isRest)
                        Container(
                          width: double.infinity,
                          height: 200,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: Color(0xFF005FFF),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Text(
                            localizations
                                .startExercising, // Use localized string
                            style: const TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  );
                }
              },
            ),
    );
  }
}
