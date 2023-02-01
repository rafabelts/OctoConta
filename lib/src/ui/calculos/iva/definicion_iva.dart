import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionIVA extends StatelessWidget {
  const DescripcionIVA({super.key});

  @override
  Widget build(BuildContext context) {
    var colorBodyTexto = Theme.of(context).scaffoldBackgroundColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('¿Qué es el IVA?',
            style: GoogleFonts.inter(
              color: const Color(0xFFffe9f0),
              fontWeight: FontWeight.w700,
              fontSize: 28.6,
            ),
            textAlign: TextAlign.center),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Text(
            'El Impuesto al Valor Agregado (IVA) es un tipo de impuesto aplicado al consumo de bienes y servicios en distintos países. Esta carga consiste en un porcentaje o tasa determinada por las instituciones tributarias que se agrega al costo final de aquellos productos o servicios que consumes.',
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
            'Función:',
            style: GoogleFonts.inter(
                color: const Color(0xFFffe9f0),
                fontWeight: FontWeight.w600,
                fontSize: 26),
          ),
        ),
        Text(
          'La función del cobro de este impuesto es para que el estado obtenga ingresos mediante cargas las actividades de venta de bienes, servicios, arrendamiento de bienes, así como también la importación de bienes y servicios.',
          style: GoogleFonts.inter(
              color: colorBodyTexto, fontWeight: FontWeight.w500, fontSize: 20),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
