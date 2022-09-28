import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/services/user_services.dart';
import '../../../core/styles/app_assets.dart';
import '../../../core/utils/package_info.dart';
import '../models/language.dart';

class SettingsController extends GetxController {
  UserServices userServices = Get.find();

  var languageCode = Rx<String>(AppStorage.getLocale.languageCode);
  var themeMode = Rx<ThemeMode>(AppStorage.getThemeMode);
  var appVersion = Rx<String>('');

  List<LanguageModel> languages = [
    LanguageModel(
      code: AppLocalizations.supportedLocales[0].languageCode,
      imagePath: AppAssets.arabic,
    ),
    LanguageModel(
      code: AppLocalizations.supportedLocales[1].languageCode,
      imagePath: AppAssets.english,
    ),
    // LanguageModel(
    //   code: 'fr',
    //   imagePath: "assets/images/france.png",
    // ),
  ];

  getLanguage(index) {
    switch (languages[index].code) {
      case 'ar':
        return SuperTranslations.of.commonArabic;
      case 'fr':
        return SuperTranslations.of.commonFrench;
      case 'en':
        return SuperTranslations.of.commonEnglish;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    appVersion.value = await AppPackageInfo.getAppVersion();
  }

  void changeLocal(index) {
    dynamic code = languages[index].code;
    if (languageCode.value != code) {
      languageCode.value = code;
      Get.updateLocale(Locale(code));
      AppStorage.setLocaleCode = code;
    }
  }

  void changeTheme() {
    themeMode.value =
    themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    Get.changeThemeMode(themeMode.value);
    AppStorage.setThemeMode = themeMode.value;
  }
}
