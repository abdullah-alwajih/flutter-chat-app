import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_assets.dart';

part 'app_colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
      primarySwatch: AppColors.primarySwatch,
      primaryColor: AppColors.primarySwatch,
      colorScheme: AppColors.colorSchemeLight,
      scaffoldBackgroundColor: AppColors.colorSchemeLight.background,
      // useMaterial3: true,
      fontFamily: AppAssets.appFontFamily,
      textTheme: textTheme,
      buttonTheme: buttonThemeData(),
      textButtonTheme: textButtonThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      outlinedButtonTheme: outlinedButtonThemeData(),
      inputDecorationTheme: inputDecorationTheme(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent),
      iconTheme:  IconThemeData(color:  AppColors.colorSchemeLight.secondaryContainer),
      floatingActionButtonTheme: floatingActionButtonThemeData());

  static ThemeData darkTheme = ThemeData(
      primarySwatch: AppColors.primarySwatch,
      colorScheme: AppColors.colorSchemeDark,
      fontFamily: AppAssets.appFontFamily,
      // useMaterial3: true,
      textTheme: textTheme,
      buttonTheme: buttonThemeData(),
      textButtonTheme: textButtonThemeData(),
      elevatedButtonTheme: elevatedButtonThemeData(),
      outlinedButtonTheme: outlinedButtonThemeData(),
      inputDecorationTheme: inputDecorationTheme(),
      iconTheme:  IconThemeData(color: AppColors.colorSchemeLight.secondaryContainer),
      floatingActionButtonTheme: floatingActionButtonThemeData());

  static BoxDecoration boxDecoration({radius = 10.0, color}) => BoxDecoration(
        color: color ?? Get.theme.cardColor,
        borderRadius: BorderRadius.circular(double.parse(radius.toString())),
        boxShadow: [
          BoxShadow(
              color: Theme.of(Get.context!)
                  .colorScheme
                  .onSecondary
                  .withOpacity(.1),
              blurRadius: 8),
        ],
      );

  static List<BoxShadow> get boxShadow => [
        BoxShadow(
            color:
                Theme.of(Get.context!).colorScheme.onSecondary.withOpacity(.1),
            blurRadius: 8),
      ];
}

TextButtonThemeData textButtonThemeData() {
  return TextButtonThemeData(
      style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ));
}

ElevatedButtonThemeData elevatedButtonThemeData() => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );

OutlinedButtonThemeData outlinedButtonThemeData() {
  return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    minimumSize: const Size(double.infinity, 50),
    side: const BorderSide(color: AppColors.primarySwatch),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ));
}

ButtonThemeData buttonThemeData() {
  return ButtonThemeData(
      padding: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)));
}

InputDecorationTheme inputDecorationTheme({double radius = 8}) {
  return InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,

    contentPadding:
        EdgeInsets.symmetric(vertical: radius, horizontal: radius + 2),
    prefixIconColor: AppColors._secondaryContainerLight,
    suffixIconColor: AppColors._secondaryContainerLight,
    border: OutlineInputBorder(


      borderRadius: BorderRadius.circular(radius),
      borderSide:  const BorderSide(color: AppColors.primarySwatch),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color:  AppColors.primarySwatch),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color:  AppColors._secondaryContainerLight),
      borderRadius: BorderRadius.circular(radius),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color:  AppColors.primarySwatch),
      borderRadius: BorderRadius.circular(radius),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: const BorderSide(),
    ),
  );
}

TextTheme textTheme =  TextTheme(
  headline1: const TextStyle(),
  headline2: const TextStyle(),
  headline3: const TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    color: AppColors._secondaryLight,
  ),
  headline4: const TextStyle(),
  headline5: const TextStyle(),
  headline6: const TextStyle(height: 1.5, fontWeight: FontWeight.bold),
  subtitle1: const TextStyle(height: 1.5),
  subtitle2: const TextStyle(height: 1.5),
  bodyText1: const TextStyle(height: 1.5),
  bodyText2: const TextStyle(height: 1.5, color: Colors.white),
  button: const TextStyle(
    height: 1.7,
    fontWeight: FontWeight.bold,
  ),
  caption: TextStyle(height: 1.5, color: AppColors.primarySwatch[800]),
  overline: const TextStyle(),
);

FloatingActionButtonThemeData floatingActionButtonThemeData() {
  return const FloatingActionButtonThemeData(
      elevation: 0, foregroundColor: Colors.white);
}
