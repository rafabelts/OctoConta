import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotonesParaRecuperacion extends StatelessWidget {
  final VoidCallback continuar;
  final String textoBoton;
  const BotonesParaRecuperacion(
      {required this.textoBoton, required this.continuar, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: continuar,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: const Color(0xFF5E35B1),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            ),
            child: Text(
              textoBoton,
              style: GoogleFonts.inter(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontSize: 34,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ));
  }
}
