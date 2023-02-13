import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodigoParaVerificarInput extends StatelessWidget {
  const CodigoParaVerificarInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Verificacion',
              style: GoogleFonts.inter(
                color: const Color(0xff2A195D),
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 25.0),
            child: Text(
              'Le hemos enviado un código a su correo electrónico. Ingreselo a continuación.',
              style: GoogleFonts.inter(
                color: const Color(0xff4527A0),
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          TextField(
            style: GoogleFonts.inter(
              color: const Color(0xff534677),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              label: Container(
                  margin: const EdgeInsets.only(top: 3.0, left: 10.0),
                  child: const Text('Introducir Código')),
              labelStyle: GoogleFonts.inter(
                  textStyle: const TextStyle(color: Color(0xff534677)),
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
              contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1.0, color: Color(0xff534677))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Color(0xff534677))),
            ),
          ),
        ]);
  }
}
