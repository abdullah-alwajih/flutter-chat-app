import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../features/home/views/home.dart';
import '../../features/settings/views/settings.dart';

class MainFeaturesController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var currentIndex = Rx<int>(0);
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }
}

class MainFeaturesView extends GetView<MainFeaturesController> {
  const MainFeaturesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PersistentTabController controller =
        PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: controller,
      screens: const [
        HomeView(),
        Scaffold(),
        Scaffold(),
        SettingsView(),
      ],
      items: _navBarsItems(context),
      confineInSafeArea: true,
      handleAndroidBackButtonPress: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease),
      screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200)),
      navBarStyle: NavBarStyle.style12,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems(context) => [
        PersistentBottomNavBarItem(
          icon: const Icon(Iconsax.home, size: 22),
          title: SuperTranslations.of.appHome,
          activeColorPrimary: Theme.of(context).colorScheme.primary,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Iconsax.category, size: 21),
          title: SuperTranslations.of.commonCategories,
          activeColorPrimary: Theme.of(context).colorScheme.primary,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Iconsax.heart, size: 21),
          title: SuperTranslations.of.commonCategories,
          activeColorPrimary: Theme.of(context).colorScheme.primary,
        ),
        PersistentBottomNavBarItem(
          icon: const Icon(Iconsax.setting_24, size: 22),
          title: SuperTranslations.of.commonSettings,
          activeColorPrimary: Theme.of(context).colorScheme.primary,
        ),
      ];
}
