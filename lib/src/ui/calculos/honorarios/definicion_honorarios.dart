import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionHonorarios extends StatelessWidget {
  const DescripcionHonorarios({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTitulo = const Color(0xFF382A62);
    var colorBodyTexto = const Color(0xFF534677);
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Honorarios:',
            style: GoogleFonts.inter(
              color: colorTitulo,
              fontWeight: FontWeight.w700,
              fontSize: width <= 360 ? 22 : 28,
            ),
            textAlign: TextAlign.center),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Tipo de pago que se efectúa a alguien que realiza de manera autónoma una tarea o servicio para una empresa o persona. Se entiende que esta contraprestación económica que percibe un profesional por la prestación de servicios. Esto significa, que no se trata de un trabajador que se encuentra en nómina, es decir, que no existe una relación laboral contratada.',
            style: GoogleFonts.inter(
                color: colorBodyTexto,
                fontWeight: FontWeight.w500,
                fontSize: width <= 360 ? 16 : 20),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
