import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import 'core/routes/app_pages.dart';
import 'core/services/app_services.dart';
import 'core/styles/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: SuperTranslations.navigatorKey,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: AppStorage.getThemeMode,
      locale: const Locale('ar'), //AppStorage.getLocale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        SuperLocalizations.delegate,
        ...AppLocalizations.localizationsDelegates,
      ],
      initialRoute: AppPages.initial,
      getPages: AppPages.pages,
    );
  }
}
