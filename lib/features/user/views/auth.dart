import 'package:flutter/material.dart';
import 'package:flutter_chat_app/core/routes/app_routes.dart';
import 'package:flutter_chat_app/core/widgets/gradient_button.dart';
import 'package:flutter_chat_app/features/user/controllers/user_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/styles/app_assets.dart';

class AuthView extends GetView<UserController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.logo, height: 180),
          Text(AppLocalizations.of(context)!.messageMe,
              style: Get.textTheme.headline3, textAlign: TextAlign.center),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal:20.0),
            child: GradientButton(
                onPressed: () => Get.toNamed(AppRoutes.signIn), child: Text(SuperTranslations.of.authSignIn)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal:20.0),
            child: GradientButton(
              primary: false,
                onPressed: () => Get.toNamed(AppRoutes.signUp), child: Text(SuperTranslations.of.authSignUp)),
          ),
        ],
      ),
    );
  }
}
