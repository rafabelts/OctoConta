import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultadosIVAItems extends StatelessWidget {
  final String cantidadIVAText;
  final String cantidadIVARedondeado;
  final String total;
  const ResultadosIVAItems(
      {required this.cantidadIVAText,
      required this.cantidadIVARedondeado,
      required this.total,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          cantidadIVAText,
          style: GoogleFonts.inter(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.justify,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Align(
            child: Text(
              "\$ $cantidadIVARedondeado",
              style: GoogleFonts.inter(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 75, 35, 156),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            "Lo que da un total de:",
            style: GoogleFonts.inter(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.justify,
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
                color: const Color.fromARGB(255, 75, 35, 156),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
