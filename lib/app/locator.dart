import 'package:flutter_test_ui/core/services/navigation_service.dart';
import 'package:flutter_test_ui/utils/progressBarManager/progressService.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ProgressService());
}
