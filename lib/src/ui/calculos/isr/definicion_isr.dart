import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionISR extends StatelessWidget {
  const DescripcionISR({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTitulo = const Color(0xFF382A62);
    var colorBodyTexto = const Color(0xFF534677);
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('¿Qué es el ISR?',
              style: GoogleFonts.inter(
                color: colorTitulo,
                fontWeight: FontWeight.w700,
                fontSize: width <= 360 ? 22 : 28,
              ),
              textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'El Impuesto Sobre Renta (ISR) es una carga fiscal directa que se aplica a los ingresos que incrementan el patrimonio de un contribuyente. De acuerdo a la ley del ISR, el pago de este impuesto es obligatorio tanto para personas fisicas y morales.',
              style: GoogleFonts.inter(
                  color: colorBodyTexto,
                  fontWeight: FontWeight.w500,
                  fontSize: width <= 360 ? 16 : 20),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Impuesto Sobre Renta (ISR) a favor:',
              style: GoogleFonts.inter(
                  color: colorTitulo,
                  fontWeight: FontWeight.w700,
                  fontSize: width <= 360 ? 21 : 27),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Cuando tiene un saldo a favor podrá solicitar las devoluciones que le correspondan. Esto ocurre cuando al efectuar el cálculo de sus impuestos, resulta que pagó más de lo que debía, por lo que puede solicitar ante el SAT que le sea devuelta la cantidad.',
                style: GoogleFonts.inter(
                    color: colorBodyTexto,
                    fontWeight: FontWeight.w500,
                    fontSize: width <= 360 ? 16 : 20),
                textAlign: TextAlign.justify,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Impuesto Sobre Renta (ISR) a retener:',
              style: GoogleFonts.inter(
                  color: colorTitulo,
                  fontWeight: FontWeight.w700,
                  fontSize: width <= 360 ? 21 : 27),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Es la cantidad de dinero que debe ser retenido por una empresa o empleador de los pagos que realiza a sus empleados o contratistas, y que posteriormente debe ser entregado a la autoridad fiscal correspondiente.',
                style: GoogleFonts.inter(
                    color: colorBodyTexto,
                    fontWeight: FontWeight.w500,
                    fontSize: width <= 360 ? 16 : 20),
                textAlign: TextAlign.justify,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              'Sueldo Bruto:',
              style: GoogleFonts.inter(
                  color: colorTitulo,
                  fontWeight: FontWeight.w700,
                  fontSize: width <= 360 ? 21 : 27),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Es la cantidad total de dinero a favor del trabajador que una empresa debe pagar como contraprestación por sus servicios profesionales.',
                style: GoogleFonts.inter(
                    color: colorBodyTexto,
                    fontWeight: FontWeight.w500,
                    fontSize: width <= 360 ? 16 : 20),
                textAlign: TextAlign.justify,
              )),
        ],
      ),
    );
  }
}
