

import 'package:flutter/material.dart';
import 'package:sites_management/core/Routes/app_routes.dart';
import 'package:sites_management/features/vist_form/presentation/visit_form.dart';

import '../../features/home/presentation/home_page.dart';

class AppRouter {
  //? <======= cubits declration =======>

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //!home route:
      case AppRoutes.homePage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HomePage(),
        );

      //!site information route:
      case AppRoutes.siteInformationFormPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SiteInformationForm(),
        );

      //!default route:
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                "No route defined for ${settings.name}",
              ),
            ),
          ),
        );
    }
  }
}
