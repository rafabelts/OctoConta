import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotonesEdicionSaldo extends StatelessWidget {
  const BotonesEdicionSaldo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar",
                      style: GoogleFonts.inter(
                        color: const Color(0xFF5E35B1),
                        fontWeight: FontWeight.w700,
                        fontSize: 26,
                      )),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  backgroundColor: const Color(0xFF5E35B1),
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 12.0),
                ),
                child: Text(
                  "Guardar",
                  style: GoogleFonts.inter(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 24,
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
