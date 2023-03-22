import 'package:flutter/material.dart';

import 'alertdialog_theme.dart';
import 'input_theme.dart';
import 'text_themes.dart';

/* 
  Se modifican el estilo de ciertos elementos de la aplicacion
*/

class OctoContaThemes {
  OctoContaThemes._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFDFEFF),
    textTheme: OctoTextThemes.lightTheme,
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0x00ffffff),
        elevation: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF2a195d))),
    inputDecorationTheme: OctoInputTheme.lightInput,
    dialogTheme: OctoDialogTheme.lightDialog,
  );
}
