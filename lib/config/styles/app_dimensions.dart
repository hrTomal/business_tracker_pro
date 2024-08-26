import 'package:flutter/material.dart';

class AppDimensions {
  final BuildContext context;

  AppDimensions(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  var paddingForpagePaddingGlobal = 0.015;
  EdgeInsets get pagePaddingGlobal =>
      EdgeInsets.all(screenWidth * paddingForpagePaddingGlobal);

  Radius get globalCornerRadius => Radius.circular(screenWidth * .040);
  // Example responsive padding and margin
  EdgeInsets get responsivePadding => EdgeInsets.all(screenWidth * 0.05);
  EdgeInsets get responsiveMargin => EdgeInsets.all(screenWidth * 0.05);

  // Other dimensions can be added similarly
  double get smallPadding => screenWidth * 0.03;
  double get mediumPadding => screenWidth * 0.05;
  double get largePadding => screenWidth * 0.08;

  double get sizedBoxHeightGlobal => 15;
  double get halfTextFieldWidth =>
      (screenWidth * 0.48) - (paddingForpagePaddingGlobal);

  // Define breakpoints for different screen sizes
  static const double mobileBreakpoint = 600; // Below 600 is considered mobile
  static const double tabletBreakpoint =
      1024; // Below 1024 and above 600 is considered tablet
  static const double webBreakpoint =
      1440; // Above 1440 is considered large web screens

  // Check if the screen is considered mobile, tablet, or web
  bool get isMobile => screenWidth < mobileBreakpoint;
  bool get isTablet =>
      screenWidth >= mobileBreakpoint && screenWidth < tabletBreakpoint;
  bool get isWeb => screenWidth >= tabletBreakpoint;

  int get rowCardCount {
    if (isWeb) return 4;
    if (isTablet) return 3;
    return 2; // Default for mobile
  }
}
