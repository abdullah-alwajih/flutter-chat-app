import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

abstract class AppValidator {
  static String? required(String? value) {
    if (value?.trim() != "") return null;
    return SuperTranslations.of.authPleaseFillInTheField;
  }

  static String? number(String? value) {
    if (GetUtils.isNum(value!)) return null;
    return SuperTranslations.of.authPleaseFillInTheField;
  }

  static String? phone(String? value) {
    if (value?.trim() == null) {
      return SuperTranslations.of.authPleaseFillInTheField;
    }
    if (GetUtils.isPhoneNumber(value!)) return null;
    return SuperTranslations.of.authPleaseFillInTheField;
  }

  static String? email(String? value) {
    if (value?.trim() == "") {
      return SuperTranslations.of.authPleaseFillInTheField;
    }
    if (GetUtils.isEmail(value!)) return null;
    return SuperTranslations.of.firebaseInvalidEmail;
  }

  static String? password(String? value) {
    if (value?.trim() != "") return null;
    return SuperTranslations.of.authPleaseFillInTheField;
  }

  static String? confirmPassword(String? value, String? confirm) {
    if (confirm?.trim() == "") {
      return SuperTranslations.of.authPleaseFillInTheField;
    }
    if (value == confirm) return null;
    return SuperTranslations.of.authPasswordsDoNotMatch;
  }
}
