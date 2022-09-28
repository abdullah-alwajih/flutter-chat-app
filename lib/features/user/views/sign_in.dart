import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/helpers/app_validator.dart';
import '../../../core/styles/app_assets.dart';
import '../../../core/styles/app_themes.dart';
import '../../../core/widgets/gradient_button.dart';
import '../controllers/user_controller.dart';

class SignInView extends GetView<UserController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SafeArea(
                child: Container(
                  width: 180.0,
                  height: 180.0,
                  margin: const EdgeInsets.all(32),
                  decoration: AppThemes.boxDecoration(radius: 100),
                  child: Image.asset(AppAssets.logo),
                ),
              ),
              Text(
                SuperTranslations.of.commonWelcomeBackWithFace,
                style: context.textTheme.headline4
                    ?.copyWith(color: context.textTheme.subtitle2?.color),
              ),
              Text(
                SuperTranslations.of.authLoginToYourExistingAccount,
                style: context.textTheme.subtitle2,
              ),
              const SizedBox(height: 16),
              Container(
                decoration: AppThemes.boxDecoration(),
                child: TextFormField(
                  controller: controller.emailTextController,
                  validator: AppValidator.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.message),
                    hintText: SuperTranslations.of.authEMail,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: AppThemes.boxDecoration(),
                child: Obx(() => TextFormField(
                      controller: controller.passwordTextController,
                      validator: AppValidator.password,
                      obscureText: controller.isHidden.value,
                      decoration: InputDecoration(
                          hintText: SuperTranslations.of.authPassword,
                          prefixIcon: const Icon(Iconsax.lock),
                          suffixIcon: IconButton(
                            icon: Icon(controller.isHidden.value
                                ? Iconsax.eye
                                : Iconsax.eye_slash),
                            onPressed: () => controller.isHidden.value =
                                !controller.isHidden.value,
                          )),
                    )),
              ),
              const SizedBox(height: 16),
              Obx(
                () => GradientButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.focusScope?.unfocus();
                      controller.login();
                    }
                  },
                  child: controller.isLoading.value
                      ? null
                      : Text(
                          SuperTranslations.of.authLogin,
                          style: Get.textTheme.button?.copyWith(
                              color: Get.theme.colorScheme.onPrimary),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
