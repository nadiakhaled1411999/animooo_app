class FormValidators {
  const FormValidators._();

  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your email';
    if (!value.contains('@')) return 'Invalid email address';
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    if (value.length < 8) return 'Password must be at least 8 characters';
    return null;
  }

  static String? required(String? value, String message) {
    if (value == null || value.trim().isEmpty) return message;
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != password) return 'Passwords do not match';
    return null;
  }

  /// Validates a strong password using [passwordRequirements].
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    final isValid = passwordRequirements(value).every((r) => r.isValid);
    if (!isValid) return 'Password does not meet all requirements';
    return null;
  }

  /// Evaluates the password against the sign up requirements.
  static List<PasswordRequirement> passwordRequirements(String password) {
    return [
      PasswordRequirement(
        label: 'Minimum of 12 characters',
        isValid: password.length >= 12,
      ),
      PasswordRequirement(
        label: 'Contains an uppercase letter',
        isValid: password.contains(RegExp(r'[A-Z]')),
      ),
      PasswordRequirement(
        label: 'Contains a lowercase letter',
        isValid: password.contains(RegExp(r'[a-z]')),
      ),
      PasswordRequirement(
        label: 'Contains a number',
        isValid: password.contains(RegExp(r'[0-9]')),
      ),
      PasswordRequirement(
        label: 'Contains a special character',
        isValid: password.contains(RegExp(r'[^A-Za-z0-9]')),
      ),
    ];
  }
}

/// A single password strength requirement with its evaluation result.
class PasswordRequirement {
  const PasswordRequirement({
    required this.label,
    required this.isValid,
  });

  final String label;
  final bool isValid;
}
