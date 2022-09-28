import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/helpers/app_validator.dart';
import '../controllers/user_controller.dart';
import 'components/image_profile.dart';

class ProfileView extends GetView<UserController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.colorScheme.secondaryContainer,
          elevation: 0),
      backgroundColor: context.theme.colorScheme.secondaryContainer,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              buildImageProfile(context),
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.nameTextController,
                validator: AppValidator.required,
                decoration: InputDecoration(
                    hintText: SuperTranslations.of.authFullName),
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: controller.phoneTextController,
                validator: AppValidator.phone,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: SuperTranslations.of.authPhoneNumber,
                ),
              ),
              const SizedBox(height: 10),
              // Obx(
              //   () => DropdownButtonFormField<String>(
              //     validator: AppValidator.required,
              //     decoration: const InputDecoration(
              //         contentPadding:
              //         EdgeInsets.symmetric(horizontal: 10, vertical: 15)),
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

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: ElevatedButton(
                  child: Text(SuperTranslations.of.appUpdate),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.focusScope?.unfocus();
                      controller.updateProfile();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
