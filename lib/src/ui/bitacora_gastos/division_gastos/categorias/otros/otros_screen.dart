import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/gastos.dart';

class GastosOtrosScreen extends StatelessWidget {
  const GastosOtrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> otrosGastos = [];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Otros',
            style: GoogleFonts.inter(
                color: const Color(0xFF2a195d),
                fontWeight: FontWeight.bold,
                fontSize: 28),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, size: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GastosItems(compras: otrosGastos),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18),
                child: Text(
                  "En otros ha gastado:",
                  style: GoogleFonts.inter(
                    color: const Color(0xFF2a195d),
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "\$ 0",
                  style: GoogleFonts.inter(
                    color: const Color(0xff4527A0),
                    fontWeight: FontWeight.w700,
                    fontSize: 50,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
