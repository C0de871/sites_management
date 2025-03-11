import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/Routes/app_routes.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/post_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/cubit/show_visited_site_cubit.dart';
import 'package:sites_management/features/vist_form/presentation/screens/add_visited_site_screen/add_visited_site.dart';

import '../../features/home/presentation/home_page.dart';
import '../../features/vist_form/presentation/screens/show_visited_sites_screen/show_visited_sites.dart';

class AppRouter {
  late ShowVisitedSiteCubit _showVisitedSiteCubit;

  ShowVisitedSiteCubit get showVisitedSiteCubit => _getCubit(
        _showVisitedSiteCubit,
        () => ShowVisitedSiteCubit(),
      );

  T _getCubit<T extends Cubit<Object>>(T? cubit, T Function() createCubit) {
    if (cubit == null || cubit.isClosed) {
      cubit = createCubit();
    }
    cubit.stream.listen((_) {}, onDone: () {
      cubit = null; // Nullify the reference when closed
    });
    return cubit!;
  }

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
      case AppRoutes.showVisitedSites:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => PostVisitedSiteCubit(),
            child: const SitesListPage(),
          ),
        );
      case AppRoutes.addVisitedSite:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (context) => PostVisitedSiteCubit(),
            child: const SiteInformationForm(),
          ),
        );
      // case AppRoutes.showVisitedSiteDetails:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => const SiteDetailsPage(),
      //   );

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
