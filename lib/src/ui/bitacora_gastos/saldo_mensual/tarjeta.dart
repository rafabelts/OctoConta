import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TarjetaSaldoMensual extends StatelessWidget {
  const TarjetaSaldoMensual({super.key});

  @override
  Widget build(BuildContext context) {
    final decoracion = BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      gradient: const LinearGradient(
        begin: Alignment(-0.400, -0.400),
        end: Alignment(-1.108, 2.80),
        colors: <Color>[
          Color(0xff2a195d),
          Color.fromARGB(211, 111, 96, 150)
        ], //2a195d  //2a1861
        stops: <double>[0, 1.0],
      ),
    );
    return Container(
      width: double.infinity,
      height: 220,
      decoration: decoracion,
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Saldo:',
            style: GoogleFonts.inter(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.w600,
                fontSize: 34),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                // '\$0',
                '\$0',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 55),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
