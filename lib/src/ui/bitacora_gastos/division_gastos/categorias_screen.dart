import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias_items.dart';

class CategoriasGastosScreen extends StatelessWidget {
  const CategoriasGastosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userName = Auth().currentUser?.displayName;

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
          child: AdaptiveColumn(children: <AdaptiveContainer>[
            AdaptiveContainer(
                columnSpan: 12,
                child: Column(children: <Widget>[
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
                          '\$0',
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

  // Widget _buildInputs(BuildContext context) {
  //   return Padding(
  //       padding: const EdgeInsets.all(5.0),
  //       child: Padding(
  //         padding: const EdgeInsets.only(top: 0.01),
  //         child: Column(
  //           children: const <Widget>[
  //             AgregarGastoInputs(),
  //             Padding(
  //                 padding: EdgeInsets.only(top: 40.0),
  //                 child: CategoriasEleccion()),
  //             BotonesBitacora(),
  //           ],
  //         ),
  //       ));
  // }
}
