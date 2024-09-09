import 'package:flutter_application/modules/user_info/services/user_service.dart';
import 'package:flutter_application/modules/user_info/ui/bloc/onboarding_deep_events.dart';
import 'package:flutter_application/modules/user_info/ui/bloc/onboarding_deep_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingDeepBloc
    extends Bloc<OnboardingDeepEvents, OnboardingDeepStates> {
  OnboardingDeepBloc() : super(const OnboardingDeepInitialState()) {
    on<OnboardingDeepSetUserInfoEvent>(_onSetUserInfo);
  }

  final userService = UserService();

  void _onSetUserInfo(OnboardingDeepSetUserInfoEvent event,
      Emitter<OnboardingDeepStates> emit) {
    emit(const OnboardingDeepLoadingState());
    try {
      // userService.addUser(name: event, age: age, email: email, gender: gender, goal: goal, height: height, level: level, weight: weight)
      emit(OnboardingDeepSetUserInfoState(
       userInfoModel: event.userInfoModel
      ));
    } catch (e) {
      emit(OnboardingDeepErrorState(e.toString()));
    }
  }
}
