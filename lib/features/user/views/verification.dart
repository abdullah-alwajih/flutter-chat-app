import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/helpers/app_validator.dart';
import '../../../core/styles/app_assets.dart';
import '../controllers/user_controller.dart';

class VerificationView extends GetView<UserController> {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 128, bottom: 100),
                  child: Image.asset(AppAssets.logoCircle, width: 200)),
              TextFormField(
                controller: controller.phoneTextController,
                validator: AppValidator.phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: SuperTranslations.of.authPhoneNumber,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.sendOTP();
                    }
                  },
                  child: Text(SuperTranslations.of.authSendOTP),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
