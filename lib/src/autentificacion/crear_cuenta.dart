import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/mensaje_scaffold.dart';

import '../services/auth.dart';

class CreacionCuenta {
  final BuildContext contexto;

  final TextEditingController nombre;
  final Function(bool, String) validarNombre;

  final TextEditingController correo;
  final Function(bool, String) validarCorreo;

  final TextEditingController contrasena;
  final Function(bool, String) validarContrasena;

  final TextEditingController confirmaContra;
  final Function(bool, String) validarConfirmaContra;

  void onChanged() {
    if (nombre.text.isNotEmpty) {
      validarNombre(true, '');
    }
    if (correo.text.isNotEmpty) {
      validarCorreo(true, '');
    }
    if (contrasena.text.isNotEmpty) {
      validarContrasena(true, '');
    }
    if (confirmaContra.text.isNotEmpty) {
      validarConfirmaContra(true, '');
    }
  }

  Map<int, String> erroresCorreo = {
    1: 'Por favor, ingrese su correo electrónico.',
    2: 'Error: correo electrónico inválido. Por favor, ingrese un correo electrónico válido.',
    3: 'Error: esta dirección de correo electrónico ya está en uso. Por favor, intente con una diferente.',
  };

  Map<int, String> erroresContra = {
    1: 'Por favor, ingrese su contraseña.',
    2: 'La contraseña debe tener al entre 8 y 16 caracteres, al menos un valor especial, un número, una minúscula y una mayúscula.',
    3: 'Error: contraseñas no coinciden.',
    4: 'La contraseña ingresada es demasiado débil. Por favor intente crear una contraseña más segura',
  };
  Map<int, String> erroresConfirmarContra = {
    1: 'Por favor, ingrese su contraseña de nuevo para confirmar.',
    2: 'La contraseña debe tener al entre 8 y 16 caracteres, al menos un valor especial, un número, una minúscula y una mayúscula.',
    3: 'Error: las contraseñas no coinciden.',
  };

  void onCompleteNombre() {
    if (nombre.text.isEmpty) {
      validarNombre(false, 'Por favor, ingrese su nombre.');
    } else {
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteCorreo() {
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExpEmail = RegExp(emailPattern);
    String correoValor = correo.text.toLowerCase().trim();

    if (correoValor.isEmpty) {
      validarCorreo(false, erroresCorreo[1]!);
    } else if (!regExpEmail.hasMatch(correoValor)) {
      validarCorreo(false, erroresCorreo[2]!);
    } else {
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteContra() {
    String contraPattern =
        r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
    RegExp regExpContra = RegExp(contraPattern);
    if (contrasena.text.isEmpty) {
      validarContrasena(false, erroresContra[1]!);
    } else if (!regExpContra.hasMatch(contrasena.text)) {
      validarContrasena(false, erroresContra[2]!);
    } else {
      FocusScope.of(contexto).nextFocus();
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteConfContra() {
    String contraPattern =
        r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
    RegExp regExpContra = RegExp(contraPattern);
    if (confirmaContra.text.isEmpty) {
      validarConfirmaContra(false, erroresConfirmarContra[1]!);
    } else if (!regExpContra.hasMatch(confirmaContra.text)) {
      validarConfirmaContra(false, erroresConfirmarContra[2]!);
    } else if (confirmaContra.text != contrasena.text) {
      validarConfirmaContra(false, erroresConfirmarContra[3]!);
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  Future<void> crearElUsuario() async {
    try {
      await Auth().crearUsuario(
          email: correo.text.toLowerCase().trim(),
          password: confirmaContra.text,
          context: contexto);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        MensajeScaffold(
                contexto: contexto,
                mensaje:
                    'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.')
            .mostrar();
      } else if (e.code == 'email-already-in-use') {
        validarCorreo(false, erroresCorreo[3]!);
      } else if (e.code == 'weak-password') {
        validarContrasena(false, erroresContra[4]!);
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
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  void crear() {
    String correoValor = correo.text.toLowerCase().trim();
    String contraPattern =
        r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
    RegExp regExpContra = RegExp(contraPattern);
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExpEmail = RegExp(emailPattern);

    if (nombre.text.isEmpty) {
      validarNombre(false, 'Por favor, ingrese su nombre.');
    } else if (correoValor.isEmpty) {
      validarCorreo(false, erroresCorreo[1]!);
    } else if (!regExpEmail.hasMatch(correoValor)) {
      validarCorreo(false, erroresCorreo[2]!);
    } else if (contrasena.text.isEmpty) {
      validarContrasena(false, erroresContra[1]!);
    } else if (!regExpContra.hasMatch(contrasena.text)) {
      validarContrasena(false, erroresContra[2]!);
    } else if (confirmaContra.text.isEmpty) {
      validarConfirmaContra(false, erroresConfirmarContra[1]!);
    } else if (!regExpContra.hasMatch(confirmaContra.text)) {
      validarConfirmaContra(false, erroresConfirmarContra[2]!);
    } else if (confirmaContra.text != contrasena.text) {
      validarConfirmaContra(false, erroresConfirmarContra[3]!);
    } else {
      validarNombre(true, '');
      validarCorreo(true, '');
      validarContrasena(true, '');
      validarConfirmaContra(true, '');
      crearElUsuario();
    }
  }

  CreacionCuenta({
    required this.contexto,
    required this.nombre,
    required this.validarNombre,
    required this.correo,
    required this.validarCorreo,
    required this.contrasena,
    required this.validarContrasena,
    required this.confirmaContra,
    required this.validarConfirmaContra,
  });
}
