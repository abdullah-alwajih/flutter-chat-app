import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/app_urls.dart';
import 'package_info.dart';

abstract class AppUrlLauncher {
  static launchStore() async {
    try {
      var uri = Uri.parse(
          "market://details?id=${await AppPackageInfo.getPackageName()}");
      await launchUrl(uri);
    } catch (_) {}
  }

  static launchLink(link) async {
    try {
      var uri = Uri.parse("${AppUrls.baseUrl}$link");
      await launchUrl(uri);
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
