import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CambiarNombreButtons extends StatelessWidget {
  final VoidCallback cambiarnombreUser;

  const CambiarNombreButtons({required this.cambiarnombreUser, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: cambiarnombreUser,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                backgroundColor: const Color(0xff4527A0),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
              ),
              child: Text(
                'Cambiar',
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
