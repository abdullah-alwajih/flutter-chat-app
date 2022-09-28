import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:super_flutter/super_flutter.dart';

import '../styles/app_assets.dart';

Widget emptyWidget({String? message, Widget? image}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(child:  image ??Lottie.asset(AppAssets.emptyLottie)),
        Text(
          message ?? SuperTranslations.of.commonNoDataIsAvailable,
          textAlign: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.headlineMedium,
        ),
      ],
    ),
  );
}
