// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/mensaje_scaffold.dart';
import 'package:octoconta_final/src/ui/verificacion_correo/verificacion_correo_screen.dart';

class CambioCorreo {
  final BuildContext contexto;

  final TextEditingController correo;
  final Function(bool, String) validarCorreo;

  final TextEditingController contrasena;
  final Function(bool, String) validarContrasena;

  final User? usuario;
  final String? correoUsuario;

  final AuthCredential credentials;

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

  Future<void> cambioCorreo() async {
    try {
      await usuario!
          .updateEmail(correo.text.toLowerCase().trim())
          .then((value) {
        Navigator.pop(contexto);
        MensajeScaffold(contexto: contexto, mensaje: 'Correo actualizado.')
            .mostrar();
      });
      Future.microtask(() {
        Navigator.pushReplacement(
            contexto,
            MaterialPageRoute(
                builder: (context) => const VerificacionCorreoScreen()));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.')
            .mostrar();
      } else if (e.code == 'invalid-email') {
        validarCorreo(false,
            'Error: correo electrónico inválido. Por favor, ingrese un correo electrónico válido.');
      } else if (e.code == 'email-already-in-use') {
        validarCorreo(false,
            'Error: esta dirección de correo electrónico ya está en uso. Por favor, intente con una diferente.');
      } else {
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error desconocido. Por favor, inténte de nuevo más tarde.')
            .mostrar();
      }
    }
  }

  Future<void> validarUser() async {
    showDialog(
        context: contexto,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 153, 151, 158),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ));

    try {
      await usuario!
          .reauthenticateWithCredential(credentials)
          .then((value) => Navigator.pop(contexto));
      await cambioCorreo();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.')
            .mostrar();
      } else if (e.code == 'wrong-password') {
        validarContrasena(false,
            'Error: contraseña incorrecta. Por favor ingrese su contraseña correctamente.');
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

  void cambiarCorreo() {
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExpEmail = RegExp(emailPattern);
    String correoValor = correo.text.toLowerCase().trim();

    if (correoValor.isEmpty) {
      validarCorreo(false, 'Por favor, ingrese su correo electrónico.');
    } else if (!regExpEmail.hasMatch(correoValor)) {
      validarCorreo(false,
          'Error: correo electrónico inválido. Por favor, ingrese un correo electrónico válido.');
    } else if (correoUsuario == correo.text.toLowerCase().trim()) {
      validarCorreo(false,
          'Por favor, ingrese un correo electrónico diferente al actual.');
    } else if (contrasena.text.isEmpty) {
      validarContrasena(false, 'Por favor, ingrese su contraseña.');
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
      validarUser();
    }
  }

  CambioCorreo({
    required this.contexto,
    required this.correo,
    required this.validarCorreo,
    required this.contrasena,
    required this.validarContrasena,
    required this.usuario,
    required this.correoUsuario,
    required this.credentials,
  });
}
