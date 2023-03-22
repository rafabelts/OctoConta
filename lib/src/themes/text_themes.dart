import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class OctoTextThemes {
  OctoTextThemes._();
  static TextTheme lightTheme = TextTheme(
    displayLarge: GoogleFonts.inter(
      color: primario,
      fontWeight: FontWeight.bold,
      fontSize: 47.sp,
    ),
    titleMedium: GoogleFonts.inter(
      color: secundario,
      fontWeight: FontWeight.w500,
      fontSize: 19.sp,
    ),
    displayMedium: GoogleFonts.inter(
      color: primario,
      fontWeight: FontWeight.bold,
      fontSize: 36.sp,
    ),
    displaySmall: GoogleFonts.inter(
      color: primario,
      fontWeight: FontWeight.bold,
      fontSize: 28.sp,
    ),
    labelLarge: GoogleFonts.inter(
      color: fondoColor,
      fontWeight: FontWeight.bold,
      fontSize: 26.sp,
    ),
    headlineMedium: GoogleFonts.inter(
      color: secundario,
      fontWeight: FontWeight.w600,
      fontSize: 26.sp,
    ),
    bodyLarge: GoogleFonts.inter(
      color: secundario,
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
    ),
    bodyMedium: GoogleFonts.inter(
      color: secundario,
      fontWeight: FontWeight.w700,
      fontSize: 18.sp,
    ),
    bodySmall: GoogleFonts.inter(
      color: entradaUsuarioColor,
      fontWeight: FontWeight.w500,
      fontSize: 16.sp,
    ),
    labelMedium: GoogleFonts.inter(
      color: primario,
      fontWeight: FontWeight.bold,
      fontSize: 20.sp,
    ),
    labelSmall: GoogleFonts.inter(
      color: botonSecundarioColor,
      fontWeight: FontWeight.w700,
      fontSize: 20.sp,
    ),
  );
}
