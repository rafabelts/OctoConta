import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/models/entradas_autentificacion/entradas_contrasena.dart';
import 'package:octoconta_final/src/models/entradas_autentificacion/entradas_correo_nombre.dart';
import 'package:octoconta_final/src/settings_octo/cambio_correo.dart';

import '../../../constants/colors.dart';
import '../../../models/pagina_principal/botones_settings.dart';
import '../../../services/auth.dart';

class CambioCorreoScreen extends StatefulWidget {
  const CambioCorreoScreen({super.key});

  @override
  State<CambioCorreoScreen> createState() => _CambioCorreoScreenState();
}

class _CambioCorreoScreenState extends State<CambioCorreoScreen> {
  TextEditingController correo = TextEditingController();
  TextEditingController contrasena = TextEditingController();

  @override
  void dispose() {
    correo.dispose();
    contrasena.dispose();
    super.dispose();
  }

  bool hayCorreo = true;
  String correoError = '';

  void validarCorreo(bool valido, String error) {
    setState(() {
      hayCorreo = valido;
      correoError = error;
    });
  }

  bool hayContrasena = true;
  String contrasenaError = '';

  void validarContrasena(bool valido, String error) {
    setState(() {
      hayContrasena = valido;
      contrasenaError = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User? usuario = Auth().currentUser;
    final String? correoUsuario = Auth().currentUser?.email;
    final AuthCredential credentials = EmailAuthProvider.credential(
        email: correoUsuario!, password: contrasena.text);
    CambioCorreo cambioCorreo = CambioCorreo(
      credentials: credentials,
      contexto: context,
      correo: correo,
      validarCorreo: validarCorreo,
      contrasena: contrasena,
      validarContrasena: validarContrasena,
      usuario: usuario,
      correoUsuario: correoUsuario,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cambiar Correo:',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.justify,
        ),
        EntradaCorreoNombre(
          controlador: correo,
          onChanged: (value) => cambioCorreo.onChanged(),
          onComplete: cambioCorreo.onCompleteCorreo,
          error: hayCorreo == true ? null : correoError,
          hayValor: hayCorreo,
          etiqueta: 'Nuevo correo',
          icono: Icons.mail_outline_rounded,
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Text(
            'Para realizar el cambio por favor, ingrese su contraseña.',
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.justify,
          ),
        ),
        EntradaContrasena(
          controlador: contrasena,
          onChanged: (value) => cambioCorreo.onChanged(),
          onComplete: cambioCorreo.onCompleteContra,
          hayValor: hayContrasena,
          error: hayContrasena == true ? null : contrasenaError,
          etiqueta: 'Contraseña',
        ),
        Align(
          child: BotonesSettings(
            largo1: 0.13,
            largo: 0.25,
            accion: 'Cambiar correo',
            cancelar: 'Regresar',
            calcular: cambioCorreo.cambiarCorreo,
            limpiar: () => Navigator.pop(context),
          ),
        )
      ],
    );
  }
}
