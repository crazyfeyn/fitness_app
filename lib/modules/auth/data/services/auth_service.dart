import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'email-already-in-use':
            print('The email is already in use.');
            break;
          case 'invalid-email':
            print('The email address is not valid.');
            break;
          case 'weak-password':
            print('The password is too weak.');
            break;
          default:
            print('Firebase Auth Error: ${e.message}');
        }
      } else {
        print('Unknown error: $e');
      }
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

  // Tokenni olish
  Future<String?> getToken() async {
    try {
      User? currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        String? token = await currentUser.getIdToken();
        return token;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  // Tokenni yangilash
  Future<String?> refreshToken() async {
    try {
      User? currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        String? token = await currentUser.getIdToken(true); // force refresh
        return token;
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
