import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescripcionTarjeta extends StatelessWidget {
  const DescripcionTarjeta({super.key});

  @override
  Widget build(BuildContext context) {
    var colorBodyTexto = Theme.of(context).scaffoldBackgroundColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Tarjetas de crédito:',
          style: GoogleFonts.inter(
            color: const Color(0xFFffe9f0),
            fontWeight: FontWeight.w700,
            fontSize: 28.6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Con las tarjetas de crédito, se pueden realizar pagos u retiros de dinero, hasta el límite de crédito fijado por la entidad financiera o banco, sin necesidad de tener en ese momento fondos en la cuenta bancaria.',
            style: GoogleFonts.inter(
                color: colorBodyTexto,
                fontWeight: FontWeight.w500,
                fontSize: 20),
            textAlign: TextAlign.justify,
          ),
        ),
        Text(
          'Cuando la entidad financiera te proporciona una tarjeta de crédito, también te asigna una fecha de corte y una fecha de pago; de esta forma, mes a mes la entidad financiera hace las cuentas de lo que has gastado de tu cupo y a cuantas cuotas lo has diferido, así calcula tu pago mínimo.',
          style: GoogleFonts.inter(
              color: colorBodyTexto, fontWeight: FontWeight.w500, fontSize: 20),
          textAlign: TextAlign.justify,
        )
      ],
    );
  }
}
