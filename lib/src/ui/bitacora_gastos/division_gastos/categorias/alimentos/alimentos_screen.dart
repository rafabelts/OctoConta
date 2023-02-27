import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/gastos.dart';

class AlimentosScreen extends StatelessWidget {
  const AlimentosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> alimentosGastos = [
      ['Hamburgesa', '\$200'],
      ['Hamburgesa', '\$200'],
      ['Hamburgesa', '\$200'],
      ['Hamburgesa', '\$200'],
      ['Hamburgesa', '\$200'],
      ['Hamburgesa', '\$200'],
      ['Hamburgesa', '\$200'],
      ['Hamburgesa', '\$200'],
      ['Hamburgesa', '\$200'],
    ];

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Alimentos',
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
              GastosItems(compras: alimentosGastos),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18),
                child: Text(
                  "En alimentos ha gastado:",
                  style: GoogleFonts.inter(
                    color: const Color(0xFF2a195d),
                    fontWeight: FontWeight.w600,
                    fontSize: 24.2,
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
