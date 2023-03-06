import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/informacion_gastos_otros.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suma_gastos_categorias.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suscripciones/informacion_gastos_suscripciones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias_items.dart';
import 'package:provider/provider.dart';

import 'categorias/saluhigiene/informacion_gastos_saludhi.dart';
import 'categorias/servicios/informacion_gastos_servicios.dart';

class CategoriasGastosScreen extends StatefulWidget {
  const CategoriasGastosScreen({super.key});

  @override
  State<CategoriasGastosScreen> createState() => _CategoriasGastosScreenState();
}

class _CategoriasGastosScreenState extends State<CategoriasGastosScreen> {
  @override
  Widget build(BuildContext context) {
    final String? userName = Auth().currentUser?.displayName;
    double providerGastoAlimento =
        Provider.of<InformacionGastosAlimentos>(context, listen: false)
            .obtenerTotalGastosAlimentos();

    double providerGastoSalud =
        Provider.of<InformacionGastosSaludHigiene>(context, listen: false)
            .obtenerTotalGastoSalud();

    double providerGastoServicios =
        Provider.of<InformacionGastosServicios>(context, listen: false)
            .obtenerTotalGastosServicios();

    double providerGastoSuscripciones =
        Provider.of<InformacionGastosSuscripciones>(context, listen: false)
            .obtenerTotalGastosSuscripciones();

    double providerGastoOtros =
        Provider.of<InformacionGastosOtros>(context, listen: false)
            .obtenerTotalGastosOtros();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categorías',
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
        // padding: const EdgeInsets.all(5.0),
        physics: const BouncingScrollPhysics(),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
              columnSpan: 12,
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      const CategoriasItems(),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text(
                          '$userName, este mes ha gastado:',
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(
                                  232, 42, 25, 93), //0xFF2a195d
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          '\$${NumberFormat('#,###.##').format(Provider.of<SumaTotalGastos>(context, listen: false).obtenerGastoTotal(providerGastoAlimento, providerGastoSalud, providerGastoServicios, providerGastoSuscripciones, providerGastoOtros))}',
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF2a195d), //0xFF2a195d
                              fontSize: 58,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
