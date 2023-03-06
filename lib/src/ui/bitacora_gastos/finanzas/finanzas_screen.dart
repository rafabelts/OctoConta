import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/models/modal_selecciones.dart';
import 'package:octoconta_final/src/models/tarjeta.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/agregar_articulo/gastos_input_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/editar_saldo/editar_saldo_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/agregar_ingreso/ingresos_input_sceen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/informacion_ingreso.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/ingresos_screen.dart';
import 'package:provider/provider.dart';

import '../division_gastos/categorias/otros/informacion_gastos_otros.dart';
import '../division_gastos/categorias/saluhigiene/informacion_gastos_saludhi.dart';
import '../division_gastos/categorias/servicios/informacion_gastos_servicios.dart';
import '../division_gastos/categorias/suma_gastos_categorias.dart';
import '../division_gastos/categorias/suscripciones/informacion_gastos_suscripciones.dart';

class FinanzasScreen extends StatefulWidget {
  const FinanzasScreen({super.key});

  @override
  State<FinanzasScreen> createState() => _FinanzasScreenState();
}

class _FinanzasScreenState extends State<FinanzasScreen> {
  @override
  Widget build(BuildContext context) {
    goToGastos() => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CategoriasGastosScreen(),
          ),
        );
    goToIngresos() => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const CategoriasIngresosScreen()));
    goToEditarBalance() => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditarBalanceScreen(),
          ),
        );

    double providerGastoAlimento =
        Provider.of<InformacionGastosAlimentos>(context, listen: true)
            .obtenerTotalGastosAlimentos();

    double providerGastoSalud =
        Provider.of<InformacionGastosSaludHigiene>(context, listen: true)
            .obtenerTotalGastoSalud();

    double providerGastoServicios =
        Provider.of<InformacionGastosServicios>(context, listen: true)
            .obtenerTotalGastosServicios();

    double providerGastoSuscripciones =
        Provider.of<InformacionGastosSuscripciones>(context, listen: true)
            .obtenerTotalGastosSuscripciones();

    double providerGastoOtros =
        Provider.of<InformacionGastosOtros>(context, listen: true)
            .obtenerTotalGastosOtros();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Finanzas',
          style: GoogleFonts.inter(
              color: const Color(0xFF2a195d),
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        controller:
            ScrollController(keepScrollOffset: true, initialScrollOffset: 0),
        physics: const BouncingScrollPhysics(),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
              columnSpan: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      onTap: goToEditarBalance,
                      title: Text(
                        'Editar Saldo',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF5E35B1),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 17,
                        color: Color(0xFF5E35B1),
                      ),
                    ),
                  ),
                  Consumer<SumaTotalGastos>(
                    builder: (context, value, child) => TarjetaSaldoMensual(
                      opcion: 'Gastado:',
                      total:
                          '\$${NumberFormat("#,###.##", "en_US").format(value.obtenerGastoTotal(providerGastoAlimento, providerGastoSalud, providerGastoServicios, providerGastoSuscripciones, providerGastoOtros))}',
                      colorTotal: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                  ListTile(
                    onTap: goToGastos,
                    title: Text(
                      'Revisar Gastos',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF5E35B1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                      color: Color(0xFF5E35B1),
                    ),
                  ),
                  Consumer<InformacionIngresos>(
                    builder: (context, value, child) => Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: TarjetaSaldoMensual(
                        opcion: 'Ingresos:',
                        total:
                            '\$${NumberFormat("#,###.##", "en_US").format(value.obtenerTotalIngresos())}',
                        colorTotal: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: goToIngresos,
                    title: Text(
                      'Revisar Ingresos',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF5E35B1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                      color: Color(0xFF5E35B1),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: const Color(0xFF5E35B1),
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.remove,
              color: Theme.of(context).scaffoldBackgroundColor,
              size: 20,
            ),
            label: 'Agregar gasto.',
            labelStyle: GoogleFonts.inter(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.w600,
            ),
            labelBackgroundColor: Colors.red,
            backgroundColor: Colors.red,
            onTap: () => modalBottomSeleciones(context, const GastosInputs()),
          ),
          SpeedDialChild(
            child: Icon(
              Icons.add,
              color: Theme.of(context).scaffoldBackgroundColor,
              size: 20,
            ),
            label: 'Agregar ingreso.',
            labelBackgroundColor: Colors.green,
            labelStyle: GoogleFonts.inter(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.w600,
            ),
            backgroundColor: Colors.green,
            onTap: () => modalBottomSeleciones(context, const IngresosInputs()),
          ),
        ],
        activeChild: Icon(
          Icons.keyboard_return,
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 40,
        ),
        overlayColor: Colors.black,
        overlayOpacity: 0.4,
        spaceBetweenChildren: 12,
        buttonSize: const Size(70, 70),
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
          size: 40,
        ),
      ),
    );
  }
}
