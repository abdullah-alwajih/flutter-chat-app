import 'package:flutter/material.dart';

import '../styles/app_assets.dart';
import '../utils/file_animation.dart';

Widget loadingWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Center(
        child: FileAnimation.asset(AppAssets.loadingLottie,
            height: 200, width: 200),
      ),
    ],
  );
}
