import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suscripciones/informacion_gastos_suscripciones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suscripciones/suscripciones_items.dart';
import 'package:provider/provider.dart';

class GastosSuscripcionesScreen extends StatelessWidget {
  const GastosSuscripcionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Suscripciones',
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
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: AdaptiveColumn(
              children: [
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const GastosSuscripcionesItems(),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.16),
                          child: Text(
                            "En suscripciones ha gastado:",
                            style: GoogleFonts.inter(
                              color: const Color(0xFF2a195d),
                              fontWeight: FontWeight.w600,
                              fontSize: 24.2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Text(
                            "\$${NumberFormat('#,###.##').format(Provider.of<InformacionGastosSuscripciones>(context, listen: true).prepararTotalGastos())}",
                            style: GoogleFonts.inter(
                              color: const Color(0xff4527A0),
                              fontWeight: FontWeight.w700,
                              fontSize: 50,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
