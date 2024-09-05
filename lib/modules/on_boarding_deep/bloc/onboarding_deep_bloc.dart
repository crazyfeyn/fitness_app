// ignore: file_names
import 'package:flutter_application/modules/on_boarding_deep/bloc/onboarding_deep_events.dart';
import 'package:flutter_application/modules/on_boarding_deep/bloc/onboarding_deep_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingDeepBloc
    extends Bloc<OnboardingDeepEvents, OnboardingDeepStates> {
  OnboardingDeepBloc() : super(const OnboardingDeepInitialState()) {
    on<OnboardingDeepEventsGender>(_onboardingDeepEventsGender());
  }
}

_onboardingDeepEventsGender() {}
