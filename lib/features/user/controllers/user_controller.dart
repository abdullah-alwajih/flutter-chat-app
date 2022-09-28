import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:super_flutter/super_flutter.dart';

import '../../../core/routes/app_routes.dart';
import '../../../core/utils/toast_bar.dart';

class UserController extends GetxController {
  final FirebaseAuth kFireAuth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;
  late TextEditingController nameTextController;
  late TextEditingController phoneTextController;
  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  var isHidden = Rx<bool>(true);
  var isLoading = Rx<bool>(false);
  var imageFile = Rxn<File>();
  final imagePicker = ImagePicker();

  @override
  void onInit() {
    super.onInit();

    nameTextController = TextEditingController();
    phoneTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
  }

  Future<void> takePhoto(ImageSource source) async {
    final pickedImage = await imagePicker.pickImage(source: source);
    imageFile.value = File(pickedImage!.path);
    Get.back();
  }

  Future<void> register() async {
    try {
      isLoading.value = true;
      await kFireAuth.createUserWithEmailAndPassword(
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );
      isLoading.value = false;
      Get.toNamed(AppRoutes.chat);
    } catch (error) {
      isLoading.value = false;
      showToast(message: FirebaseErrors.getMessage(error));
    }
  }

  Future<void> updateProfile() async {
    try {
      // LoadingDialog.showLoading();

      // LoadingDialog.hideLoading();
      Get.back();
    } catch (error) {
      // LoadingDialog.hideLoading();
      showToast(message: error);
    }
  }

  Future<void> sendOTP() async {
    try {
      // LoadingDialog.showLoading();

      // LoadingDialog.hideLoading();
    } catch (error) {
      showToast(message: error);
    }
  }

  Future<void> login() async {
    try {
      isLoading.value = true;
      await kFireAuth.signInWithEmailAndPassword(
        email: emailTextController.text.trim(),
        password: passwordTextController.text.trim(),
      );
      isLoading.value = false;
      Get.toNamed(AppRoutes.chat);
    } catch (error) {
      isLoading.value = false;
      showToast(message: error);
    }
  }

  Future<void> logout() async {
    await kFireAuth.signOut();
    Get.offAllNamed(AppRoutes.welcome);
  }
}
