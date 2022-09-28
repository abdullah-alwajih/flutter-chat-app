import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:super_flutter/super_flutter.dart';

import '../controllers/settings_controller.dart';
import 'components/language_item.dart';

class LanguagesView extends GetView<SettingsController> {
  const LanguagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
              SuperTranslations.of.appChooseLanguageOfApplication)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (_, index) => const SizedBox(height: 20),
                  itemCount: controller.languages.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () => controller.changeLocal(index),
                    child: buildLanguageItem(index),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
