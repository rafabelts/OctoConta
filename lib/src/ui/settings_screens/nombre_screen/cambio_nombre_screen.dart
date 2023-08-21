import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/entradas_autentificacion/entradas_correo_nombre.dart';
import '../../../models/pagina_principal/botones_settings.dart';
import '../../../services/auth.dart';
import '../../../settings_octo/cambio_nombre.dart';

class CambioNombreScreen extends StatefulWidget {
  const CambioNombreScreen({super.key});

  @override
  State<CambioNombreScreen> createState() => _CambioNombreScreenState();
}

class _CambioNombreScreenState extends State<CambioNombreScreen> {
  TextEditingController nuevoNombre = TextEditingController();

  @override
  void dispose() {
    nuevoNombre.dispose();
    super.dispose();
  }

  bool hayNombre = true;
  String nombreError = '';

  void validarNombre(bool valido, String error) {
    setState(() {
      hayNombre = valido;
      nombreError = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User? usuario = Auth().currentUser;
    final String? nombreUsuario = Auth().currentUser?.displayName;

    CambioNombre cambiarNombre = CambioNombre(
      contexto: context,
      nombre: nuevoNombre,
      validarNombre: validarNombre,
      usuario: usuario,
      nombreUsuario: nombreUsuario,
    );
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cambiar Nombre:',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          // Text(
          //   'Cambiar Nombre:',
          //   style: Theme.of(context).textTheme.headlineMedium,
          //   textAlign: TextAlign.justify,
          // ),
          EntradaCorreoNombre(
            controlador: nuevoNombre,
            onChanged: (value) => cambiarNombre.onChanged(),
            onComplete: cambiarNombre.onComplete,
            hayValor: hayNombre,
            error: hayNombre == true ? null : nombreError,
            etiqueta: 'Nuevo nombre',
            icono: Icons.person_outline_rounded,
          ),
          Align(
            child: BotonesSettings(
              largo1: 0.35,
              largo: 0.45,
              accion: 'Cambiar nombre',
              // cancelar: 'Regresar',
              funcion: cambiarNombre.cambiarNombre,
            ),
          )
        ],
      ),
    );
  }
}
