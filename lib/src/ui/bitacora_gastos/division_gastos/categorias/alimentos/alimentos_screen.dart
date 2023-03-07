import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/alimentos_items.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:provider/provider.dart';

class AlimentosScreen extends StatefulWidget {
  const AlimentosScreen({super.key});

  @override
  State<AlimentosScreen> createState() => _AlimentosScreenState();
}

class _AlimentosScreenState extends State<AlimentosScreen> {
  @override
  Widget build(BuildContext context) {
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
              const GastosAlimentosItems(),
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
                  "\$${NumberFormat('#,###.##').format(Provider.of<InformacionGastosAlimentos>(context, listen: true).prepararTotalGastos())}",
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
