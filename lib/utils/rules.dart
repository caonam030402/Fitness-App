import 'package:intl/intl.dart';

class RegExps {
  static RegExp password = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  static RegExp email = RegExp(r'\S+@\S+\.\S+');
  static RegExp number = RegExp(r'^[0-9]+$');
}

class Rules {
  static isRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Information cannot be left blank';
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

  static isConfirmPassword(String? value, String? valuePassword) {
    if (value != valuePassword) {
      return 'Password incorrect';
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

  static isCheckWeight(String? value) {
    if (value == null ||
        !RegExps.number.hasMatch(value) ||
        !(int.parse(value) > 0 && int.parse(value) < 150)) {
      return 'Please enter correct height';
    }
  }

  static isCheckHeight(String? value) {
    if (value == null ||
        !RegExps.number.hasMatch(value) ||
        !(double.parse(value) > 0 && double.parse(value) < 250)) {
      return 'Please enter correct height';
    }
  }
}

class RulesValidator {
  static validatorWeight(String? value) {
    return Rules.isCheckWeight(value);
  }

  static validatorHeight(String? value) {
    return Rules.isCheckHeight(value);
  }

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

  static validatorConfirmPassword(String? value, String? valuePassword) {
    return Rules.isRequired(value) ??
        Rules.isConfirmPassword(value, valuePassword);
  }
}
