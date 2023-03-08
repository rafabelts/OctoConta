import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/informacion_gastos_otros.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/otros_items.dart';
import 'package:provider/provider.dart';

class GastosOtrosScreen extends StatelessWidget {
  const GastosOtrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              const GastosOtrosItems(),
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
                  "\$${NumberFormat('#,###.##').format(Provider.of<InformacionGastosOtros>(context, listen: true).prepararTotalGastos())}",
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
