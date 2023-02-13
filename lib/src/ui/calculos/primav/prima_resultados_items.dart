import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultadosPrimaVacacionalItems extends StatelessWidget {
  final String cantidadPrimaRedondeado;
  final String diasVacaciones;
  const ResultadosPrimaVacacionalItems(
      {required this.diasVacaciones,
      required this.cantidadPrimaRedondeado,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Prima vacacional total:',
          style: GoogleFonts.inter(
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Align(
            child: Text(
              cantidadPrimaRedondeado,
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
            'Días de vacaciones:',
            style: GoogleFonts.inter(
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          child: Align(
            child: Text(
              diasVacaciones,
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
