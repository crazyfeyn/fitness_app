// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

sealed class OnboardingDeepEvents extends Equatable {
  const OnboardingDeepEvents();

  @override
  List<Object> get props => [];
}

class OnboardingDeepEventsGender extends OnboardingDeepEvents {
  String gender;

  OnboardingDeepEventsGender(this.gender);
}

class OnboardingDeepEventsAge extends OnboardingDeepEvents {
  int age;
  OnboardingDeepEventsAge(this.age);
}

class OnboardingDeepEventsWeight extends OnboardingDeepEvents {
  double weight;
  OnboardingDeepEventsWeight(this.weight);
}

class OnboardingDeepEventsHeight extends OnboardingDeepEvents {
  double height;

  OnboardingDeepEventsHeight(this.height);
}

class OnboardingDeepEventsGoal extends OnboardingDeepEvents {
  String goal;
  OnboardingDeepEventsGoal(this.goal);
}

class OnboardingDeepEventsPhysicalLevel extends OnboardingDeepEvents {
  String physicalLevel;

  OnboardingDeepEventsPhysicalLevel(this.physicalLevel);
}
