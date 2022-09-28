import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/helpers/app_validator.dart';
import '../../../core/styles/app_assets.dart';
import '../../../core/styles/app_themes.dart';
import '../../../core/widgets/gradient_button.dart';
import '../controllers/user_controller.dart';

class SignUpView extends GetView<UserController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 180.0,
                  height: 180.0,
                  margin: const EdgeInsets.all(32),
                  decoration: AppThemes.boxDecoration(radius: 100),
                  child: Image.asset(AppAssets.logo),
                ),
                Text(
                  SuperTranslations.of.authSignUp,
                  style: context.textTheme.headline4
                      ?.copyWith(color: context.textTheme.subtitle2?.color),
                ),
                const SizedBox(height: 10),
                Text(
                  SuperTranslations
                      .of.authWeWillSendAVerificationCodeToThisNumber,
                  style: context.textTheme.subtitle2,
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: controller.nameTextController,
                  validator: AppValidator.required,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.user),
                      hintText: SuperTranslations.of.authFullName),
                ),
                const SizedBox(height: 16),
                // TextFormField(
                //   controller: controller.phoneTextController,
                //   validator: AppValidator.phone,
                //   keyboardType: TextInputType.phone,
                //   decoration: InputDecoration(
                //     prefixIcon: const Icon(Iconsax.call),
                //     hintText: SuperTranslations.of.authPhoneNumber,
                //   ),
                // ),
                TextFormField(
                  controller: controller.emailTextController,
                  validator: AppValidator.email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.message),
                    hintText: SuperTranslations.of.authEMail,
                  ),
                ),
                const SizedBox(height: 16),
                Obx(() => TextFormField(
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
                const SizedBox(height: 16),
                Obx(() => TextFormField(
                      validator: (confirm) => AppValidator.confirmPassword(
                          controller.passwordTextController.text, confirm),
                      obscureText: controller.isHidden.value,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          hintText:
                              SuperTranslations.of.authPasswordConfirmation,
                          prefixIcon: const Icon(Iconsax.lock),
                          suffixIcon: IconButton(
                            icon: Icon(controller.isHidden.value
                                ? Iconsax.eye
                                : Iconsax.eye_slash),
                            onPressed: () => controller.isHidden.value =
                                !controller.isHidden.value,
                          )),
                    )),
                // Obx(
                //   () => DropdownButtonFormField<String>(
                //     validator: AppValidator.required,
                //     decoration: const InputDecoration(
                //         contentPadding:
                //             EdgeInsets.symmetric(horizontal: 10, vertical: 15)),
                //     style: context.textTheme.subtitle1?.copyWith(height: 1.6),
                //     hint: Text(SuperTranslations.of.commonSelectCity),
                //     value: controller.user.value?.cityId,
                //     onChanged: (newValue) =>
                //         controller.user.value?.cityId = newValue,
                //     items: controller.addressController.cities.value
                //         ?.map((city) => DropdownMenuItem<String>(
                //             value: city.id, child: Text(city.name!)))
                //         .toList(),
                //   ),
                // ),
                const SizedBox(height: 16),
                Obx(
                  () => GradientButton(
                    primary: false,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Get.focusScope?.unfocus();
                        controller.register();
                      }
                    },
                    child: controller.isLoading.value
                        ? null
                        : Text(
                            SuperTranslations.of.authSignUp,
                            style: Get.textTheme.button?.copyWith(
                                color: Get.theme.colorScheme.onPrimary),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
