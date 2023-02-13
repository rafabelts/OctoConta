import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CambiarEmailInput extends StatelessWidget {
  const CambiarEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Cambiar Correo',
            style: GoogleFonts.inter(
              color: const Color(0xff2A195D),
              fontWeight: FontWeight.w700,
              fontSize: 37.9,
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
                margin: const EdgeInsets.only(top: 3.0),
                child: const Text('Nuevo Correo Electrónico')),
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
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                backgroundColor: const Color(0xff4527A0),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
              ),
              child: Text(
                'Cambiar',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
