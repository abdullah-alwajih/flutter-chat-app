import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/styles/app_themes.dart';
import '../../controllers/settings_controller.dart';

Widget buildLanguageItem(index) {
  SettingsController controller = Get.find();
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    decoration: AppThemes.boxDecoration(),
    height: 80.0,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(controller.languages[index].imagePath!),
        const SizedBox(width: 10.0),
        Text(controller.getLanguage(index), style: Get.textTheme.headline5),
        const Spacer(),
        if (controller.languageCode.value == controller.languages[index].code)
          const Icon(Icons.check_circle, size: 32)
      ],
    ),
  );
}
