import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_email/contra_para_cambio_email/contra_email_buttons.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_email/contra_para_cambio_email/contra_email_inputs.dart';

class ContraCambiarCorreoScreen extends StatelessWidget {
  final TextEditingController password;
  final Function(dynamic) onChangedPassword;
  final dynamic errorPassword;
  final VoidCallback cambiar;
  const ContraCambiarCorreoScreen(
      {required this.password,
      required this.onChangedPassword,
      required this.errorPassword,
      required this.cambiar,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Cambiar Correo',
          style: GoogleFonts.inter(
            color: const Color(0xff382A62),
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Para continuar, ingrese su contraseña por favor.',
            style: GoogleFonts.inter(
              color: const Color(0xff382A62),
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: ContraCambioEmailInput(
            passwordUser: password,
            onChangedPassword: onChangedPassword,
            passwordError: errorPassword,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ContraCambioEmailBotones(cambiar: cambiar),
        )
      ],
    );
  }
}
