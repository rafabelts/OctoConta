import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionTarjeta extends StatelessWidget {
  const DescripcionTarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    var colorTitulo = const Color(0xFF382A62);
    var colorBodyTexto = const Color(0xFF534677);
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Tarjetas de crédito:',
          style: GoogleFonts.inter(
            color: colorTitulo,
            fontWeight: FontWeight.bold,
            fontSize: width <= 360 ? 22 : 28,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Con las tarjetas de crédito, se pueden realizar pagos u retiros de dinero, hasta el límite de crédito fijado por la entidad financiera o banco, sin necesidad de tener en ese momento fondos en la cuenta bancaria.',
            style: GoogleFonts.inter(
                color: colorBodyTexto,
                fontWeight: FontWeight.w500,
                fontSize: width <= 360 ? 16 : 20),
            textAlign: TextAlign.justify,
          ),
        ),
        Text(
          'Cuando la entidad financiera te proporciona una tarjeta de crédito, también te asigna una fecha de corte y una fecha de pago; de esta forma, mes a mes la entidad financiera hace las cuentas de lo que has gastado de tu cupo y a cuantas cuotas lo has diferido.',
          style: GoogleFonts.inter(
              color: colorBodyTexto,
              fontWeight: FontWeight.w500,
              fontSize: width <= 360 ? 16 : 20),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
