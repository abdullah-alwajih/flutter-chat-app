import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_flutter/super_flutter.dart';

import 'notifications.dart';

abstract class AppServices {
  static Future<void> initializeApp() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    await AppNotifications.initNotifications();
    await SuperRepository.initialize();
  }
}
