import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../../models/entradas_autentificacion/entradas_contrasena.dart';
import '../../../services/auth.dart';
import '../../../settings_octo/eliminar_cuenta.dart';

class ContenidoDialogEliminarCuenta extends StatefulWidget {
  const ContenidoDialogEliminarCuenta({super.key});

  @override
  State<ContenidoDialogEliminarCuenta> createState() =>
      _ContenidoDialogEliminarCuentaState();
}

class _ContenidoDialogEliminarCuentaState
    extends State<ContenidoDialogEliminarCuenta> {
  TextEditingController contrasena = TextEditingController();

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

    EliminarCuenta eliminacionCuenta = EliminarCuenta(
        contexto: context,
        contrasena: contrasena,
        validarContrasena: validarContrasena,
        usuario: usuario,
        correoUsuario: correoUsuario);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 20.h),
          child: Text(
            "Eliminar cuenta",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.justify,
          ),
        ),
        Text(
          "Para continuar, ingrese su contraseña por favor.",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.justify,
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50.h),
          child: EntradaContrasena(
            controlador: contrasena,
            hayValor: hayContrasena,
            onComplete: eliminacionCuenta.onComplete,
            error: hayContrasena == true ? null : contrasenaError,
            onChanged: (value) => eliminacionCuenta.onChanged(),
            etiqueta: "Contraseña",
          ),
        ),
        Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: eliminacionCuenta.eliminar,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0.r)),
                  backgroundColor: botonPrimarioColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 12.0.w),
                ),
                child: Text(
                  "Eliminar cuenta",
                  style: GoogleFonts.inter(
                    color: fondoColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.w),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancelar',
                    style: GoogleFonts.inter(
                      color: colorError,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
