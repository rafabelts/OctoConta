import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias_screen.dart';

class BotonCategorias extends StatelessWidget {
  const BotonCategorias({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          shadowColor: const Color(0xff4527A0),
          elevation: 15,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CategoriasGastosScreen()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.,
          children: <Widget>[
            Text(
              'Gasto Mensual:',
              style: GoogleFonts.poppins(
                  color: const Color(0xff382A62), //0xFF454568
                  fontWeight: FontWeight.w600,
                  fontSize: 35),
            ),
            Text(
              'Alimentos: \$ 0',
              style: GoogleFonts.poppins(
                  color: const Color(0xFF4527A0), //0xFF454568
                  fontWeight: FontWeight.w600,
                  fontSize: 28),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Salud e Higiene: \$ 0',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF4527A0), //0xFF454568
                    fontWeight: FontWeight.w600,
                    fontSize: 28),
              ),
            ),
            Text(
              'Servicios: \$ 0',
              style: GoogleFonts.poppins(
                  color: const Color(0xFF4527A0), //0xFF454568
                  fontWeight: FontWeight.w600,
                  fontSize: 28),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Suscripciones: \$ 0',
                style: GoogleFonts.poppins(
                    color: const Color(0xFF4527A0), //0xFF454568
                    fontWeight: FontWeight.w600,
                    fontSize: 28),
              ),
            ),
            Text(
              'Otros: \$ 0',
              style: GoogleFonts.poppins(
                  color: const Color(0xFF4527A0), //0xFF454568
                  fontWeight: FontWeight.w600,
                  fontSize: 28),
            ),
            const Divider(color: Color(0xff382A62)),
            Text(
              'Total Gastado:',
              style: GoogleFonts.poppins(
                  color: const Color(0xff382A62), //0xFF454568
                  fontWeight: FontWeight.w600,
                  fontSize: 32),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '\$ 0',
                style: GoogleFonts.poppins(
                    color: const Color(0xff382A62), //0xFF454568
                    fontWeight: FontWeight.w600,
                    fontSize: 50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
