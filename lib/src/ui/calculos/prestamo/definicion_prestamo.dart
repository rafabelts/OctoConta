import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionPrestamo extends StatelessWidget {
  const DescripcionPrestamo({super.key});

  @override
  Widget build(BuildContext context) {
    var colorBodyTexto = Theme.of(context).scaffoldBackgroundColor;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('¿Qué es un prestamo?',
            style: GoogleFonts.inter(
              color: const Color(0xFFffe9f0),
              fontWeight: FontWeight.w700,
              fontSize: 28.6,
            ),
            textAlign: TextAlign.center),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Un préstamo es la operación mediante la cual la entidad financiera pone a disposición del cliente una determinada cantidad de dinero, estipulada previamente, mediante un contrato con el que dicho cliente adquiere la obligación de devolver el dinero en un tiempo delimitado. De manera habitual, a la cantidad de dinero prestada por el banco se le añaden unos intereses que también hay que devolver, y que variarán en función del tipo de préstamo solicitado.',
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
