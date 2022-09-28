import 'package:package_info_plus/package_info_plus.dart';

abstract class AppPackageInfo {
  static Future<String> getAppVersion() async {
    try {
      return PackageInfo.fromPlatform()
          .then((PackageInfo packageInfo) => packageInfo.version);
    } catch (_) {
      return '0.0.1';
    }
  }

  static Future<String> getPackageName() async {
    try {
      return PackageInfo.fromPlatform()
          .then((PackageInfo packageInfo) => packageInfo.packageName);
    } catch (_) {
      return '';
    }
  }
}
