import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sites_management/features/vist_form/data/data%20sources/post_visited_site_remote_data_source.dart';
import 'package:sites_management/features/vist_form/domain/repository/post_visited_site_repository.dart';
import 'package:sites_management/features/vist_form/domain/use_cases/post_visited_site_use_case.dart';

import '../../../features/vist_form/data/repository/post_visited_site_repository_imple.dart';
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

  //! Data Sources
  // getIt.registerLazySingleton<LangLocalDataSource>(() => LangLocalDataSource(sharedPrefsHelper: getIt()));
  getIt.registerLazySingleton<PostVisitedSiteRemoteDataSource>(() => PostVisitedSiteRemoteDataSource(
        api: getIt(),
        cacheHelper: getIt(),
      ));

  //! Repository
  // getIt.registerLazySingleton<LanguageRepository>(() => LanguageRepositoryImpl(
  //       localDataSource: getIt(),
  //     ));
  getIt.registerLazySingleton<PostVisitedSiteRepository>(() => PostVisitedSiteRepositoryImple(
        remoteDataSource: getIt(),
        networkInfo: getIt(),
      ));

  //! Use Cases
  getIt.registerLazySingleton<PostVisitedSite>(() => PostVisitedSite(repository: getIt()));
}
