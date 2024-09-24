import 'package:equatable/equatable.dart';

sealed class ProfileEvents extends Equatable {
  const ProfileEvents();

  @override
  List<Object?> get props => [];
}

class EditProfileEvent extends ProfileEvents {
  final String? name;
  final String? email;
  final String? photo;

  const EditProfileEvent(
      {required this.name, required this.email, required this.photo});
}
