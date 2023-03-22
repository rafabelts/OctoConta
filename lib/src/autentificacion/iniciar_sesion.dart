import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/mensaje_scaffold.dart';

import '../services/auth.dart';

class IniciarSesion {
  final BuildContext contexto;

  final TextEditingController correo;
  final Function(bool, String) validarCorreo;

  final TextEditingController contrasena;
  final Function(bool, String) validarContrasena;

  void onChanged() {
    if (correo.text.isNotEmpty) {
      validarCorreo(true, '');
    }
    if (contrasena.text.isNotEmpty) {
      validarContrasena(true, '');
    }
  }

  void onCompleteCorreo() {
    if (correo.text.isEmpty) {
      validarCorreo(false, 'Por favor, ingrese su correo electrónico.');
    } else {
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteContra() {
    if (contrasena.text.isEmpty) {
      validarContrasena(false, 'Por favor, ingrese su contraseña.');
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  Future<void> iniciarSesion() async {
    try {
      await Auth().iniciarSesion(
        email: correo.text.toLowerCase().trim(),
        password: contrasena.text,
        context: contexto,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(contexto);
      if (e.code == 'network-request-failed') {
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.')
            .mostrar();
      } else if (e.code == 'user-not-found') {
        // El usuario no existe
        validarCorreo(false,
            'Error: la cuenta de usuario no se ha encontrado. Por favor, compruebe su dirección de correo electrónico e intente de nuevo.');
      } else if (e.code == 'wrong-password') {
        // La contraseña es incorrecta
        validarContrasena(false,
            'Error: contraseña incorrecta. Por favor ingrese su contraseña correctamente.');
      } else if (e.code == 'invalid-email') {
        // La dirección de correo electrónico es inválida
        validarCorreo(false,
            'Error: correo electrónico inválido. Por favor, ingrese un correo electrónico válido.');
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
    }
  }

  void iniciarSesionUsuario() {
    if (correo.text.isEmpty) {
      validarCorreo(false, 'Por favor, ingrese su correo electrónico.');
    } else if (contrasena.text.isEmpty) {
      validarContrasena(false, 'Por favor, ingrese su contraseña.');
    } else {
      validarCorreo(true, '');
      validarContrasena(true, '');
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
      iniciarSesion();
    }
  }

  IniciarSesion({
    required this.contexto,
    required this.correo,
    required this.validarCorreo,
    required this.contrasena,
    required this.validarContrasena,
  });
}
