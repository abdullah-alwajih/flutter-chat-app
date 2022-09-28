import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/services/user_services.dart';
import '../../../../core/styles/app_themes.dart';
import '../../../../core/utils/network_image.dart';

Widget buildProfile(BuildContext context) {
  UserServices userServices = Get.find();
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Get.theme.cardColor,
              boxShadow: AppThemes.boxShadow,
              borderRadius: BorderRadius.circular(100.0)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: networkImage(
              userServices.currentUser.value!.image!,
              width: 100,
              height: 100,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          userServices.currentUser.value!.name ?? '',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    ),
  );
}
