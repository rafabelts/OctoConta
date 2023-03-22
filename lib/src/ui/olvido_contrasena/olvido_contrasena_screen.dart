import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/entradas_autentificacion/entradas_correo_nombre.dart';

import '../../constants/colors.dart';
import '../../models/pagina_principal/botones_settings.dart';
import '../../settings_octo/olvido_contra.dart';

class OlvidoContrasenaScreen extends StatefulWidget {
  const OlvidoContrasenaScreen({super.key});

  @override
  State<OlvidoContrasenaScreen> createState() => _OlvidoContrasenaScreenState();
}

class _OlvidoContrasenaScreenState extends State<OlvidoContrasenaScreen> {
  TextEditingController correo = TextEditingController();

  @override
  void dispose() {
    correo.dispose();
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

  @override
  Widget build(BuildContext context) {
    OlvidoContrasena olvidoContra = OlvidoContrasena(
      contexto: context,
      correo: correo,
      validarCorreo: validarCorreo,
    );
    return Column(
      children: [
        Text(
          'Ingrese el correo asociado a su cuenta.',
          style: GoogleFonts.inter(
            color: primario,
            fontWeight: FontWeight.bold,
            fontSize: 26.sp,
          ),
          textAlign: TextAlign.justify,
        ),
        EntradaCorreoNombre(
          controlador: correo,
          hayValor: hayCorreo,
          onChanged: (value) => olvidoContra.onChanged(),
          onComplete: olvidoContra.onComplete,
          error: hayCorreo == true ? null : correoError,
          etiqueta: 'Correo electrónico',
          icono: Icons.mail_outline_rounded,
        ),
        Padding(
          padding: EdgeInsets.only(top: 15.h),
          child: Text(
            '* Le enviaremos un correo para establecer su nueva contraseña.',
            style: GoogleFonts.inter(
              color: botonSecundarioColor,
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        BotonesSettings(
          accion: 'Enviar código',
          cancelar: 'Cancelar',
          calcular: olvidoContra.enviarCorreoRestablecimiento,
          limpiar: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
