import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget errorWidget({dynamic message, Widget? image, double? height}) {
  return Opacity(
    opacity: 0.4,
    child: SizedBox(
      height: Get.context!.size!.height - 200,
      width: Get.context!.size?.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 20),
          //   child: image ?? Lottie.asset(AppAssets.emptyLottie, width: 50),
          // ),
          Text(
            message ?? "",
            textAlign: TextAlign.center,
            style:
                Get.textTheme.headline3!.copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    ),
  );
}
