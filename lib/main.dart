import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octoconta_final/src/theme/theme.dart';
// import 'package:octoconta_final/src/ui/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:octoconta_final/src/widget_tree.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //  Statusbar transparente
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: OctoContaThemes.lightTheme,
      home: const WidgetTree(),
    );
  }
}
