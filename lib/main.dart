import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_ui/utils/progressBarManager/progressManager.dart';
import 'app/router.dart';
import 'app/locator.dart';
import 'app/startup/splashscreens/splashscreen_view.dart';
import 'constants/colors.dart';
import 'core/services/navigation_service.dart';
import 'utils/progressBarManager/progressService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_Test_Ui',
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Navigator(
        key: locator<ProgressService>().progressNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) {
            return ProgressManager(child: child);
            //DialogManager(child: child);
          },
        ),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        primaryColor: AppColors.primaryColor,
        accentColor: AppColors.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashscreenView(),
      onGenerateRoute: generateRoute,
    );
  }
}
