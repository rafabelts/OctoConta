import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultadosPrimaVacacionalItems extends StatelessWidget {
  final String periodo;
  final String subsidioRedondeado;
  final String isrRedondeado;
  const ResultadosPrimaVacacionalItems(
      {required this.periodo,
      required this.isrRedondeado,
      required this.subsidioRedondeado,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Su ISR $periodo será de:',
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
              "\$$isrRedondeado",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 75, 35, 156),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Y tendrá un subsidio de:',
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Align(
            child: Text(
              "\$$subsidioRedondeado",
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
