import 'package:flutter_application/modules/profile/data/services/profile_service.dart';

class ProfileRepository {
  final ProfileService _profileService;

  ProfileRepository({required ProfileService profileService})
      : _profileService = profileService;

  // Update user info
  Future<void> updateUserProfile({
    String? name,
  }) async {
    try {
      await _profileService.editUserInfo(
        name: name,
      );
    } catch (e) {
      throw Exception("Failed to update user info: $e");
    }
  }
}
