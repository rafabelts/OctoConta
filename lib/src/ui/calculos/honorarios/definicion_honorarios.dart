import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionHonorarios extends StatelessWidget {
  const DescripcionHonorarios({super.key});

  @override
  Widget build(BuildContext context) {
    var colorBodyTexto = Theme.of(context).scaffoldBackgroundColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('¿Qué son los honorarios?',
            style: GoogleFonts.inter(
              color: const Color(0xFFffe9f0),
              fontWeight: FontWeight.w700,
              fontSize: 28.6,
            ),
            textAlign: TextAlign.center),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Los honorarios son un tipo de pago que se efectúa a alguien que realiza de manera autónoma una tarea o servicio para una empresa o persona. Se entiende que esta contraprestación económica que percibe un profesional por la prestación de servicios. Esto significa, que no se trata de un trabajador que se encuentra en nómina, es decir, que no existe una relación laboral contratada.',
            style: GoogleFonts.inter(
                color: colorBodyTexto,
                fontWeight: FontWeight.w500,
                fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
