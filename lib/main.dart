import 'package:flutter/material.dart';

import 'core/app/app.dart';
import 'core/utils/services/service_locator.dart';

void main() async {
  await initApp();
  // await FireBaseService.initializeApp();
  // await FireBaseService().initNotifications();
  runApp(const MyApp());
  
}
