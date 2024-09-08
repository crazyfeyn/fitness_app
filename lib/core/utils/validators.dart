class Validator {
   static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email manzilini kiriting';
    }
    // Email formatini tekshirish uchun RegExp
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regExp = RegExp(emailPattern);

    if (!regExp.hasMatch(value)) {
      return 'Yaroqli email manzilini kiriting';
    }

    return null; // Email to'g'ri formatda
  }


  // Parol uchun validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Parolni kiriting';
    } else if (value.length < 6) {
      return 'Parol kamida 6 ta belgidan iborat bo\'lishi kerak';
    }
    return null; // Hammasi yaxshi bo'lsa, null qaytadi
  }

  // Parolni tasdiqlash (confirm password) uchun validator
  static String? validateConfirmPassword(
      String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Parolni tasdiqlang';
    } else if (value != originalPassword) {
      return 'Parollar mos kelmayapti';
    }
    return null; // Hammasi yaxshi bo'lsa, null qaytadi
  }
}