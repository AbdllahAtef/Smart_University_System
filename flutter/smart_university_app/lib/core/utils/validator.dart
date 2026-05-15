class Validators {
  static String? required(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }

    final trimmed = value.trim();

    if (trimmed.length > 254) {
      return 'Email is too long';
    }

    if (trimmed.length < 5) {
      return 'Email is too short';
    }

    if (trimmed.contains(' ')) {
      return 'Email must not contain spaces';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(trimmed)) {
      return 'Enter a valid email';
    }

    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (value.length > 128) {
      return 'Password is too long';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Must contain uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Must contain lowercase letter';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Must contain number';
    }

    return null;
  }

  static String? loginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    return null;
  }

  static String? nationalId(String? value) {
    if (value == null || value.isEmpty) {
      return 'ID is required';
    }

    if (value.length != 14) {
      return 'ID must be 14 digits';
    }

    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }

    if (value != password) {
      return 'Passwords do not match';
    }

    return null;
  }

  static Map<String, String> validateLoginCredentials({
    required String email,
    required String password,
  }) {
    final errors = <String, String>{};

    final emailError = Validators.email(email);

    final passwordError = Validators.loginPassword(password);

    if (emailError != null) {
      errors['email'] = emailError;
    }

    if (passwordError != null) {
      errors['password'] = passwordError;
    }

    return errors;
  }
}
