import 'package:flutter_chat_app/core/routes/app_middlewares.dart';
import 'package:flutter_chat_app/features/user/views/auth.dart';
import 'package:get/get.dart';

import '../../features/chat/views/chat.dart';
import '../../features/settings/views/languages.dart';
import '../../features/settings/views/settings.dart';
import '../../features/splash/views/splash.dart';
import '../../features/user/views/forgot_password.dart';
import '../../features/user/views/profile.dart';
import '../../features/user/views/reset_password.dart';
import '../../features/user/views/sign_in.dart';
import '../../features/user/views/sign_up.dart';
import '../../features/user/views/verification.dart';
import '../utils/main_features.dart';
import 'app_bindings.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = AppRoutes.welcome;
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      bindings: [
        CurrentUserBinding(),
        SplashBinding(),
        NotificationsBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const AuthView(),
      bindings: [
        CurrentUserBinding(),
        UserBinding(),
      ],
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => const ChatView(),
      bindings: [
        UserBinding(),
        ChatBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainFeaturesView(),
      bindings: [
        SettingsBinding(),
        NotificationsBinding(),
        MainFeaturesBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.languages,
      page: () => const LanguagesView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      bindings: [
        UserBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInView(),
      bindings: [UserBinding()],
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => const ForgotPasswordView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: AppRoutes.verification,
      page: () => const VerificationView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordView(),
      binding: UserBinding(),
    ),
  ];
}
