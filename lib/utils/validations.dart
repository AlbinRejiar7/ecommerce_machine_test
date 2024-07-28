class Validations {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);

    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    const passwordPattern =
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%\^&\*]).{8,}$';
    final regex = RegExp(passwordPattern);

    if (!regex.hasMatch(value)) {
      return 'Password must include upper, lower, number, and special character';
    }

    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }
}
