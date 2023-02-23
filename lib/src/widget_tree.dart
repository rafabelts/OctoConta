import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/cuenta_verificacion_y_saldo/correo_verificacion.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/welcome/welcome_screen.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Si el usuario ha iniciado sesión, redirige directamente a la pantalla donde se hace la verificacion
          print('principal');
          return const VerificacionCorreo();
        } else {
          // Muestra la pantalla de bienvenida y la pantalla de creación de cuenta
          print('Bienvenida');
          return const WelcomeScreen();
        }
      },
    );
  }
}
