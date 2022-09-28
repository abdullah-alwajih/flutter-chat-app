import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/services/user_services.dart';

signOut() {
  UserServices userServices = Get.find();
  showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
            title: const Center(child: Icon(Icons.warning)),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        SuperTranslations.of
                            .authAreYouSureYouWantToLogout,
                        style: Theme.of(Get.context!).textTheme.subtitle1,
                      )
                    ],
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: Text(SuperTranslations.of.commonNo),
                  onPressed: () => Navigator.of(Get.context!).pop(false)),
              TextButton(
                child: Text(SuperTranslations.of.commonYes,
                    style: Theme.of(Get.context!)
                        .textTheme
                        .button!
                        .copyWith(color: Get.theme.hintColor)),
                onPressed: () => userServices.deleteCurrentUser(),
              ),
            ],
          ));
}
