import 'package:flutter/material.dart';

abstract class AppSizes {
  static const double kPaddingVerySmall = 4;
  static const double kPaddingSmall = 8;
  static const double kPaddingMedium = 16;
  static const double kPaddingLarge = 32;
  static const double kPaddingVeryLarge = 64;

  static const double kSizeVerySmall = 5;
  static const double kSizeSmall = 10;
  static const double kSizeMedium = 20;
  static const double kSizeLarge = 40;
  static const double kSizeVeryLarge = 80;

  static const num appLittleElevation = 2;
  static const double appMoreElevation = 4.0;

  static const double sizeLittleBorderRadius = 25;
  static const double sizeMoreBorderRadius = 50;
}
class App {
  late BuildContext _context;
  late double _height;
  late double _width;
  late double _heightPadding;
  late double _widthPadding;

  App(context) {
    _context = context;
    MediaQueryData queryData = MediaQuery.of(_context);
    _height = queryData.size.height / 100.0;
    _width = queryData.size.width / 100.0;
    _heightPadding = _height - ((queryData.padding.top + queryData.padding.bottom) / 100.0);
    _widthPadding = _width - (queryData.padding.left + queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return _height * v;
  }

  double appWidth(double v) {
    return _width * v;
  }

  double appVerticalPadding(double v) {
    return _heightPadding * v;
  }

  double appHorizontalPadding(double v) {
    return _widthPadding * v;
  }
}
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}




