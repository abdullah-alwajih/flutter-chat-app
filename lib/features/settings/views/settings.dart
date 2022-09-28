import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/styles/app_assets.dart';
import '../../../core/styles/app_themes.dart';
import '../../../core/utils/toast_bar.dart';
import '../../../core/utils/url_launcher.dart';
import '../../user/views/sign_out.dart';
import '../controllers/settings_controller.dart';
import 'components/profile.dart';
import 'components/profile_list_item.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text(SuperTranslations.of.commonSettings)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 22),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() => (controller.userServices.currentUser.value?.id != null)
                ? buildProfile(context)
                : const SizedBox.shrink()),
            Obx(() => controller.userServices.currentUser.value?.active != null
                ? Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: AppThemes.boxDecoration(),
                    child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.person_outline,
                              color: context.theme.colorScheme.primary,
                            ),
                            title: Text(
                              SuperTranslations.of.authProfile,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          ListItem(
                            text:
                                SuperTranslations.of.authEditProfile,
                            icon: Icon(Icons.edit_outlined,
                                color: context.theme.colorScheme.secondary,
                                size: 20),
                            onPressed: () => Get.toNamed(AppRoutes.profile),
                          ),
                          ListItem(
                            text: SuperTranslations.of.authLogout,
                            icon: Icon(Icons.logout,
                                size: 20,
                                color: context.theme.colorScheme.secondary),
                            onPressed: () => signOut(),
                          ),
                        ]))
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.1),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.person_outline,
                              color: context.theme.colorScheme.primary,
                            ),
                            title: Text(
                              SuperTranslations.of.authProfile,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                          ListItem(
                            text: SuperTranslations.of.authRegister,
                            icon: Icon(Icons.person_add,
                                color: context.theme.colorScheme.secondary,
                                size: 20),
                            onPressed: () => Get.toNamed(AppRoutes.signUp),
                          ),
                          ListItem(
                            text: SuperTranslations.of.authLogin,
                            icon: Icon(Icons.login,
                                size: 20,
                                color: context.theme.colorScheme.secondary),
                            onPressed: () => Get.toNamed(AppRoutes.signIn),
                          ),
                        ]))),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(0.1),
                    blurRadius: 8,
                  )
                ],
              ),
              child:
                  ListView(shrinkWrap: true, primary: false, children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: context.theme.colorScheme.primary,
                  ),
                  title: Text(
                    SuperTranslations.of.appAppSettings,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                ListItem(
                  text: SuperTranslations.of.appAppLanguage,
                  icon: Icon(Icons.translate,
                      size: 20, color: context.theme.colorScheme.secondary),
                  onPressed: () => Get.toNamed(AppRoutes.languages),
                ),
                ListItem(
                  text: SuperTranslations.of.appShareApplication,
                  icon: Icon(Icons.share,
                      size: 20, color: context.theme.colorScheme.secondary),
                  onPressed: AppUrlLauncher.launchStore,
                ),
                ListItem(
                  text: SuperTranslations.of.authPrivacyPolicy,
                  icon: Icon(Icons.security,
                      color: context.theme.colorScheme.secondary, size: 20),
                  onPressed: () =>
                      showToast(message: 'سيتم تفعيل هذه الميزة قريباً'),
                ),
                ListItem(
                  text: SuperTranslations.of.appAboutTheApp,
                  icon: Icon(Icons.android_outlined,
                      color: context.theme.colorScheme.secondary, size: 20),
                  onPressed: () =>
                      showToast(message: 'سيتم تفعيل هذه الميزة قريباً'),
                ),
              ]),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(AppAssets.logoCircle, height: 128)),
            Obx(() => Text(controller.appVersion.value,
                style: context.textTheme.bodyText2!)),
          ],
        ),
      ),
    );
  }
}
