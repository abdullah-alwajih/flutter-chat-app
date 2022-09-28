import 'package:lottie/lottie.dart';

abstract class FileAnimation {
  static asset(String name, {double? width, double? height}) =>
      Lottie.asset(name, width: width, height: height);
}
