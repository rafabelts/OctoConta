import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class OctoInputTheme {
  OctoInputTheme._();
  static InputDecorationTheme lightInput = InputDecorationTheme(
    errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorError, width: 2.0.w)),
    errorMaxLines: 4,
    errorStyle: GoogleFonts.inter(fontSize: 14.sp, fontWeight: FontWeight.w600),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0.w, color: colorError)),
    labelStyle: GoogleFonts.inter(
      color: entradaUsuarioColor,
      fontWeight: FontWeight.w500,
      fontSize: 18.sp,
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 20.0.h),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.0.w, color: entradaUsuarioColor)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2.0, color: entradaUsuarioColor)),
  );
}
