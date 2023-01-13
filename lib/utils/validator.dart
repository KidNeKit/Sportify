class Validator {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email should be filled';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password should be filled';
    } else if (value.length < 8) {
      return 'Password length should be more than 8 characters';
    }
    return null;
  }
}
