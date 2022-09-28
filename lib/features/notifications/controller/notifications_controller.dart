import 'package:get/get.dart';

import '../../../core/services/user_services.dart';
import '../../../core/utils/toast_bar.dart';
import '../models/notification.dart';

class NotificationsController extends GetxController
    with StateMixin<List<NotificationModel>> {
  UserServices userServices = Get.find();

  var notifications = RxList<NotificationModel>();

  @override
  void onInit() async {
    super.onInit();
    await getNotification();
  }

  Future<void> getNotification() async {
    try {} catch (error) {
      showToast(message: 'Notification $error');
    }
  }
}
