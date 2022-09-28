import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:super_flutter/super_flutter.dart';

enum ToastStates { kSUCCESS, kERROR, kWARNING }

void showToast({
  required message,
  ToastStates state = ToastStates.kERROR,
  IconData? iconData,
}) {
  message =  (message.runtimeType != String) ? Failure.exceptionToMessage(message) : message.toString();

  Get.snackbar(
    '',
    message,
    titleText: const SizedBox.shrink(),
    backgroundColor: chooseToastColor(state),
    messageText: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(   message,
              style: Theme.of(Get.context!).textTheme.subtitle2?.copyWith(color: Theme.of(Get.context!).scaffoldBackgroundColor,)),        ),
        Icon(
          (message.runtimeType == Exceptions && message.runtimeType == ConnectionException)
              ? Icons.wifi_off_outlined
              : chooseToastIcon(state, iconData),
          color: Theme.of(Get.context!).scaffoldBackgroundColor,
        )
      ],
    ),
  );
}

Color? chooseToastColor(ToastStates state) {
  switch (state) {
    case ToastStates.kSUCCESS:
      return const Color(0xff39CC60);
    case ToastStates.kERROR:
      return const Color(0xffFF434F);
    case ToastStates.kWARNING:
      return Colors.amber;
    default:
      return const Color(0xff39CC60);
  }
}

IconData? chooseToastIcon(ToastStates state, IconData? icon) {
  switch (state) {
    case ToastStates.kSUCCESS:
      return icon ?? Icons.check;
    case ToastStates.kERROR:
      return icon ?? Icons.warning;
    case ToastStates.kWARNING:
      return icon ?? Icons.warning;
    default:
      return null;
  }
}
