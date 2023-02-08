import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculoPrimaVacacionalInput extends StatelessWidget {
  final TextEditingController year;
  final TextEditingController sueldo;
  final Function(dynamic) onChanged;
  final bool esNumeroYear;
  final bool esNumeroSueldo;
  final VoidCallback onCompleteYear;
  final VoidCallback onCompleteSueldo;

  const CalculoPrimaVacacionalInput(
      {required this.year,
      required this.sueldo,
      required this.onChanged,
      required this.esNumeroYear,
      required this.esNumeroSueldo,
      required this.onCompleteYear,
      required this.onCompleteSueldo,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Año de llegada a la empresa:",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            onEditingComplete: onCompleteYear,
            onChanged: onChanged,
            controller: year,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorText: esNumeroYear ? null : 'Por favor ingrese un número',
                errorStyle: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w600),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.red)),
                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                hintText: "0",
                hintStyle: Theme.of(context).textTheme.labelLarge,
                enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF382A62))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.0, color: Color(0xFF382A62)))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Text(
            "Sueldo neto:(\$)",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextField(
            onEditingComplete: onCompleteSueldo,
            onChanged: onChanged,
            controller: sueldo,
            keyboardType: TextInputType.number,
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
            cursorColor: const Color(0xFF382A62),
            decoration: InputDecoration(
                errorText:
                    esNumeroSueldo ? null : 'Por favor ingrese un número',
                errorStyle: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w600),
                errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2.0)),
                focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 2.0, color: Colors.red)),
                contentPadding: const EdgeInsets.symmetric(vertical: 2.0),
                hintText: "0.0",
                hintStyle: Theme.of(context).textTheme.labelLarge,
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
