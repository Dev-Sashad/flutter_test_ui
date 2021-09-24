import 'package:flutter/cupertino.dart';
import 'package:flutter_test_ui/app/base/base_model.dart';
import 'package:flutter_test_ui/constants/route_names.dart';
import 'package:flutter_test_ui/core/services/navigation_service.dart';
import 'package:flutter_test_ui/utils/helpers/helpers.dart';
import '../../locator.dart';

class SignUpViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  String _name;
  String get name => _name;
  setName(String value) {
    _name = value;
    notifyListeners();
  }

  String _password;
  String get password => _password;
  setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  String _email;
  String get email => _email;
  setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  String _username;
  String get username => _username;
  setUserName(String value) {
    _username = value;
    notifyListeners();
  }

  Future<void> onSignUp(BuildContext context) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 2)).then((value) async {
      setBusy(false);
      await showFlushBar(
          title: 'Account Successfully Created',
          message: 'Dear $username, you can now Sign in',
          context: context);
      await Future.delayed(Duration(seconds: 4))
          .then((value) => navigateToSignIn());
    });
  }

  void navigateToSignIn() {
    _navigationService.navigateTo(SignInViewRoute);
  }

  void pop() {
    _navigationService.pop();
  }
}
