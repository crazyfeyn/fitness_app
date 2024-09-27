import 'package:equatable/equatable.dart';

abstract class ProfileEvents extends Equatable {
  const ProfileEvents();

  @override
  List<Object?> get props => [];
}

class UpdateProfileEvent extends ProfileEvents {
  final String? name;

  const UpdateProfileEvent({this.name});

  @override
  List<Object?> get props => [name];
}
