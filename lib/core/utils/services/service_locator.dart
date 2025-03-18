import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sites_management/core/Routes/app_router.dart';
import 'package:sites_management/features/visited_sites/data/data%20sources/visited_site_remote_data_source.dart';
import 'package:sites_management/features/visited_sites/data/services/visited_site_event_bus.dart';
import 'package:sites_management/features/visited_sites/domain/repository/visited_site_repository.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/add_visited_site_use_case.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/get_visited_sites_use_case.dart';

import '../../../features/visited_sites/data/repository/visited_site_repository_imple.dart';
import '../../databases/api/api_consumer.dart';
import '../../databases/api/dio_consumer.dart';
import '../../databases/cache/secure_storage_helper.dart';
import '../../databases/cache/shared_prefs_helper.dart';
import '../../databases/connection/network_info.dart';

final getIt = GetIt.instance; // Singleton instance of GetIt

void setupServicesLocator() {
  //!service:

  //! Core
  getIt.registerLazySingleton<SharedPrefsHelper>(() => SharedPrefsHelper());
  getIt.registerLazySingleton<SecureStorageHelper>(() => SecureStorageHelper());
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker.instance);
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());

  //! Buses:
  getIt.registerLazySingleton<VisitedSitesEventBus>(() => VisitedSitesEventBus());

  //! Data Sources
  // getIt.registerLazySingleton<LangLocalDataSource>(() => LangLocalDataSource(sharedPrefsHelper: getIt()));
  getIt.registerLazySingleton<VisitedSiteRemoteDataSource>(() => VisitedSiteRemoteDataSource(
        api: getIt(),
      ));

  //! Repository
  // getIt.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(
  //       localDataSource: getIt(),
  //     ));
  getIt.registerLazySingleton<VisitedSiteRepository>(() => VisitedSiteRepositoryImple(
        remoteDataSource: getIt(),
        networkInfo: getIt(),
        visitedSitesEventBus: getIt(),
      ));

  //! Use Cases
  getIt.registerLazySingleton<AddVisitedSite>(() => AddVisitedSite(repository: getIt()));
  getIt.registerLazySingleton<GetVisitedSitesUseCase>(() => GetVisitedSitesUseCase(repository: getIt()));
}
