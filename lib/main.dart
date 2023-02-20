import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:octoconta_final/src/theme/theme.dart';
import 'package:octoconta_final/src/ui/pagina_principal/pagina_principal.dart';
import 'package:octoconta_final/src/ui/welcome/welcome_screen.dart';
// import 'package:octoconta_final/src/ui/welcome/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //  Statusbar transparent
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
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // Si se tiene info de inicio de sesion se mandara a la pag principal
                return const PaginaPrincipal();
              } else {
                return const WelcomeScreen();
              }
            }) // Para el inicio de sesion, si el snapshot tiene informacion se mandara a la pantalla principal, de lo contrario mandara a la pantalla de bienvenida.
        );
  }
}
