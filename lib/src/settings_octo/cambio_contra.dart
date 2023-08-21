import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/mensaje_scaffold.dart';
import 'package:octoconta_final/src/ui/verificacion_correo/verificacion_correo_screen.dart';

import '../services/auth.dart';

class CambioContra {
  final BuildContext contexto;

  final TextEditingController contrasena;
  final Function(bool, String) validarContrasena;

  final TextEditingController nuevaContrasena;
  final Function(bool, String) validarNuevaContrasena;

  final TextEditingController confirContrasena;
  final Function(bool, String) validarConfirContrasena;

  final User? usuario;

  final String? correoUsuario;

  void onChanged() {
    if (contrasena.text.isNotEmpty) {
      validarContrasena(true, '');
    }
    if (nuevaContrasena.text.isNotEmpty) {
      validarNuevaContrasena(true, '');
    }
    if (confirContrasena.text.isNotEmpty) {
      validarConfirContrasena(true, '');
    }
  }

  Map<int, String> erroresContra = {
    1: 'Por favor, ingrese su nueva contraseña.',
    2: 'La contraseña debe tener al entre 8 y 16 caracteres, al menos un valor especial, un número, una minúscula y una mayúscula.',
    3: 'Error: contraseñas no coinciden.',
    4: 'La contraseña ingresada es demasiado débil. Por favor intente crear una contraseña más segura',
  };
  Map<int, String> erroresConfirmarContra = {
    1: 'Por favor, ingrese su contraseña de nuevo para confirmar.',
    2: 'La contraseña debe tener al entre 8 y 16 caracteres, al menos un valor especial, un número, una minúscula y una mayúscula.',
    3: 'Error: las contraseñas no coinciden.',
  };

  void onCompleteNuevaContra() {
    String contraPattern =
        r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
    RegExp regExpContra = RegExp(contraPattern);
    if (nuevaContrasena.text.isEmpty) {
      validarNuevaContrasena(false, erroresContra[1]!);
    } else if (!regExpContra.hasMatch(nuevaContrasena.text)) {
      validarNuevaContrasena(false, erroresContra[2]!);
    } else {
      FocusScope.of(contexto).nextFocus();
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteConfContra() {
    String contraPattern =
        r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
    RegExp regExpContra = RegExp(contraPattern);
    if (confirContrasena.text.isEmpty) {
      validarConfirContrasena(false, erroresConfirmarContra[1]!);
    } else if (!regExpContra.hasMatch(confirContrasena.text)) {
      validarConfirContrasena(false, erroresConfirmarContra[2]!);
    } else if (confirContrasena.text != nuevaContrasena.text) {
      validarConfirContrasena(false, erroresConfirmarContra[3]!);
    } else {
      FocusScope.of(contexto).nextFocus();
      FocusScope.of(contexto).nextFocus();
      // FocusManager.instance.primaryFocus!.unfocus();
      // FocusScope.of(contexto).unfocus();
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

  Future<void> realizarCambioPassword() async {
    try {
      await usuario?.updatePassword(nuevaContrasena.text).then((value) {
        MensajeScaffold(contexto: contexto, mensaje: 'Contraseña actualizada.')
            .mostrar();
      });
      await Future.microtask(() {
        Auth().cierreSesion(
            context: contexto,
            navegacionPantallasAlCerrarSesion: (value) {
              Navigator.pop(contexto);
              Navigator.pop(contexto);
            });
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        Future.microtask(() => MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.')
            .mostrar());
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

  Future<void> verificarPassword() async {
    String passwordPattern =
        r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
    RegExp regExpContra = RegExp(passwordPattern);
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
          .reauthenticateWithCredential(EmailAuthProvider.credential(
            email: correoUsuario!,
            password: contrasena.text,
          ))
          .then((value) => Navigator.pop(contexto));
      if (nuevaContrasena.text.isEmpty) {
        validarNuevaContrasena(false, erroresContra[1]!);
      } else if (!regExpContra.hasMatch(nuevaContrasena.text)) {
        validarNuevaContrasena(false, erroresContra[2]!);
      } else if (confirContrasena.text.isEmpty) {
        validarConfirContrasena(false, erroresConfirmarContra[1]!);
      } else if (!regExpContra.hasMatch(confirContrasena.text)) {
        validarConfirContrasena(false, erroresConfirmarContra[2]!);
      } else if (confirContrasena.text != nuevaContrasena.text) {
        validarConfirContrasena(false, erroresConfirmarContra[3]!);
      } else if (contrasena.text == nuevaContrasena.text) {
        validarNuevaContrasena(
            false, 'Por favor, ingrese una contraseña diferente a la actual.');
      } else {
        await realizarCambioPassword();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.')
            .mostrar();
      } else if (e.code == 'wrong-password') {
        Navigator.pop(contexto);
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error: contraseña incorrecta. Por favor ingrese su contraseña correctamente.')
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
    }
  }

  void cambiarContrase() {
    // aracely y rafael
    if (contrasena.text.isEmpty) {
      validarContrasena(false, 'Por favor, ingrese su contraseña.');
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
      verificarPassword();
    }
  }

  CambioContra({
    required this.contexto,
    required this.contrasena,
    required this.validarContrasena,
    required this.nuevaContrasena,
    required this.validarNuevaContrasena,
    required this.confirContrasena,
    required this.validarConfirContrasena,
    required this.usuario,
    required this.correoUsuario,
  });
}
