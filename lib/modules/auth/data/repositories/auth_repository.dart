import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/modules/auth/data/services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository({required AuthService authService})
      : _authService = authService;

  // Ro'yxatdan o'tish
  Future<User?> register(String email, String password) async {
    return await _authService.register(email, password);
  }

  // Kirish
  Future<User?> login(String email, String password) async {
    return await _authService.login(email, password);
  }

  // Chiqish
  Future<void> logout() async {
    return await _authService.logout();
  }

  // Autentifikatsiyani tekshirish
  Future<bool> checkAuthentication() async {
    return await _authService.checkAuthentication();
  }
}