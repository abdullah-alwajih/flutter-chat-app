part of '../chat.dart';

AppBar get getAppBar => AppBar(
    backgroundColor: Get.theme.primaryColorDark,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppLocalizations.of(Get.context!)!.messageMe),
        const SizedBox(width: 8),
        Image.asset(AppAssets.logo, height: 25),
      ],
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: Get.find<ChatController>().userController.logout,
        icon: const Icon(Iconsax.logout),
      )
    ],
  );
