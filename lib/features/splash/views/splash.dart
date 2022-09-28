import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/styles/app_assets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => buildSplashImage(),
      onLoading: buildSplashImage(),
    );
  }

  Image buildSplashImage() {
    return Image.asset(AppAssets.splash,
        width: double.infinity, height: double.infinity);
  }
}
