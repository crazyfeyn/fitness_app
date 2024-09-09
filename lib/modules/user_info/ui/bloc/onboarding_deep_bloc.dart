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
      Emitter<OnboardingDeepStates> emit) async {
    emit(const OnboardingDeepLoadingState());
    try {
      print('first');
      await userService.addUser(userInfoModel: event.userInfoModel);
      emit(OnboardingDeepSetUserInfoState(userInfoModel: event.userInfoModel));
      print('second');
    } catch (e) {
      emit(OnboardingDeepErrorState(e.toString()));
    }
  }
}
