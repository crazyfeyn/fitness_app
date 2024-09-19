import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application/modules/home/ui/widgets/rest_widget.dart';

class WorkoutScreen extends StatefulWidget {
  final List<String> workoutList;

  const WorkoutScreen({super.key, required this.workoutList});

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late PageController _pageController;
  final ValueNotifier<int> _remainingTimeNotifier = ValueNotifier<int>(10);
  Timer? _timer;
  bool isRest = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startTimer();
  }

  void addTime(int seconds) {
    _remainingTimeNotifier.value += seconds;
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTimeNotifier.value > 0) {
          _remainingTimeNotifier.value--;
        } else {
          if (isRest) {
            setState(() {
              isRest = false;
              _remainingTimeNotifier.value = 40;
            });
          } else {
            if (_pageController.page!.toInt() < widget.workoutList.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              setState(() {
                _remainingTimeNotifier.value = 10;
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
      _remainingTimeNotifier.value = 0; // Skip to next state
      if (isRest) {
        isRest = false;
        _remainingTimeNotifier.value = 40; // Set exercise time
      } else {
        if (_pageController.page!.toInt() < widget.workoutList.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
          _remainingTimeNotifier.value = 10; // Reset rest time
          isRest = true; // Start next rest period
        } else {
          _timer?.cancel(); // Stop the timer when all pages are done
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    _remainingTimeNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFCFE),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Workout'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.workoutList.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!isRest)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    widget.workoutList[index],
                    height: 200,
                  ),
                ),
              ValueListenableBuilder<int>(
                valueListenable: _remainingTimeNotifier,
                builder: (context, remainingTime, child) {
                  return RestWidget(
                    initialRemainingTime: remainingTime,
                    isRest: isRest,
                    onSkipRest: _handleSkip,
                    onAddTime: addTime,
                  );
                },
              ),
              if (!isRest)
                const Column(
                  children: [
                    Text(
                      'Start Exercising!',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
