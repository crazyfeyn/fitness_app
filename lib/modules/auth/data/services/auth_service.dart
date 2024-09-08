import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Ro'yxatdan o'tish
  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      rethrow;
    }
  }

  // Kirish
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      print("Kirishda xatolik: $e");
      rethrow;
    }
  }

  // Chiqish
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  // Autentifikatsiyani tekshirish
  Future<bool> checkAuthentication() async {
    User? currentUser = _firebaseAuth.currentUser;
    return currentUser != null;
  }
}
