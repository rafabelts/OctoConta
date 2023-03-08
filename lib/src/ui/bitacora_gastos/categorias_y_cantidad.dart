import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/otros/informacion_gastos_otros.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/saluhigiene/informacion_gastos_saludhi.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/servicios/informacion_gastos_servicios.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suscripciones/informacion_gastos_suscripciones.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/informacion_ingreso.dart';
import 'package:provider/provider.dart';

class CategoriasYCantidades extends StatelessWidget {
  const CategoriasYCantidades({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> categoriaYgasto = [
      [
        'Alimentos:',
        Provider.of<InformacionGastosAlimentos>(context, listen: true)
            .prepararTotalGastos(),
        Colors.red
      ],
      [
        'Salud e Higiene:',
        Provider.of<InformacionGastosSaludHigiene>(context, listen: true)
            .prepararTotalGastos(),
        Colors.red
      ],
      [
        'Servicios:',
        Provider.of<InformacionGastosServicios>(context, listen: true)
            .prepararTotalGastos(),
        Colors.red
      ],
      [
        'Suscripciones:',
        Provider.of<InformacionGastosSuscripciones>(context, listen: true)
            .prepararTotalGastos(),
        Colors.red
      ],
      [
        'Otros:',
        Provider.of<InformacionGastosOtros>(context, listen: true)
            .prepararTotalGastos(),
        Colors.red
      ],
      [
        'Ingresos:',
        // prepara datos
        Provider.of<InformacionIngresos>(context, listen: true)
            .prepararTotalIngresos(),
        Colors.green
      ]
    ];
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Color(0xff4527A0),
                offset: Offset(2.4, 5.5),
                blurRadius: 8,
                spreadRadius: 0,
              )
            ]),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            ListView.builder(
              itemCount: categoriaYgasto.length,
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ListTile(
                    title: Text(
                      categoriaYgasto[index][0],
                      style: GoogleFonts.inter(
                          color: const Color(0xFF4527A0), //0xFF454568
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    trailing: Text(
                      '\$${NumberFormat("#,###.##", "en_US").format(categoriaYgasto[index][1])}',
                      style: GoogleFonts.inter(
                          color: categoriaYgasto[index][2], //0xFF454568
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
// NumberFormat("#,###.0#", "en_US").format

