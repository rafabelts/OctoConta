import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CerrarSesionButtons extends StatelessWidget {
  final VoidCallback eliminarCuenta;
  const CerrarSesionButtons({required this.eliminarCuenta, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancelar',
            style: GoogleFonts.inter(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              backgroundColor: const Color(0xff5E35B1),
              elevation: 10,
              shadowColor: const Color(0xff2A195D),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            ),
            onPressed: () => eliminarCuenta(),
            child: Text(
              'Si, cerrar sesión',
              style: GoogleFonts.inter(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ))
      ],
    );
  }
}
