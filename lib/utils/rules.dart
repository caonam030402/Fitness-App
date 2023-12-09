class RegExps {
  static RegExp password = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  static RegExp email = RegExp(r'\S+@\S+\.\S+');
}

class Rules {
  static isRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  static isEmail(String? value) {
    if (!RegExps.email.hasMatch(value!)) {
      return 'Please enter email format';
    }
  }

  static isPassword(String? value) {
    if (!RegExps.password.hasMatch(value!)) {
      return 'Password should contain Capital, small letter &...';
    }
  }

  static isCheckLength(String? value, int minLength, int maxLength) {
    if ((value != null ? value.length : 0) < minLength) {
      return 'You need to enter more than $minLength characters';
    }
    if ((value != null ? value.length : 0) > maxLength) {
      return 'You need to enter less than $maxLength characters';
    }
    return null;
  }
}

class RulesValidator {
  static validatorName(String? value) {
    return Rules.isRequired(value) ?? Rules.isCheckLength(value, 6, 15);
  }

  static validatorEmail(String? value) {
    return Rules.isRequired(value) ??
        Rules.isCheckLength(value, 6, 30) ??
        Rules.isEmail(value);
  }

  static validatorPassword(String? value) {
    return Rules.isRequired(value) ??
        Rules.isCheckLength(value, 6, 30) ??
        Rules.isPassword(value);
  }
}
