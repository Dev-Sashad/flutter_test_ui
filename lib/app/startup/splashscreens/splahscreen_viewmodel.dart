import 'package:flutter_test_ui/app/base/base_model.dart';
import 'package:flutter_test_ui/constants/route_names.dart';
import 'package:flutter_test_ui/core/services/navigation_service.dart';
import '../../locator.dart';

class SplashScreenViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  // bool hasLoggedInUser = false;

  // Future<bool> checkSession() async {
  //   await Future.delayed(Duration(seconds: 2), () {});
  //   return true;
  // }

  void navigateToPage() {
    _navigationService.navigateReplacementTo(SignUpViewRoute);
  }
}
