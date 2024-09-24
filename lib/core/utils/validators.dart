class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your email';
    }
    // Email formatini tekshirish uchun RegExp
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(emailPattern);

    if (!regExp.hasMatch(value)) {
      return 'Enter your email correctly';
    }

    return null; // Email to'g'ri formatda
  }

  // Parol uchun validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter your password';
    } else if (value.length < 6) {
      return 'Your password must be at least 6 characters';
    }
    return null; // Hammasi yaxshi bo'lsa, null qaytadi
  }

  // Parolni tasdiqlash (confirm password) uchun validator
  static String? validateConfirmPassword(
      String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Confirm your password';
    } else if (value != originalPassword) {
      return 'Passwords don\'t match';
    }
    return null; // Hammasi yaxshi bo'lsa, null qaytadi
  }
}
