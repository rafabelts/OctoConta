import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/saldo_mensual/tarjeta.dart';
import 'package:octoconta_final/src/ui/pagina_principal/calculos_contables_items.dart';
import 'package:octoconta_final/src/ui/screen_seleccionada/screens_appbar.dart';
import '../bitacora_gastos/boton_categorias.dart';
import '../bitacora_gastos/saldo_mensual/edicionSaldo/saldo_ahorro_screen.dart';
import '../settings_screen/settings_screen.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    goToSettings() => Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SettingsScreen()));
    goToEditarSaldo() => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const EdicionSaldoYVerAhorro()));
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
                      // Text(
                      //   user.email!,
                      //   style: GoogleFonts.inter(
                      //     color: const Color(0xFF2a195d),
                      //     fontWeight: FontWeight.bold,
                      //     fontSize: 32,
                      //   ),
                      // ),
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
                      const TarjetaSaldoMensual(),
                      ListTile(
                        onTap: goToEditarSaldo,
                        title: Text(
                          'Editar saldo',
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
                      // const Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 20.0),
                      // ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 10.0),
                        child: BotonCategorias(),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}

//  ListTile(
//                 onTap: () => modalBottomSeleciones(
//                     context, const ItemsCalculosContables()),
//                 title: Text(
//                   "Ir a los disponibles",
//                   style: GoogleFonts.inter(
//                     color: const Color(0xFF5E35B1),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 26,
//                   ),
//                 ),
//                 trailing: const Icon(
//                   Icons.arrow_forward_ios,
//                   size: 20,
//                   color: const Color(0xFF5E35B1),
//                 ),
//               ),