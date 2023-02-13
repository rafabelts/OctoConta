import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OctoContaThemes {
  OctoContaThemes._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFDFEFF),
    appBarTheme: OctoAppBarTheme.lightTheme,
    textTheme: OctoTextThemes.lightTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFF1F1F1F),
  );
}

// Tema de la app bar
class OctoAppBarTheme {
  static AppBarTheme lightTheme = const AppBarTheme(
      backgroundColor: Color(0x00ffffff),
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Color(0xFF2a195d)));
}

// Tema del texto
class OctoTextThemes {
  static TextTheme lightTheme = TextTheme(
    displayLarge: GoogleFonts.inter(
      color: const Color(0xFF2a195d),
      fontWeight: FontWeight.bold,
      fontSize: 56,
    ),
    displayMedium: GoogleFonts.inter(
      color: const Color(0xFF2a195d),
      fontWeight: FontWeight.bold,
      fontSize: 42,
    ),
    titleMedium: GoogleFonts.inter(
      color: const Color(0xff382A62),
      fontWeight: FontWeight.w500,
      fontSize: 19,
    ),
    headlineSmall: GoogleFonts.inter(
      color: const Color(0xff382A62),
      fontWeight: FontWeight.w600,
      fontSize: 32,
    ),
    labelLarge: GoogleFonts.inter(
      color: const Color(0xFF534677),
      fontWeight: FontWeight.w600,
      fontSize: 54,
    ),
  );
}
