import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class AppNotifications {
  static initNotifications() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.getToken();
  }
}
