import 'package:flutter_test_ui/app/base/base_model.dart';
import 'package:flutter_test_ui/constants/route_names.dart';
import 'package:flutter_test_ui/core/services/navigation_service.dart';
import 'package:flutter_test_ui/utils/helpers/helpers.dart';
import '../../locator.dart';

class SignInViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String _username;
  String get username => _username;
  setUserName(String value) {
    _username = value;
    notifyListeners();
  }

  String _password;
  String get password => _password;
  setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void navigateToSignUp() {
    _navigationService.navigateTo(SignUpViewRoute);
  }

  Future<void> signIn() async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 2)).then((value) {
      setBusy(false);
      showToast('Welcome back $username');
    });
  }

  void pop() {
    _navigationService.pop();
  }
}
