import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/categorias_y_cantidad.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/finanzas/finanzas_screen.dart';
import 'package:octoconta_final/src/ui/pagina_principal/calculos_contables_items.dart';
import 'package:octoconta_final/src/ui/screen_seleccionada/screens_appbar.dart';
import '../../models/tarjeta.dart';
import '../settings_screen/settings_screen.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    double saldoUsuario = 0;
    goToSettings() => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()));
    goToFinanzas() => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const FinanzasScreen()));
    return Scaffold(
        appBar: ScreensAppBar(
          titulo: '',
          leadingIcon: const Icon(null),
          icono: Icons.settings_outlined,
          onPressed: goToSettings,
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
                            ? Color.fromARGB(255, 255, 16, 44)
                            : Theme.of(context).scaffoldBackgroundColor,
                      ),
                      ListTile(
                        onTap: goToFinanzas,
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
