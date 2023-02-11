import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EdicionSaldoInputs extends StatelessWidget {
  const EdicionSaldoInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Editar Saldo',
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            style: GoogleFonts.inter(
              color: const Color(0xFF534677),
              fontWeight: FontWeight.w600,
              fontSize: 45,
            ),
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0)),
                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                hintText: "0.0",
                hintStyle: GoogleFonts.inter(
                  color: const Color(0xFF534677),
                  fontWeight: FontWeight.w600,
                  fontSize: 45,
                ),
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF382A62))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.0, color: Color(0xFF382A62)))),
          ),
        ),
      ],
    );
  }
}
