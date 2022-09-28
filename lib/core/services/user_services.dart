import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../features/user/models/user.dart';
import '../providers/app_urls.dart';
import '../routes/app_routes.dart';

class UserServices extends GetxService {
  Local local = SuperRepository.provider.local;

  var currentUser = Rxn<UserModel>(UserModel());

  @override
  void onInit() {
    super.onInit();
    // currentUser.value?.fcmToken = AppNotifications.token;
    getCurrentUser();
  }

  getCurrentUser() {
    var data = local.read(key: AppUrls.userSignIn);
    if (data != null) currentUser.value = UserModel.fromMap(data);
  }

  setCurrentUser(user) {
    local.create(key: AppUrls.userSignIn, value: user.toMap());
    currentUser.value = user;
  }

  deleteCurrentUser() {
    local.delete(key: AppUrls.userSignIn);
    currentUser.value = null;
    Get.offAllNamed(AppRoutes.main);
  }
}
