import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  /// https://material.io/design/typography/the-type-system.html#type-scale - Helps to create textTheme

  static TextTheme get textTheme => textThemeMontserrat;

  static TextTheme textThemeMontserrat = TextTheme(
    displayLarge: GoogleFonts.roboto(
      fontSize: 96,
      fontWeight: FontWeight.w300,
    ),
    displayMedium: GoogleFonts.roboto(
      fontSize: 60,
      fontWeight: FontWeight.w300,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: 34,
      fontWeight: FontWeight.w400,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 16,
    ),
    labelLarge: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: GoogleFonts.roboto(
      fontSize: 10,
      fontWeight: FontWeight.w400,
    ),
  );
}
