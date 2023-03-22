import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/mensaje_scaffold.dart';
import 'package:octoconta_final/src/ui/verificacion_correo/verificacion_correo_screen.dart';

import '../services/auth.dart';

class EliminarCuenta {
  final BuildContext contexto;

  final TextEditingController contrasena;
  final Function(bool, String) validarContrasena;

  final User? usuario;
  final String? correoUsuario;

  void onChanged() {
    if (contrasena.text.isNotEmpty) {
      validarContrasena(true, '');
    }
  }

  void onComplete() {
    if (contrasena.text.isEmpty) {
      validarContrasena(false, 'Por favor, ingrese su contraseña.');
    } else {
      validarContrasena(true, '');
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  Future<void> funElimin() async {
    try {
      showDialog(
          context: contexto,
          builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: const Color.fromARGB(255, 153, 151, 158),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ));

      await usuario!
          .reauthenticateWithCredential(EmailAuthProvider.credential(
            email: correoUsuario!,
            password: contrasena.text,
          ))
          .then((value) => Navigator.pop(contexto));

      await usuario!.delete().then((value) {
        FocusScope.of(contexto).unfocus();
        Navigator.pop(contexto);
        Navigator.pop(contexto);
        MensajeScaffold(
                contexto: contexto, mensaje: 'Cuenta eliminada correctamente.')
            .mostrar();
      });
      // La cuenta se eliminó correctamente.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        Future.microtask(() => MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.')
            .mostrar());
      } else if (e.code == 'wrong-password') {
        Navigator.pop(contexto); // Cerrar diálogo
        Future.microtask(() => MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error: contraseña incorrecta. Por favor ingrese su contraseña correctamente.')
            .mostrar());
      } else {
        Future.microtask(() => MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error desconocido. Por favor, intente de nuevo más tarde.')
            .mostrar());
      }
    }
  }

  void eliminar() {
    if (contrasena.text.isEmpty) {
      validarContrasena(false, 'Por favor, ingrese su contraseña.');
    } else {
      validarContrasena(true, '');
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
      funElimin();
    }
  }

  EliminarCuenta({
    required this.contexto,
    required this.contrasena,
    required this.validarContrasena,
    required this.usuario,
    required this.correoUsuario,
  });
}
