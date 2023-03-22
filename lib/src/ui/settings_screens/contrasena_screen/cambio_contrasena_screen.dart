import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/models/entradas_autentificacion/entradas_contrasena.dart';
import 'package:octoconta_final/src/models/entradas_autentificacion/entradas_correo_nombre.dart';

import '../../../constants/colors.dart';
import '../../../models/pagina_principal/botones_settings.dart';
import '../../../services/auth.dart';
import '../../../settings_octo/cambio_contra.dart';

class CambioPasswordScreen extends StatefulWidget {
  const CambioPasswordScreen({super.key});

  @override
  State<CambioPasswordScreen> createState() => _CambioPasswordScreenState();
}

class _CambioPasswordScreenState extends State<CambioPasswordScreen> {
  TextEditingController contrasena = TextEditingController();
  TextEditingController nuevaContrasena = TextEditingController();
  TextEditingController confirContrasena = TextEditingController();

  @override
  void dispose() {
    contrasena.dispose();
    nuevaContrasena.dispose();
    confirContrasena.dispose();
    super.dispose();
  }

  bool hayContrasena = true;
  String contrasenaError = '';

  void validarContrasena(bool valido, String error) {
    setState(() {
      hayContrasena = valido;
      contrasenaError = error;
    });
  }

  bool hayNuevaContrasena = true;
  String nuevaContrasenaError = '';

  void validarNuevaContrasena(bool valido, String error) {
    setState(() {
      hayNuevaContrasena = valido;
      nuevaContrasenaError = error;
    });
  }

  bool hayConfirContrasena = true;
  String confirContrasenaError = '';

  void validarConfirContrasena(bool valido, String error) {
    setState(() {
      hayConfirContrasena = valido;
      confirContrasenaError = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User? usuario = Auth().currentUser;
    final String? correoUsuario = Auth().currentUser?.email;

    CambioContra cambiarContra = CambioContra(
        contexto: context,
        contrasena: contrasena,
        validarContrasena: validarContrasena,
        nuevaContrasena: nuevaContrasena,
        validarNuevaContrasena: validarNuevaContrasena,
        confirContrasena: confirContrasena,
        validarConfirContrasena: validarConfirContrasena,
        usuario: usuario,
        correoUsuario: correoUsuario);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cambiar Contraseña:',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.justify,
        ),
        EntradaContrasena(
          controlador: nuevaContrasena,
          etiqueta: 'Nueva contraseña',
          onChanged: (value) => cambiarContra.onChanged(),
          onComplete: cambiarContra.onCompleteNuevaContra,
          hayValor: hayNuevaContrasena,
          error: hayNuevaContrasena == true ? null : nuevaContrasenaError,
        ),
        EntradaContrasena(
          controlador: confirContrasena,
          onChanged: (value) => cambiarContra.onChanged(),
          onComplete: cambiarContra.onCompleteConfContra,
          hayValor: hayConfirContrasena,
          error: hayConfirContrasena == true ? null : confirContrasenaError,
          etiqueta: 'Confirmar contraseña',
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: Text(
            'Para realizar el cambio por favor, ingrese su contraseña actual.',
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.justify,
          ),
        ),
        EntradaContrasena(
          controlador: contrasena,
          hayValor: hayContrasena,
          onChanged: (value) => cambiarContra.onChanged(),
          onComplete: cambiarContra.onCompleteContra,
          error: hayContrasena == true ? null : contrasenaError,
          etiqueta: 'Contraseña',
        ),
        Align(
          child: BotonesSettings(
            largo1: 0.1,
            largo: 0.2,
            accion: 'Cambiar contraseña',
            cancelar: 'Regresar',
            calcular: cambiarContra.cambiarContrase,
            limpiar: () => Navigator.pop(context),
          ),
        )
      ],
    );
  }
}
