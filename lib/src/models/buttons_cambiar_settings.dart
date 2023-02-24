import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CambiarSettingsButtons extends StatelessWidget {
  final String cambio;
  final VoidCallback cambiar;

  const CambiarSettingsButtons(
      {required this.cambio, required this.cambiar, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: cambiar,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                backgroundColor: const Color(0xff4527A0),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
              ),
              child: Text(
                'Cambiar $cambio',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancelar',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                color: const Color(0xff4527A0),
                fontSize: 27,
              ),
            ),
          ),
        )
      ],
    );
  }
}
