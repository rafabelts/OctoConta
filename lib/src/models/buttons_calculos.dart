import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Botones extends StatelessWidget {
  final VoidCallback limpiar;
  final VoidCallback calcular;
  final double numeroAMultiplicar;
  const Botones(
      {required this.numeroAMultiplicar,
      required this.calcular,
      required this.limpiar,
      super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        children: [
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
                        fontSize: width <= 360 ? 28 : 34,
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
                    fontSize: width <= 360 ? 23 : 29,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: numeroAMultiplicar),
            child: ListTile(
              title: Text(
                'Regresar',
                style: GoogleFonts.poppins(
                  color: const Color(0xff2E2B52), //382872 //453a88
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
