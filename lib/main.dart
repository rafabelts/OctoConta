import 'package:flutter/material.dart';
import 'package:octoconta_final/src/theme/theme.dart';
import 'package:octoconta_final/src/ui/pagina_principal/pagina_principal.dart';
// import 'package:octoconta_final/src/ui/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: OctoContaThemes.lightTheme,
      home: const PaginaPrincipal(),
    );
  }
}
