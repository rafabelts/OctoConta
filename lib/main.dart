import 'package:flutter/material.dart';
import 'package:octoconta_final/src/theme/theme.dart';
import 'package:octoconta_final/src/ui/screen_seleccionada/selected_screen.dart';
// import 'package:octoconta_final/src/ui/welcome/welcome_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color.fromARGB(0, 0, 0, 0),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      theme: OctoContaThemes.lightTheme,
      home: const SelectedScreen(),
    );
  }
}
