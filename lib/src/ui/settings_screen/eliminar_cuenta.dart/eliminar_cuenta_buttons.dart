import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EliminarCuentaButtons extends StatelessWidget {
  final VoidCallback eliminarCuenta;
  const EliminarCuentaButtons({required this.eliminarCuenta, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              fontSize: width <= 360 ? 20 : 22,
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
              'Eliminar cuenta',
              style: GoogleFonts.inter(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: width <= 360 ? 16 : 20,
              ),
            ))
      ],
    );
  }
}
