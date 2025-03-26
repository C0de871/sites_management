import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import '../../features/auth/presentation/loading_screen/loading_screen.dart';
import '../Routes/app_router.dart';
import '../Routes/app_routes.dart';
import '../helper/app_functions.dart';
import '../theme/app_theme.dart';
import '../translations/l10n.dart';
import '../utils/services/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final AppTheme _appTheme = const AppTheme();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: L10n.all,
      navigatorObservers: [RouteObserverService()],
      locale: const Locale("en"),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: _appTheme.light(),
      darkTheme: _appTheme.dark(),
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.loading,
      onGenerateRoute: getIt<AppRouter>().generateRoute,
    );
  }
}
