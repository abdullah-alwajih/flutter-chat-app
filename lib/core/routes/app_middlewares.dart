import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return FirebaseAuth.instance.currentUser == null
        ? null
        : const RouteSettings(name: AppRoutes.chat);
  }
}
