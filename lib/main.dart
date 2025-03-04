import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/app/app.dart';
import 'core/databases/cache/shared_prefs_helper.dart';
import 'core/utils/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  await getIt<SharedPrefsHelper>().init();
  await dotenv.load(fileName: ".env");
  // await FireBaseService.initializeApp();
  // await FireBaseService().initNotifications();
  runApp(const MyApp());
}
