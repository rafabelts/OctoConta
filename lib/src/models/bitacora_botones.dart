import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotonesBitacora extends StatelessWidget {
  final String agregar;
  final VoidCallback agregarOpcion;
  final String cancelar;
  final VoidCallback cancelarOpcion;
  const BotonesBitacora(
      {required this.agregar,
      required this.agregarOpcion,
      required this.cancelar,
      required this.cancelarOpcion,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextButton(
                  onPressed: cancelarOpcion,
                  child: Text(cancelar,
                      style: GoogleFonts.inter(
                        color: const Color(0xFF5E35B1),
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      )),
                ),
              ),
              ElevatedButton(
                onPressed: agregarOpcion,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: const Color(0xFF5E35B1),
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 12.0),
                ),
                child: Text(
                  agregar,
                  style: GoogleFonts.inter(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
