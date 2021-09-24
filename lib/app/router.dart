import 'package:flutter/material.dart';
import 'package:flutter_test_ui/constants/route_names.dart';
import 'auth_screen/sign_in/signin_view.dart';
import 'auth_screen/sign_up/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SignInViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignInView(),
      );
    case SignUpViewRoute:
      //var phoneNumber = settings.arguments as String;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(
            // phoneNumber: phoneNumber,
            ),
      );

    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
