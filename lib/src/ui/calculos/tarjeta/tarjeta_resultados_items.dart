import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultadosTarjetaItems extends StatelessWidget {
  final String total;
  const ResultadosTarjetaItems({required this.total, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lo que da un total de:",
          style: GoogleFonts.inter(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Align(
            child: Text(
              "\$ $total",
              style: GoogleFonts.inter(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 75, 35, 156),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
