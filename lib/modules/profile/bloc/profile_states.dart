import 'package:equatable/equatable.dart';

sealed class ProfileStates extends Equatable {
  const ProfileStates();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileStates {}
class ProfileLoadingState extends ProfileStates {}

class ProfileLoadedState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  final String message;

  const ProfileErrorState(this.message);
}
