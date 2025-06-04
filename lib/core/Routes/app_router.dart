import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sites_management/features/home/presentation/cubits/home_cubit.dart';
import 'package:sites_management/features/users/presentation/cubits/update_add_users/update_add_users_cubit.dart';
import 'package:sites_management/features/users/presentation/users_screen.dart';

import '../../features/auth/presentation/login_screen/cubits/login_cubit.dart';
import '../../features/auth/presentation/login_screen/login_screen.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/splash/presentation/spalsh_screen.dart';
import '../../features/users/presentation/cubits/delete_users/delete_users_cubit.dart';
import '../../features/users/presentation/cubits/get_users/get_users_cubit.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/cubit/visited_site_details_cubit.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/form_hub_screen.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/ampere_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/environment_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/fiber_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/generator_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/gsm_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/lte_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/lvdp_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/photo_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/rectifier_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/site_additional_info.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/site_configuration.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/site_general_info.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/solar_and_wind_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/tcu_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/three_g_section.dart';
import '../../features/visited_sites/presentation/screens/add_edit_visited_site_screen/widgets/tower_setion.dart';
import '../../features/visited_sites/presentation/screens/get_visited_sites_screen/cubit/get_visited_site_cubit.dart';
import '../../features/visited_sites/presentation/screens/get_visited_sites_screen/get_visited_sites.dart';
import '../helper/cubit_helper.dart';
import '../utils/constants/constant.dart';
import 'app_routes.dart';

class AppRouter with CubitProviderMixin {
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
          builder: (_) => BlocProvider(
            create: (context) => getCubit(() => HomeCubit()..retrieveUser()),
            child: const HomeScreen(),
          ),
        );

      //!site information route:
      case AppRoutes.showVisitedSites:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                lazy: false,
                create: (context) => getCubit(() => GetVisitedSitesCubit()),
              ),
            ],
            child: const SitesListPage(),
          ),
        );
      case AppRoutes.postSiteGeneralInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return BlocProvider(
              create: (context) => getCubit(() => VisitedSiteDetailsCubit()),
              child: const SiteGeneralInfo(),
            );
          },
        );
      case AppRoutes.editSiteGeneralInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return BlocProvider.value(
              value: getCubit(() => VisitedSiteDetailsCubit()),
              child: const SiteGeneralInfo(),
            );
          },
        );
      case AppRoutes.addFormHubScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return BlocProvider.value(
              value: getCubit(() => VisitedSiteDetailsCubit()),
              child: const FormHubScreen(),
            );
          },
        );
      case AppRoutes.editFormHubScreen:
        String id = settings.arguments as String;
        log("site id after pushing is $id");
        return MaterialPageRoute(
          settings: settings,
          builder: (_) {
            return BlocProvider(
              create: (context) => getCubit(() => VisitedSiteDetailsCubit(visitedSiteId: id)),
              child: const FormHubScreen(),
            );
          },
        );
      case AppRoutes.siteTypeAndConfig:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const SiteConfiguration(),
          ),
        );
      case AppRoutes.siteAdditionalInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const SiteAdditionalInfo(),
          ),
        );
      case AppRoutes.siteAmpereInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const AmpereSection(),
          ),
        );
      case AppRoutes.siteTcuInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const TcuSection(),
          ),
        );
      case AppRoutes.siteFiberInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const FiberSection(),
          ),
        );
      case AppRoutes.siteGsm900Info:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const GsmSection(band: MapKeys.gsm900),
          ),
        );
      case AppRoutes.siteGsm1800Info:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const GsmSection(band: MapKeys.gsm1800),
          ),
        );
      case AppRoutes.site3GInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const ThreeGSection(),
          ),
        );
      case AppRoutes.siteLTEInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const LteSection(),
          ),
        );
      case AppRoutes.siteRectifierInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const RectifierSection(),
          ),
        );
      case AppRoutes.siteEnvironmentInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const EnvironmentSection(),
          ),
        );
      case AppRoutes.siteTowerMastMonopoleInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const TowerSection(),
          ),
        );
      case AppRoutes.siteSolarAndWindSystemInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const SolarAndWindSection(),
          ),
        );
      case AppRoutes.siteGeneratorInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const GeneratorSection(),
          ),
        );
      case AppRoutes.siteLvdpInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const LvdpSection(),
          ),
        );
      case AppRoutes.siteAdditionalPhotoInfo:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: getCubit(() => VisitedSiteDetailsCubit()),
            child: const PhotoSection(),
          ),
        );

      case AppRoutes.loading:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SpalshScreen(),
        );

      case AppRoutes.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginScreen(),
        );

      case AppRoutes.usersManagement:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                lazy: false,
                create: (context) => getCubit(
                  () => GetUsersCubit()..loadUsers(),
                ),
              ),
              BlocProvider(
                create: (context) => getCubit(
                  () => UpdateAddUserCubit(),
                ),
              ),
              BlocProvider(
                create: (context) => getCubit(
                  () => DeleteUserCubit(),
                ),
              )
            ],
            child: const UsersManagementScreen(),
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
