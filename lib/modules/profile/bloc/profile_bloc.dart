import 'package:flutter_application/modules/profile/bloc/profile_events.dart';
import 'package:flutter_application/modules/profile/bloc/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileEvents>((event, emit) {});
  }
}
