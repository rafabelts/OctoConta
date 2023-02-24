import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotonesParaRecuperacion extends StatelessWidget {
  final VoidCallback enviarCodigo;
  const BotonesParaRecuperacion({required this.enviarCodigo, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: enviarCodigo,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  backgroundColor: const Color(0xff4527A0),
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                ),
                child: Text(
                  'Envíar Código',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancelar',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff4527A0),
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
