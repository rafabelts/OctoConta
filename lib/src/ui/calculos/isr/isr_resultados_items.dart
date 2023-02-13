import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultadosPrimaVacacionalItems extends StatelessWidget {
  final String subsidioRedondeado;
  final String isrRedondeado;
  const ResultadosPrimaVacacionalItems(
      {required this.isrRedondeado,
      required this.subsidioRedondeado,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Su ISR diario sera de:',
          style: GoogleFonts.inter(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Align(
            child: Text(
              isrRedondeado,
              style: GoogleFonts.inter(
                fontSize: 44,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 75, 35, 156),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Y tendra un subsidio de:',
            style: GoogleFonts.inter(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Align(
            child: Text(
              subsidioRedondeado,
              style: GoogleFonts.inter(
                fontSize: 38,
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
