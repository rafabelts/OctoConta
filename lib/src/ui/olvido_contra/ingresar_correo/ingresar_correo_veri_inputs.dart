import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CorreoParaVerificarInput extends StatelessWidget {
  final TextEditingController correoUser;
  final Function(dynamic) onChangedCorreoUser;
  final dynamic errorInCorreoUser;
  const CorreoParaVerificarInput(
      {required this.correoUser,
      required this.onChangedCorreoUser,
      required this.errorInCorreoUser,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Ingrese el correo asociado a su cuenta',
              style: GoogleFonts.inter(
                color: const Color(0xff2A195D),
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
          ),
          TextField(
            controller: correoUser,
            onChanged: onChangedCorreoUser,
            style: GoogleFonts.inter(
              color: const Color(0xff534677),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              errorText: errorInCorreoUser,
              errorStyle: GoogleFonts.inter(
                  fontSize: 13.15, fontWeight: FontWeight.w600),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.red)),
              label: Container(
                  margin: const EdgeInsets.only(top: 3.0),
                  child: const Text('Correo Electrónico')),
              labelStyle: GoogleFonts.inter(
                  textStyle: const TextStyle(color: Color(0xff534677)),
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
              contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Color(0xff534677))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Color(0xff534677))),
              prefixIcon: const Icon(
                Icons.mail_outline_rounded,
                color: Color(0xff534677),
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              '* Le enviaremos un correo para establecer su nueva contraseña',
              style: GoogleFonts.inter(
                color: const Color(0xff4527A0),
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          )
        ]);
  }
}
