import 'package:equatable/equatable.dart';

sealed class OnboardingDeepStates extends Equatable {
  const OnboardingDeepStates();

  @override
  List<Object> get props => [];
}

class OnboardingDeepInitialState extends OnboardingDeepStates {
  const OnboardingDeepInitialState();
}

class OnboardingDeepLoadingState extends OnboardingDeepStates {
  const OnboardingDeepLoadingState();
}

class OnboardingDeepGenderState extends OnboardingDeepStates {
  final String gender;

  const OnboardingDeepGenderState(this.gender);

  @override
  List<Object> get props => [gender];
}

class OnboardingDeepAgeState extends OnboardingDeepStates {
  final int age;

  const OnboardingDeepAgeState(this.age);

  @override
  List<Object> get props => [age];
}

class OnboardingDeepWeightState extends OnboardingDeepStates {
  final int weight;

  const OnboardingDeepWeightState(this.weight);

  @override
  List<Object> get props => [weight];
}

class OnboardingDeepHeightState extends OnboardingDeepStates {
  final int height;

  const OnboardingDeepHeightState(this.height);

  @override
  List<Object> get props => [height];
}

class OnboardingDeepGoalState extends OnboardingDeepStates {
  final String goal;

  const OnboardingDeepGoalState(this.goal);

  @override
  List<Object> get props => [goal];
}

class OnboardingDeepPhysicalLevelState extends OnboardingDeepStates {
  final String physicalLevel;

  const OnboardingDeepPhysicalLevelState(this.physicalLevel);

  @override
  List<Object> get props => [physicalLevel];
}

class OnboardingDeepErrorState extends OnboardingDeepStates {
  final String message;

  const OnboardingDeepErrorState(this.message);
}

class OnboardingDeepSetUserInfoState extends OnboardingDeepStates {
  final String gender;
  final int age;
  final int weight;
  final int height;
  final String goal;
  final String physicalActivityLevel;

  const OnboardingDeepSetUserInfoState({
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.goal,
    required this.physicalActivityLevel,
  });
}