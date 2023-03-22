import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/mensaje_scaffold.dart';
import 'package:octoconta_final/src/ui/verificacion_correo/verificacion_correo_screen.dart';

import '../services/auth.dart';

class OlvidoContrasena {
  final BuildContext contexto;

  final TextEditingController correo;
  final Function(bool, String) validarCorreo;

  void onChanged() {
    if (correo.text.isNotEmpty) {
      validarCorreo(true, '');
    }
  }

  void onComplete() {
    if (correo.text.isEmpty) {
      validarCorreo(false, 'Por favor, ingrese su correo electrónico.');
    } else {
      validarCorreo(true, '');
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  Future<void> enviarCorreo() async {
    showDialog(
        context: contexto,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 153, 151, 158),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ));
    try {
      await Auth().enviarCorreoCambioContra(
          context: contexto, email: correo.text.toLowerCase().trim());
      Future.microtask(() => MensajeScaffold(
              contexto: contexto,
              mensaje:
                  'Se ha enviado el link para cambiar su contraseña. Por favor, revise su email!')
          .mostrar());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.')
            .mostrar();
      } else if (e.code == 'user-not-found') {
        // El usuario no existe
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error: la cuenta de usuario no se ha encontrado. Por favor, compruebe su dirección de correo electrónico e intente de nuevo.')
            .mostrar();
      } else if (e.code == 'invalid-email') {
        // La dirección de correo electrónico es inválida
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error: correo electrónico inválido. Por favor, ingrese un correo electrónico válido.')
            .mostrar();
      } else if (e.code == 'too-many-requests') {
        Future.microtask(() => MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Lo sentimos, has excedido el límite de solicitudes permitidas. Por favor, inténtalo de nuevo más tarde.')
            .mostrar());
      } else {
        Future.microtask(() => MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error desconocido. Por favor, intente de nuevo más tarde.')
            .mostrar());
      }
    } finally {
      FocusScope.of(contexto).unfocus();
      Navigator.pop(contexto);
    }
  }

  void enviarCorreoRestablecimiento() {
    if (correo.text.isEmpty) {
      validarCorreo(false, 'Por favor, ingrese su correo electrónico.');
    } else {
      validarCorreo(true, '');
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
      enviarCorreo();
    }
  }

  OlvidoContrasena({
    required this.contexto,
    required this.correo,
    required this.validarCorreo,
  });
}
