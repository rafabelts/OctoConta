import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultadosPrestamoItems extends StatelessWidget {
  final String total;
  const ResultadosPrestamoItems({required this.total, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Su pago mensual será de:",
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.justify,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Align(
            child: Text(
              "\$$total",
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 75, 35, 156),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
