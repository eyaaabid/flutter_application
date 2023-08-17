import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color lightBackgroundColor = const Color(0xfff2f2f2);
  static const Color lightPrimaryColor = const Color(0xffff94ab4c);
  static const lightSecondaryColor = const Color(0xff040415);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightParticlesColor = const Color(0x44948282);
  static Color lightTextColor = Colors.black54;
  static const shadowColor = Colors.black87;
  static const textColor = Color(0xFF333333);
  static const Color primaryFourElementText =
      Color.fromARGB(255, 204, 204, 204);
  static const Color primarySecondaryBackground =
      Color.fromARGB(255, 247, 247, 249);
  static const Color primarySecondaryElementText =
      Color.fromARGB(255, 102, 102, 102);
      

  const AppTheme._();

  static final lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: lightPrimaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(backgroundColor: lightPrimaryColor),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: lightBackgroundColor)),
      colorScheme: ColorScheme.light(secondary: lightSecondaryColor)
          .copyWith(background: lightBackgroundColor));

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: lightBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }
}
