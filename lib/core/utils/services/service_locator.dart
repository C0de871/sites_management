import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sites_management/core/databases/storage/external_storage_manager.dart';
import 'package:sites_management/core/helper/device_info.dart';
import 'package:sites_management/features/auth/data/data_sources/user_local_data_source.dart';
import 'package:sites_management/features/auth/data/data_sources/user_remote_data_source.dart';
import 'package:sites_management/features/auth/domain/repository/repository.dart';
import 'package:sites_management/features/auth/domain/usecases/login_user_use_case.dart';
import 'package:sites_management/features/auth/domain/usecases/logout_use_use_case.dart';
import 'package:sites_management/features/auth/domain/usecases/retreive_access_token_use_case.dart';
import 'package:sites_management/features/auth/domain/usecases/retreive_user_use_case.dart';
import 'package:sites_management/features/users/data/datasources/users_remote_data_source.dart';
import 'package:sites_management/features/users/data/service/users_event_bus.dart';
import 'package:sites_management/features/users/domain/repository/users_repository.dart';
import 'package:sites_management/features/users/domain/usecases/add_user_use_case.dart';
import 'package:sites_management/features/users/domain/usecases/delete_user_use_case.dart';
import 'package:sites_management/features/users/domain/usecases/edit_user_use_case.dart';
import 'package:sites_management/features/users/domain/usecases/fetch_users_use_case.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/edit_visited_site_use_case.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/export_visited_site_use_case.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/get_additional_visited_site_images_use_case.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/get_section_visited_site_images_use_case.dart';
import 'package:sites_management/features/visited_sites/domain/use_cases/show_visited_site_details_use_case.dart';

import '../../../features/auth/data/repository/repository_impl.dart';
import '../../../features/users/data/repository/users_repository_impl.dart';
import '../../../features/visited_sites/data/data%20sources/visited_site_remote_data_source.dart';
import '../../../features/visited_sites/data/repository/visited_site_repository_imple.dart';
import '../../../features/visited_sites/data/services/visited_site_event_bus.dart';
import '../../../features/visited_sites/domain/repository/visited_site_repository.dart';
import '../../../features/visited_sites/domain/use_cases/add_visited_site_use_case.dart';
import '../../../features/visited_sites/domain/use_cases/delete_visited_sites_use_case.dart';
import '../../../features/visited_sites/domain/use_cases/get_visited_sites_use_case.dart';
import '../../Routes/app_router.dart';
import '../../databases/api/api_consumer.dart';
import '../../databases/api/auth_interceptor.dart';
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
  getIt.registerLazySingleton<DeviceInfoPlugin>(() => DeviceInfoPlugin());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));
  getIt.registerLazySingleton<InternetConnectionChecker>(() => InternetConnectionChecker.instance);
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<DeviceInfo>(() => DeviceInfo(deviceInfoPlugin: getIt()));
  getIt.registerLazySingleton<ExternalStorageManager>(() => ExternalStorageManager(deviceInfo: getIt()));

  //! Buses:
  getIt.registerLazySingleton<VisitedSitesEventBus>(() => VisitedSitesEventBus());
  getIt.registerLazySingleton<UsersEventBus>(() => UsersEventBus());

  //! Data Sources
  // getIt.registerLazySingleton<LangLocalDataSource>(() => LangLocalDataSource(sharedPrefsHelper: getIt()));
  getIt.registerLazySingleton<VisitedSiteRemoteDataSource>(() => VisitedSiteRemoteDataSource(
        api: getIt(),
        externalStorageManager: getIt(),
      ));
  getIt.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(getIt()));
  getIt.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource(getIt<SecureStorageHelper>()));
  getIt.registerLazySingleton<UsersRemoteDataSource>(() => UsersRemoteDataSource(api: getIt()));

  //! Repository
  getIt.registerLazySingleton<VisitedSiteRepository>(() => VisitedSiteRepositoryImple(
        remoteDataSource: getIt(),
        networkInfo: getIt(),
        visitedSitesEventBus: getIt(),
      ));

  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        remoteDataSource: getIt(),
        networkInfo: getIt(),
        localDataSource: getIt(),
      ));
  getIt.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(
        remoteDataSource: getIt(),
        networkInfo: getIt(),
        eventBus: getIt(),
      ));

  //! Use Cases
  getIt.registerLazySingleton<AddVisitedSiteUseCase>(() => AddVisitedSiteUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetVisitedSitesUseCase>(() => GetVisitedSitesUseCase(repository: getIt()));
  getIt.registerLazySingleton<ShowVisitedSiteDetailsUseCase>(() => ShowVisitedSiteDetailsUseCase(repository: getIt()));
  getIt.registerLazySingleton<DeleteVisitedSitesUseCase>(() => DeleteVisitedSitesUseCase(repository: getIt()));
  getIt.registerLazySingleton<ExportVisitedSiteUseCase>(() => ExportVisitedSiteUseCase(repository: getIt()));
  getIt.registerLazySingleton<EditVisitedSiteUseCase>(() => EditVisitedSiteUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetAdditionalVisitedSiteImagesUseCase>(() => GetAdditionalVisitedSiteImagesUseCase(repository: getIt()));
  getIt.registerLazySingleton<GetSectionVisitedSiteImagesUseCase>(() => GetSectionVisitedSiteImagesUseCase(repository: getIt()));

  getIt.registerLazySingleton<LoginUserUseCase>(() => LoginUserUseCase(repository: getIt()));
  getIt.registerLazySingleton<RetreiveUserUseCase>(() => RetreiveUserUseCase(repository: getIt()));
  getIt.registerLazySingleton<RetreiveAccessTokenUseCase>(() => RetreiveAccessTokenUseCase(repository: getIt()));
  getIt.registerLazySingleton<LogoutUserUseCase>(()=> LogoutUserUseCase(repository: getIt()));

  getIt.registerLazySingleton<GetUsersUseCase>(() => GetUsersUseCase(repository: getIt()));
  getIt.registerLazySingleton<AddUserUseCase>(() => AddUserUseCase(repository: getIt()));
  getIt.registerLazySingleton<EditUserUseCase>(() => EditUserUseCase(repository: getIt()));
  getIt.registerLazySingleton<DeleteUserUseCase>(() => DeleteUserUseCase(repository: getIt()));

  //! Interceptors
  getIt.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(retrieveAccessTokenUseCase: getIt()));
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServicesLocator();
  await getIt<SharedPrefsHelper>().init();
  await dotenv.load(fileName: ".env");
  await getIt<ExternalStorageManager>().createAppStorageDir("SiteManagement");
  await (getIt<ApiConsumer>() as DioConsumer).addInterceptors(getIt<AuthInterceptor>());
}
