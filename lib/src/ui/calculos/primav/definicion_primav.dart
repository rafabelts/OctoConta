import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionPrimaVacacional extends StatelessWidget {
  const DescripcionPrimaVacacional({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTitulo = const Color(0xFF382A62);
    var colorBodyTexto = const Color(0xFF534677);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Prima Vacacional:',
            style: GoogleFonts.inter(
              color: colorTitulo,
              fontWeight: FontWeight.w700,
              fontSize: 28.6,
            ),
            textAlign: TextAlign.center),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            'La prima vacacional es el dinero adicional que los patrones conceden a los empleados como suplemento para los días de descanso que se tomen en el año. Esto respaldado por el artículo 80 de la Ley Laboral de México.',
            style: GoogleFonts.inter(
                color: colorBodyTexto,
                fontWeight: FontWeight.w500,
                fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Artículo 80:',
            style: GoogleFonts.inter(
                color: colorTitulo, fontWeight: FontWeight.w700, fontSize: 27),
          ),
        ),
        Text(
          'Los trabajadores tendrán derecho a una prima no menor de veinticinco por ciento sobre los salarios que les correspondan durante el período de vacaciones.',
          style: GoogleFonts.inter(
              color: colorBodyTexto, fontWeight: FontWeight.w500, fontSize: 20),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
