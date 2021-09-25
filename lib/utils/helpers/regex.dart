final bool Function(String) emailRegEx = (String emailText) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(emailText);
};

final bool Function(String) emailorphoneRegEx = (String text) {
  return emailRegEx(text);
};

final bool Function(String) passwordRegEx = (String password) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(password);
};

final bool Function(String) phoneRegEx = (String phone) {
  return RegExp(r"(^[\+]?[234]\d{12}$)").hasMatch(phone);
};

// String Function(String) emailPhoneVal = (val) {
//   if (val.isEmpty) {
//     return 'Please enter e-mail or phone number';
//   } else if (emailorphoneRegEx(val)) {
//     return null;
//   } else {
//     return 'Enter a valid e-mail or phone number';
//   }
// };

String Function(String) phoneVal = (val) {
  if (val.isEmpty) {
    return 'field can\'t be empty';
  } else if (phoneRegEx(val) && val.length == 14) {
    return null;
  } else {
    return 'Enter a valid phone number';
  }
};

String Function(String) emailVal = (val) {
  if (val.isEmpty) {
    return 'enter your email';
  } else if (emailRegEx(val)) {
    return null;
  } else {
    return 'enter a valid email';
  }
};

String Function(String) passwordVal = (val) {
  if (val.isEmpty || val.length < 8) {
    return 'password should contain 8 cha';
  } else if (passwordRegEx(val)) {
    return null;
  } else {
    return 'example: Abc123!';
  }
};

String Function(String) nameVal = (val) {
  if (val.isEmpty) {
    return 'Please enter your full name';
  }
  if (val.length < 3) {
    return 'enter valid names';
  } else
    return null;
};

String Function(String) paymentVal = (val) {
  RegExp digit = new RegExp(r'[0-9]');
  String error = 'enter a valid amount';
  String reject = 'minimum amount is NGN 1000';
  if (!digit.hasMatch(val)) {
    return error;
  } else if (val.length < 3 || int.parse(val) < 1000) {
    return reject;
  }
  //  if (int.parse(val) < 1000) {
  //   return reject;
  // }

  else
    return null;
};

String Function(String) usernameVal = (value) {
  RegExp lowerCase = new RegExp(r'[a-z]');
  RegExp digit = new RegExp(r'[0-9]');

  if (!lowerCase.hasMatch(value)) {
    return 'username should contain figure and letters';
  }

  if (!digit.hasMatch(value)) {
    return 'username should contain figure and letters';
  } else if (value.length < 8) {
    return 'username should contain 8 characters';
  } else
    return null;
};
