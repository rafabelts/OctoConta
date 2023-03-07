import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/informacion_ingreso.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/ingreso_items.dart';
import 'package:provider/provider.dart';

class CategoriasIngresosScreen extends StatefulWidget {
  const CategoriasIngresosScreen({super.key});

  @override
  State<CategoriasIngresosScreen> createState() =>
      _CategoriasIngresosScreenState();
}

class _CategoriasIngresosScreenState extends State<CategoriasIngresosScreen> {
  @override
  Widget build(BuildContext context) {
    final String? userName = Auth().currentUser?.displayName;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Ingresos',
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
          child: AdaptiveColumn(children: <AdaptiveContainer>[
            AdaptiveContainer(
                columnSpan: 12,
                child: Column(children: <Widget>[
                  Column(
                    children: [
                      const ItemsIngreso(),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          '$userName, este es el total de ingresos del mes:',
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
                          '\$${NumberFormat('#,###.##').format(Provider.of<InformacionIngresos>(context, listen: true).prepararTotalIngresos())}',
                          style: GoogleFonts.poppins(
                              color: const Color(0xFF2a195d), //0xFF2a195d
                              fontSize: 58,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                ]))
          ]),
        ));
  }
}
