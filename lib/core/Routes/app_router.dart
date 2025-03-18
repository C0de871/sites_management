import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/core/Routes/app_routes.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/cubit/add_visited_site_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/get_visited_sites_screen/cubit/get_visited_site_cubit.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/form_hub_screen.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/ampere_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/environment_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/fiber_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/generator_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/gsm_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/lte_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/lvdp_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/photo_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/rectifier_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/site_additional_info.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/site_configuration.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/site_general_info.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/solar_and_wind_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/tcu_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/three_g_section.dart';
import 'package:sites_management/features/visited_sites/presentation/screens/add_visited_site_screen/widgets/tower_setion.dart';

import '../../features/home/presentation/home_page.dart';
import '../../features/visited_sites/presentation/screens/get_visited_sites_screen/get_visited_sites.dart';
import '../utils/constants/constant.dart';

class AppRouter {
  GetVisitedSitesCubit? _showVisitedSiteCubit;
  AddVisitedSiteCubit? _postVisitedSiteCubit;

  // PostVisitedSiteCubit get postVisitedSiteCubit => _getCubit(_postVisitedSiteCubit, () => PostVisitedSiteCubit());
  GetVisitedSitesCubit get showVisitedSiteCubit => _getCubit(_showVisitedSiteCubit, () => GetVisitedSitesCubit());

  AddVisitedSiteCubit get postVisitedSiteCubit {
    if (_postVisitedSiteCubit == null || _postVisitedSiteCubit!.isClosed) {
      log("cubit is null: ${_postVisitedSiteCubit == null}");
      log("cubit is closed: ${_postVisitedSiteCubit?.isClosed.toString()}");
      log("newCubit created");
      _postVisitedSiteCubit = AddVisitedSiteCubit();
    }
    _postVisitedSiteCubit!.stream.listen((_) {}, onDone: () {
      _postVisitedSiteCubit = null;
    });
    return _postVisitedSiteCubit!;
  }

  T _getCubit<T extends Cubit<Object>>(T? cubit, T Function() createCubit) {
    if (cubit == null || cubit.isClosed) {
      log("cubit is null: ${cubit == null}");
      log("cubit is closed: ${cubit?.isClosed.toString()}");
      cubit = createCubit();
      log("newCubit created");
    }
    // cubit.stream.listen((_) {}, onDone: () {
    //   cubit = null; // Nullify the reference when closed
    // });
    return cubit;
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
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                lazy: false,
                create: (context) => postVisitedSiteCubit,
              ),
              BlocProvider(
                lazy: false,
                create: (context) => showVisitedSiteCubit,
              ),
            ],
            child: const SitesListPage(),
          ),
        );
      case AppRoutes.siteGeneralInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            log("cubit is null ====================================== : ${_postVisitedSiteCubit == null}");
            return BlocProvider.value(
              value: postVisitedSiteCubit,
              child: const SiteGeneralInfo(),
            );
          },
        );
      case AppRoutes.formHubScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const FormHubScreen(),
          ),
        );
      case AppRoutes.siteTypeAndConfig:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const SiteConfiguration(),
          ),
        );
      case AppRoutes.siteAdditionalInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const SiteAdditionalInfo(),
          ),
        );
      case AppRoutes.siteAmpereInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const AmpereSection(),
          ),
        );
      case AppRoutes.siteTcuInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const TcuSection(),
          ),
        );
      case AppRoutes.siteFiberInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const FiberSection(),
          ),
        );
      case AppRoutes.siteGsm900Info:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const GsmSection(band: MapKeys.gsm900),
          ),
        );
      case AppRoutes.siteGsm1800Info:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const GsmSection(band: MapKeys.gsm1800),
          ),
        );
      case AppRoutes.site3GInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const ThreeGSection(),
          ),
        );
      case AppRoutes.siteLTEInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const LteSection(),
          ),
        );
      case AppRoutes.siteRectifierInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const RectifierSection(),
          ),
        );
      case AppRoutes.siteEnvironmentInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const EnvironmentSection(),
          ),
        );
      case AppRoutes.siteTowerMastMonopoleInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const TowerSection(),
          ),
        );
      case AppRoutes.siteSolarAndWindSystemInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const SolarAndWindSection(),
          ),
        );
      case AppRoutes.siteGeneratorInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const GeneratorSection(),
          ),
        );
      case AppRoutes.siteLvdpInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const LvdpSection(),
          ),
        );
      case AppRoutes.siteAdditionalPhotoInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: postVisitedSiteCubit,
            child: const PhotoSection(),
          ),
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
