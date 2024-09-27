import 'package:flutter_application/modules/profile/bloc/profile_events.dart';
import 'package:flutter_application/modules/profile/bloc/profile_states.dart';
import 'package:flutter_application/modules/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository})
      : super(ProfileInitialState()) {
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

  Future<void> _onUpdateProfile(
      UpdateProfileEvent event, Emitter<ProfileStates> emit) async {
    emit(ProfileLoadingState());
    try {
      await profileRepository.updateUserProfile(
        name: event.name,
      );
      emit(ProfileUpdatedState());
    } catch (e) {
      emit(ProfileErrorState("Failed to update profile: $e"));
    }
  }
}
