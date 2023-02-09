import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/modal_selecciones.dart';
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
          leadingIcon: null,
          icono: Icons.settings_outlined,
          onPressed: goToSettings,
        ),
        body: SingleChildScrollView(
            child: AdaptiveColumn(children: [
          AdaptiveContainer(
              columnSpan: 12,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                          color: const Color(0xFF5E35B1),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xFF2a195d),
                        ),
                      ),
                      Text(
                        "Categorías de gastos:",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF2a195d),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 10.0),
                        child: BotonCategorias(),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Divider(
                          thickness: 0.5,
                          color: Color(0xFF2a195d),
                        ),
                      ),
                      Text(
                        "Cálculos contables:",
                        style: GoogleFonts.inter(
                          color: const Color(0xFF2a195d),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30.0),
                          child: Align(
                              child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.06,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF5E35B1),
                                shadowColor: const Color(0xff4527A0),
                                elevation: 15,
                              ),
                              onPressed: () => modalBottomSeleciones(
                                  context, const ItemsCalculosContables()),
                              child: Text(
                                "Ir a los disponibles",
                                style: GoogleFonts.inter(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                          ))),
                    ],
                  ),
                ),
              ))
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