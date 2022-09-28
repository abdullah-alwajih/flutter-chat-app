abstract class AppUrls {
  static const kGooglePlay =
      "https://play.google.com/apps/internaltest/4700882769074267101";

  static const baseUrl = '/';
  static const apiUrl = '${baseUrl}api/';
  static const limit = 20;


  // user
  static const userSignIn = '${apiUrl}login';
  static const userSignUp = '${apiUrl}register_user';
  static const verifyUser = '${apiUrl}verify_user';
  static const userResetPassword = '${apiUrl}reset_password';
  static const userUpdate = '${apiUrl}update_user';
  static const updateFcm = '${apiUrl}update_fcm';

}
