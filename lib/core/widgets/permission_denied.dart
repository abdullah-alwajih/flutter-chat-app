import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import '../routes/app_routes.dart';

Widget permissionDeniedWidget({message}) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.lock, size: 100),
        const SizedBox(height: 20),
        Text(
          message ??
              SuperTranslations.of
                  .shopYouMustSignInToAccessToThisSection,
          textAlign: TextAlign.center,
          style: Theme.of(Get.context!).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 150,
          child: OutlinedButton(
            onPressed: () => Get.toNamed(AppRoutes.signIn),
            child: Text(SuperTranslations.of.authLogin),
          ),
        )
      ],
    ),
  );
}
