import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color pageBackground = Color(0xFF121212); // Dark background
  static const Color statusBarColor = Color(0xFF1E1E1E); // Darker status bar
  static const Color appBarColor = Color(0xFF1E1E1E); // Darker app bar
  static const Color appBarIconColor = Color(0xFFFFFFFF); // White icons
  static const Color appBarTextColor = Color(0xFFFFFFFF); // White text

  static const Color centerTextColor = Colors.white70; // Light gray for center text
  static const MaterialColor colorPrimarySwatch = Colors.grey; // Grey as the primary swatch
  static const Color colorPrimary = Color(0xFF323232); // Dark gray primary
  static const Color colorAccent = Color(0xFF323232); // Dark gray accent
  static const Color colorLightGreen = Color(0xFFFFFFFF); // Replaced light green with white
  static const Color colorWhite = Color(0xFFFFFFFF); // White
  static const Color lightGreyColor = Color(0xFF757575); // Light gray
  static const Color errorColor = Color(0xFFAB0B0B); // Error remains slightly dark red for alert purposes
  static const Color colorDark = Color(0xFF121212); // Very dark gray for elements

  static const Color buttonBgColor = colorPrimary;
  static const Color disabledButtonBgColor = Color(0xFF555555); // Dark gray for disabled buttons
  static const Color defaultRippleColor = Color(0x331E1E1E); // Ripple effect in darker shade

  static const Color textColorPrimary = Color(0xFFFFFFFF); // White for primary text
  static const Color textColorSecondary = Color(0xFFB0BEC5); // Light gray for secondary text
  static const Color textColorTag = colorPrimary;
  static const Color textColorGreyLight = Color(0xFFB0BEC5); // Light gray
  static const Color textColorGreyDark = Color(0xFF757575); // Dark gray
  static const Color textColorBlueGreyDark = Color(0xFF939699); // Dark grayish
  static const Color textColorCyan = Color(0xFFFFFFFF); // White for clarity
  static const Color textColorWhite = Color(0xFFFFFFFF); // White for white text
  static Color searchFieldTextColor = const Color(0xFFFFFFFF).withOpacity(0.7); // White with reduced opacity for search fields

  static const Color iconColorDefault = Colors.white70; // Light icons

  static Color barrierColor = const Color(0xFF000000).withOpacity(0.7); // Semi-transparent black barrier

  static Color timelineDividerColor = const Color(0xFF757575); // Light gray divider

  static const Color gradientStartColor = Colors.black; // Black for gradient start
  static const Color gradientEndColor = Colors.transparent;
  static const Color silverAppBarOverlayColor = Color(0x801E1E1E); // Dark gray overlay for app bar

  static const Color switchActiveColor = colorPrimary;
  static const Color switchInactiveColor = Color(0xFF555555); // Dark gray for inactive switch
  static Color elevatedContainerColorOpacity = Colors.grey.withOpacity(0.7); // Dark gray with opacity
  static const Color suffixImageColor = Colors.white70; // Light gray for suffix icons
}

