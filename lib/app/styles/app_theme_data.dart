import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_color_scheme.dart';

class ThemeDataMyApp {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColorScheme.primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorScheme.background,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColorScheme.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColorScheme.primary,
      surface: AppColorScheme.background,
    ).copyWith(surface: AppColorScheme.background),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColorScheme.primary,
    scaffoldBackgroundColor: AppColorScheme.background,
    appBarTheme: const AppBarTheme(
      color: AppColorScheme.background,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColorScheme.primary,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColorScheme.primary,
      surface: AppColorScheme.background,
    ).copyWith(surface: AppColorScheme.background),
  );

  static void setIsDark(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    Get.changeTheme(brightness == Brightness.dark ? darkTheme : lightTheme);
  }
}
