import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Botones extends StatelessWidget {
  final VoidCallback limpiar;
  final VoidCallback calcular;
  const Botones({required this.calcular, required this.limpiar, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextButton(
                  onPressed: limpiar,
                  child: Text("Borrar",
                      style: GoogleFonts.inter(
                        color: const Color(0xFF5E35B1),
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                      )),
                ),
              ),
              ElevatedButton(
                onPressed: calcular,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: const Color(0xFF5E35B1),
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 12.0),
                ),
                child: Text(
                  "Calcular",
                  style: GoogleFonts.inter(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 29,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
