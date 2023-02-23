import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CambiarNombreInput extends StatelessWidget {
  final TextEditingController nombreUser;
  final Function(dynamic) onChangedNombreUser;
  final dynamic errorNombreUser;
  const CambiarNombreInput(
      {required this.nombreUser,
      required this.onChangedNombreUser,
      required this.errorNombreUser,
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
            'Cambiar Nombre',
            style: GoogleFonts.inter(
              color: const Color(0xff2A195D),
              fontWeight: FontWeight.w700,
              fontSize: 37.9,
            ),
          ),
        ),
        TextField(
          controller: nombreUser,
          onChanged: onChangedNombreUser,
          style: GoogleFonts.inter(
            color: const Color(0xff534677),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            errorText: errorNombreUser,
            errorStyle:
                GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0)),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: Colors.red)),
            label: Container(
                margin: const EdgeInsets.only(top: 3.0),
                child: const Text('Nuevo Nombre')),
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
              Icons.person_outline_rounded,
              color: Color(0xff534677),
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
