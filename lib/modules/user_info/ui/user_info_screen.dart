import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/modules/user_info/model/user_info_model.dart';
import 'package:flutter_application/modules/user_info/ui/bloc/onboarding_deep_bloc.dart';
import 'package:flutter_application/modules/user_info/ui/bloc/onboarding_deep_events.dart';
import 'package:flutter_application/modules/user_info/ui/bloc/onboarding_deep_states.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/activity_level_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/age_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/gender_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/goal_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/height_selector.dart';
import 'package:flutter_application/modules/user_info/ui/widgets/weight_selector.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 

class UserInfoScreen extends StatefulWidget {
  final String email;
  final String password;
  const UserInfoScreen(
      {super.key, required this.email, required this.password});

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

  String? getCurrentUserUid() {
    User? user = FirebaseAuth.instance.currentUser;
    return user?.uid;
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
      String? uid = getCurrentUserUid();
      if (uid != null) {
        context.read<OnboardingDeepBloc>().add(
              OnboardingDeepSetUserInfoEvent(
                UserInfoModel(
                  name: 'Teddy',
                  weight: weight + 1,
                  age: age + 1,
                  email: widget.email,
                  gender: isMale ? 'male' : 'female',
                  goal: goalList[goalIndex],
                  height: height + 1,
                  level: activityLevelList[activityLevelIndex],
                  uid: uid,
                ),
              ),
            );
        Navigator.pushReplacementNamed(context, '/homeScreen');
      }
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
    return BlocBuilder<OnboardingDeepBloc, OnboardingDeepStates>(
      builder: (context, state) {
        if (state is OnboardingDeepLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OnboardingDeepErrorState) {
          return Center(
            child: Text(state.message),
          );
        }
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
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 80),
                            Text(
                              AppLocalizations.of(context)!.userInfoTitle,
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily: "Integral CF",
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 2.5,
                              ),
                            ),
                             Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 65),
                              child: Text(
                                AppLocalizations.of(context)!.userInfoSubtitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
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

                        AgeSelector(
                          currentIndex: age,
                          onAgeSelect: onAgeSelect,
                        ),
                        WeightSelector(
                          weight: weight,
                          onWeightSelected: onWeightSelected,
                        ),
                        // Fourth page - Height selection
                        HeightSelector(
                          currentIndex: height,
                          onHeightSelected: onHeightSelected,
                        ),
                        // Fifth page - Goal selection
                        GoalSelector(
                          currentIndex: goalIndex,
                          onGoalSelected: onGoalSelected,
                          goalList: goalList,
                        ),
                        // Sixth page - Activity level selection
                        ActivitySelector(
                          currentIndex: activityLevelIndex,
                          onActivityLevelSelected: onActivityLevelSelected,
                          activityLevelList: activityLevelList,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: _previousPage,
                          child: const Text("Previous"),
                        ),
                        TextButton(
                          onPressed: _nextPage,
                          child: Text(
                            _currentPage < 5
                                ? AppLocalizations.of(context)!.next
                                : AppLocalizations.of(context)!.done,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
