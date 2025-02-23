import 'dart:developer';


class Validator {
  static String? validatePassword({required String string}) {
    if (string.isEmpty) {
      return "* Required";
    } else if (string.length < 8) {
      return "Password should be at least 8 characters";
    } else if (string.length > 20) {
      return "Password should not be greater than 20 characters";
    } else if (!RegExp(r'[A-Z]').hasMatch(string)) {
      return "Password should contain at least one uppercase letter";
    } else if (!RegExp(r'[a-z]').hasMatch(string)) {
      return "Password should contain at least one lowercase letter";
    } else if (!RegExp(r'[0-9]').hasMatch(string)) {
      return "Password should contain at least one digit";
    } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(string)) {
      return "Password should contain at least one special character";
    }
    return null;
  }

  static String? validateUsername({required String string}) {
    if (string.isEmpty) {
      return "* Required";
    } else if (string.length < 4) {
      return "Username should be at least 4 characters";
    } else if (string.length > 20) {
      return "Username should not be greater than 20 characters";
    } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(string)) {
      return "Username can only contain letters, numbers, and underscores";
    } else if (RegExp(r'^\d').hasMatch(string)) {
      return "Username cannot start with a number";
    }
    return null;
  }


  static String? confirmPassword(
      {required String password, required String cPassword}) {
    print("pw::$password");
    print("cpw::$cPassword");

    if (password == cPassword) {
      return null;
    } else {
      return "Passwords do not match.";
    }
  }

  /// email validator
  static String? validateEmail({required String string}) {
    String regex =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (string.isEmpty) return "* Required";
    if (!validRegexExp(regex, string)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String? validatePhone({required String string}) {
    if (string.isEmpty) {
      return "* Required";
    } else if (string.length < 10) {
      return "Phone should be at least 10 characters";
    } else if (string.length > 10) {
      return "Phone should not be greater than 10 characters";
    } else {
      return null;
    }
  }

  /// validate min length
  static String? validateMinLength(
      {required String string, required int length}) {
    return (string.length < length && string.isEmpty)
        ? "${"It must be greater than"} $length ${"characters"}"
        : null;
  }

  /// validate max length
  static String? validateMaxLength({required String string, int length = 4}) {
    return string.length > length
        ? "${"It must not exceed"} $length ${"characters"}"
        : null;
  }

  /// validate empty string
  static String? validateIsEmpty({required String string}) {
    return string.isEmpty ? "* Required" : null;
  }

  static String? validateIsNull({required Object? object}) {
    return object == null ? "* Required" : null;
  }

  /// validate empty string
  static String? validateIsListEmpty({required List<String> items}) {
    return items.isEmpty ? "* Required" : null;
  }

  static String? validateNothing({required String string}) {
    return string.isEmpty ? null : null;
  }

  /// validate min-max length
  static String? validateMinMaxLength(
      {required String string, int minLength = 1, int maxLength = 10}) {
    return (string.length < minLength || string.length > maxLength)
        ? "${"It must be between"} $minLength ${"add"} $maxLength ${
        "characters"}"
        : null;
  }

  /// validate min-max length with regex
  static String? validateMinMaxLengthWithRegex({required String string,
    int minLength = 1,
    int maxLength = 10,
    required String regex,
    String regexMessage = ("Invalid data")}) {
    if (string.length < minLength || string.length > maxLength) {
      return "${"It must be between"} $minLength ${"add"} $maxLength ${"characters"}";
    } else if (!validRegexExp(regex, string)) {
      return regexMessage;
    } else {
      return null;
    }
  }

  /// validate regex for the string
  static bool validRegexExp(String regex, String string) {
    return RegExp(regex).hasMatch(string);
  }

  static String? validateIsPositiveInteger({required String string}) {
    bool result = false;
    try {
      int value = int.parse(string);
      if (value >= 0) {
        result = true;
      }
    } catch (e) {
      log("validateIsPositiveInteger:${e.toString()}");
    }
    if (string.isEmpty) {
      return "* Required";
    } else {
      return result == true ? null : "Invalid number";
    }
  }


  ///checks if the given hid is less than 7 digit

  static String? validateHid({required String string}) {
    if (string.isEmpty) {
      return "* Required";
    } else if (string.length!=7) {
      return "HealthConnectId should be of 7 digits";
    } else {
      return null;
    }
  }
  //
  // ///checks if the given string is positive double or not
  // static String? validateIsPositiveNumber({required String string}) {
  //   bool result = false;
  //   try {
  //     double value = double.parse(string);
  //     if (value >= 0) {
  //       result = true;
  //     }
  //   } catch (e) {
  //     log("validateIsPositiveNumber:${e.toString()}");
  //   }
  //   if (string.isEmpty) {
  //     return "* Required";
  //   } else {
  //     return result == true ? null : "Positive value required");
  //   }
  // }

  // ///this does not check if empty
  // static String? validateIsNumber({required String string}) {
  //   bool result = false;
  //   try {
  //     double.parse(string);
  //     result = true;
  //   } catch (e) {
  //     log("validateIsNumber:${e.toString()}");
  //   }
  //   if (string.isEmpty) {
  //     return null;
  //   } else {
  //     return result == true ? null : tr("Invalid number");
  //   }
  // }

// check if the input data is positive only if the field is not empty

}
