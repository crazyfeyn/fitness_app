import 'package:equatable/equatable.dart';

abstract class ProfileStates extends Equatable {
  const ProfileStates();

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileStates {}

class ProfileLoadingState extends ProfileStates {}

class ProfileUpdatedState extends ProfileStates {}

class ProfileErrorState extends ProfileStates {
  final String error;

  const ProfileErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class UserProfileLoadedState extends ProfileStates {
  final String? name;
  final String? email;

  const UserProfileLoadedState({this.name, this.email});

  @override
  List<Object?> get props => [name, email];
}
