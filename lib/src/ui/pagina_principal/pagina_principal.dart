import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/categorias_y_cantidad.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/division_gastos/categorias/suma_gastos_categorias.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/finanzas/finanzas_screen.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/ingresos/informacion_ingreso.dart';
import 'package:octoconta_final/src/ui/pagina_principal/calculos_contables_items.dart';
import 'package:octoconta_final/src/ui/screen_seleccionada/screens_appbar.dart';
import 'package:provider/provider.dart';
import '../../models/tarjeta.dart';
import '../bitacora_gastos/division_gastos/categorias/alimentos/informacion_gastos_alimentos.dart';
import '../bitacora_gastos/division_gastos/categorias/otros/informacion_gastos_otros.dart';
import '../bitacora_gastos/division_gastos/categorias/saluhigiene/informacion_gastos_saludhi.dart';
import '../bitacora_gastos/division_gastos/categorias/servicios/informacion_gastos_servicios.dart';
import '../bitacora_gastos/division_gastos/categorias/suscripciones/informacion_gastos_suscripciones.dart';
import '../bitacora_gastos/editar_saldo/informacion_saldo.dart';
import '../settings_screen/settings_screen.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
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

    double saldo = Provider.of<InformacionSaldoUsuario>(context, listen: false)
        .saldoDUsuario;
    double saldoUsuario = saldo -
        Provider.of<SumaTotalGastos>(context).obtenerGastoTotal(
            providerGastoAlimento,
            providerGastoSalud,
            providerGastoServicios,
            providerGastoSuscripciones,
            providerGastoOtros) +
        Provider.of<InformacionIngresos>(context, listen: true)
            .obtenerTotalIngresos();

    return Scaffold(
        appBar: ScreensAppBar(
          titulo: '',
          leadingIcon: const Icon(null),
          icono: Icons.settings_outlined,
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const SettingsScreen())),
        ),
        body: SingleChildScrollView(
            controller: ScrollController(
                keepScrollOffset: true, initialScrollOffset: 0),
            physics: const BouncingScrollPhysics(),
            child: AdaptiveColumn(children: [
              AdaptiveContainer(
                columnSpan: 12,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Cálculos contables:",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF2a195d),
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                          child: ItemsCalculosContables()),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xFF2a195d),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(
                          "Gastos:",
                          style: GoogleFonts.inter(
                            color: const Color(0xFF2a195d),
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                          ),
                        ),
                      ),
                      TarjetaSaldoMensual(
                        opcion: 'Saldo:',
                        total:
                            '\$${NumberFormat("#,###.##", "en_US").format(saldoUsuario < 0 ? saldoUsuario * -1 : saldoUsuario)}',
                        colorTotal: saldoUsuario < 0
                            ? const Color.fromARGB(255, 255, 16, 44)
                            : Theme.of(context).scaffoldBackgroundColor,
                      ),
                      ListTile(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FinanzasScreen())),
                        title: Text(
                          'Agregar gasto o ingreso',
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
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 10.0),
                        child: CategoriasYCantidades(),
                      ),
                    ],
                  ),
                ),
              ),
            ])));
  }
}
