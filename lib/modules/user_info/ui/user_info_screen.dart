import 'package:flutter/material.dart';
import 'package:flutter_application/core/constants/app_constants.dart';
import 'package:flutter_application/modules/user_info/model/user_info_model.dart';
import 'package:flutter_application/modules/user_info/ui/bloc/onboarding_deep_bloc.dart';
import 'package:flutter_application/modules/user_info/ui/bloc/onboarding_deep_events.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/activity_level_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/age_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/gender_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/goal_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/height_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/weight_selector.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoScreen extends StatefulWidget {
  String email;
  String password;
  UserInfoScreen({super.key, required this.email, required this.password});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  bool isMale = true;
  late PageController _pageController;
  int _currentPage = 0;
  int age = 0;
  int weight = 0;
  int height = 0;
  int goalIndex = 0;
  int activityLevelIndex = 0;
  List<String> goalList = [
    'Gain weight',
    'Lose weight',
    'Get Fitter',
    'Gain more flexible',
    'Learn the basic'
  ];
  List<String> activityLevelList = [
    'Rookie',
    'Beginner',
    'Intermediate',
    'Advance',
    'True best'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void onAgeSelect(index) {
    setState(() {
      age = index;
    });
  }

  void onWeightSelected(int index) {
    setState(() {
      weight = index;
    });
  }

  void onHeightSelected(int index) {
    setState(() {
      height = index;
    });
  }

  void _setGender(bool gender) {
    setState(() {
      isMale = gender;
    });
  }

  void onGoalSelected(int index) {
    setState(() {
      goalIndex = index;
    });
  }

  void onActivityLevelSelected(int index) {
    setState(() {
      activityLevelIndex = index;
    });
  }

  void _nextPage() {
    if (_currentPage < 5) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      BlocProvider(
        create: (context) => OnboardingDeepBloc()
          ..add(
            OnboardingDeepSetUserInfoEvent(UserInfoModel(
                name: 'replacement name',
                weight: AppConstants.weight,
                age: AppConstants.age,
                email: widget.email,
                gender: AppConstants.gender,
                goal: AppConstants.goal,
                height: AppConstants.height,
                level: AppConstants.physicalActivityLevel)),
          ),
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.email);
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable swipe
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 80),
                          const Text(
                            "Tell us about yourself!",
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Integral CF",
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              height: 2.5,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 65),
                            child: Text(
                              "To give you a better experience we need to know your gender",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 13,
                                fontFamily: "Integral CF",
                                color: Colors.white,
                                height: 1.5,
                              ),
                            ),
                          ),
                          const SizedBox(height: 100),
                          GenderSelector(
                            isMale: isMale,
                            onGenderSelected: _setGender,
                          ),
                        ],
                      ),

                      // Second page - Age selection
                      AgeSelector(currentIndex: age, onAgeSelect: onAgeSelect),
                      //third page - Weight selection
                      WeightSelector(
                          weight: weight, onWeightSelected: onWeightSelected),
                      //fourth page - Weight selection
                      HeightSelector(
                          currentIndex: height,
                          onHeightSelected: onHeightSelected),
                      //fourth page - Weight selection
                      GoalSelector(
                          currentIndex: goalIndex,
                          onGoalSelected: onGoalSelected,
                          goalList: goalList),
                      //fifth page - Weight selection
                      ActivitySelector(
                          currentIndex: activityLevelIndex,
                          onActivityLevelSelected: onActivityLevelSelected,
                          activityLevelList: activityLevelList),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: _currentPage > 0
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: [
                      if (_currentPage > 0)
                        SizedBox(
                          width: 120,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD0FD3E),
                              foregroundColor: Colors.black,
                            ),
                            onPressed: _previousPage, // Move to next page
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Pre",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(Icons.keyboard_arrow_left),
                              ],
                            ),
                          ),
                        ),
                      SizedBox(
                        width: 120,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFD0FD3E),
                            foregroundColor: Colors.black,
                          ),
                          onPressed: _nextPage, // Move to next page
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_right),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
