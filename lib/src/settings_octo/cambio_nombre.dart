import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/mensaje_scaffold.dart';

class CambioNombre {
  final BuildContext contexto;

  final TextEditingController nombre;
  final Function(bool, String) validarNombre;
  final User? usuario;
  final String? nombreUsuario;

  void onChanged() {
    if (nombre.text.isNotEmpty) {
      validarNombre(true, '');
    }
  }

  void onComplete() {
    if (nombre.text.isEmpty) {
      validarNombre(false, 'Por favor, ingrese su nombre.');
    } else if (nombreUsuario == nombre.text) {
      validarNombre(false, 'Por favor, ingrese un nombre diferente al actual.');
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  Future<void> cambioNombre() async {
    showDialog(
        context: contexto,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 153, 151, 158),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ));
    try {
      await usuario?.updateDisplayName(nombre.text).then((value) {
        {
          MensajeScaffold(contexto: contexto, mensaje: 'Nombre actualizado.')
              .mostrar();
          Navigator.pop(contexto);
          Navigator.pop(contexto);
        }
      });
      await usuario?.reload();
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
                    'Error desconocido. Por favor, inténtalo de nuevo más tarde')
            .mostrar());
      }
    } finally {
      Navigator.pop(contexto);
    }
  }

  void cambiarNombre() {
    if (nombre.text.isEmpty) {
      validarNombre(false, 'Por favor, ingrese su nombre.');
    } else if (nombreUsuario == nombre.text) {
      validarNombre(false, 'Por favor, ingrese un nombre diferente al actual.');
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
      cambioNombre();
    }
  }

  CambioNombre({
    required this.usuario,
    required this.nombreUsuario,
    required this.contexto,
    required this.nombre,
    required this.validarNombre,
  });
}
