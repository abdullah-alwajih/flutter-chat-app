import 'package:get/get.dart';

import '../../features/chat/controllers/chat.dart';
import '../../features/home/controllers/home_controller.dart';
import '../../features/notifications/controller/notifications_controller.dart';
import '../../features/settings/controllers/settings_controller.dart';
import '../../features/splash/controllers/splash_controller.dart';
import '../../features/user/controllers/user_controller.dart';
import '../services/user_services.dart';
import '../utils/main_features.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => SplashController());
}

class CurrentUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserServices(), permanent: true);
  }
}

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( UserController());
  }
}

class ChatBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => ChatController());
}

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationsController(), permanent: true);
  }
}

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SettingsController());
  }
}

class MainFeaturesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainFeaturesController(), permanent: true);
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
