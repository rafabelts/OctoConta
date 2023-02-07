import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionISR extends StatelessWidget {
  const DescripcionISR({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTitulo = const Color(0xFF382A62);
    var colorBodyTexto = const Color(0xFF534677);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('¿Qué es el ISR?',
            style: GoogleFonts.inter(
              color: colorTitulo,
              fontWeight: FontWeight.w700,
              fontSize: 28.6,
            ),
            textAlign: TextAlign.center),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'El Impuesto Sobre Renta (ISR) es una carga fiscal directa que se aplica a los ingresos que incrementan el patrimonio de un contribuyente. De acuerdo a la ley del ISR, el pago de este impuesto es obligatorio tanto para personas fisicas y morales.',
            style: GoogleFonts.inter(
                color: colorBodyTexto,
                fontWeight: FontWeight.w500,
                fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Persona física:',
            style: GoogleFonts.inter(
                color: colorTitulo, fontWeight: FontWeight.w700, fontSize: 26),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Sujeto jurídico, es decir, cualquier hombre o mujer, tú como persona eres una persona física.',
            style: GoogleFonts.inter(
                color: colorBodyTexto,
                fontWeight: FontWeight.w500,
                fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Persona moral:',
            style: GoogleFonts.inter(
                color: colorTitulo, fontWeight: FontWeight.w700, fontSize: 26),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            'Organización reconocida por la ley como una persona ficticia, como una corporación, una agencia gubernamental, una ONG o una organización internacional.',
            style: GoogleFonts.inter(
                color: colorBodyTexto,
                fontWeight: FontWeight.w500,
                fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        )
      ],
    );
  }
}
