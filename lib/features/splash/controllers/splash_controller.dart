import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/providers/app_urls.dart';
import '../../../core/routes/app_routes.dart';
import '../../../core/services/user_services.dart';
import '../../../core/utils/toast_bar.dart';
import '../../notifications/controller/notifications_controller.dart';

class SplashController extends GetxController with StateMixin<bool> {
  final SuperRepository _repository = SuperRepository.instance;

  UserServices userServices = Get.find();
  NotificationsController notificationsController = Get.find();

  @override
  void onReady() async {
    super.onReady();
    await updateFCMToken();
    await notificationsController.getNotification();

    await nextView();

    change(true, status: RxStatus.success());
  }

  updateFCMToken() async {
    if (userServices.currentUser.value?.id != null) {
      try {
        var data = {
          'user_id': userServices.currentUser.value?.id,
          // 'fcm_id': AppNotifications.token,
        };
        Request request = Request(url: AppUrls.updateFcm, data: data);
        await _repository.sendData(request: request, model: null);
      } catch (error) {
        showToast(message: error);
      }
    }
  }

  Future<void> nextView() async {
    return (userServices.currentUser.value?.id != null)
        ? Get.offNamed(AppRoutes.signIn)
        : Get.offNamed(AppRoutes.main);
  }
}
