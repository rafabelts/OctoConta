import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/bitacora_gastos/bitacora_gastos_screen.dart';
import 'package:octoconta_final/src/ui/calculos/honorarios/definicion_honorarios.dart';
import 'package:octoconta_final/src/ui/calculos/honorarios/honorarios_screen.dart';
import 'package:octoconta_final/src/ui/calculos/isr/definicion_isr.dart';
import 'package:octoconta_final/src/ui/calculos/isr/isr_screen.dart';
import 'package:octoconta_final/src/ui/calculos/iva/definicion_iva.dart';
import 'package:octoconta_final/src/ui/calculos/iva/iva_screen.dart';
import 'package:octoconta_final/src/ui/calculos/prestamo/prestamo_screen.dart';
import 'package:octoconta_final/src/ui/calculos/primav/definicion_primav.dart';
import 'package:octoconta_final/src/ui/calculos/primav/primav_screen.dart';
import 'package:octoconta_final/src/ui/calculos/tarjeta/tarjeta_screen.dart';
import 'package:octoconta_final/src/ui/screen_seleccionada/screens_appbar.dart';
import 'package:octoconta_final/src/ui/settings_screen/settings_screen.dart';

import '../calculos/prestamo/definicion_prestamo.dart';
import '../calculos/tarjeta/definicion_tarjeta.dart';

class SelectedScreen extends StatefulWidget {
  const SelectedScreen({super.key});

  @override
  State<SelectedScreen> createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {
  int indexClicked = 0;

  final pages = <Widget>[
    const BitacoraGastosScreen(),
    const CalculoTarjetaScreen(),
    const CalculoPrestamoScreen(),
    const CalculoHonorariosScreen(),
    const CalculoPrimaVacacionalScreen(),
    const CalculoISRScreen(),
    const CalculoIVAScreen(),
  ];

  goToSettings() => Navigator.push(
      context, MaterialPageRoute(builder: (context) => const SettingsScreen()));

  info() {
    FocusScope.of(context).unfocus();
    showDialog(
      context: context,
      builder: (BuildContext context) => Center(
        child: AdaptiveColumn(
          children: [
            AdaptiveContainer(
              columnSpan: 4,
              child: AlertDialog(
                scrollable: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                insetPadding: const EdgeInsets.all(0.2),
                content: indexClicked == 1
                    ? const DescripcionTarjeta()
                    : indexClicked == 2
                        ? const DescripcionPrestamo()
                        : indexClicked == 3
                            ? const DescripcionHonorarios()
                            : indexClicked == 4
                                ? const DescripcionPrimaVacacional()
                                : indexClicked == 5
                                    ? const DescripcionISR()
                                    : const DescripcionIVA(),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(
        titulo: indexClicked == 0
            ? 'Gastos'
            : indexClicked == 1
                ? 'Pago de Tarjeta'
                : indexClicked == 2
                    ? 'Pago de Prestamo'
                    : indexClicked == 3
                        ? 'Honorarios'
                        : indexClicked == 4
                            ? 'Prima Vacacional'
                            : indexClicked == 5
                                ? 'Calculo de ISR'
                                : 'Calculo de IVA',
        icono: indexClicked == 0 ? Icons.settings_outlined : Icons.info_outline,
        onPressed: indexClicked == 0 ? goToSettings : info,
      ),
      body: SingleChildScrollView(
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
              columnSpan: 12,
              child: pages[indexClicked],
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: <Widget>[
              Text('Hola Rafael!',
                  style: GoogleFonts.inter(
                      color: const Color(0xff2E2B52),
                      fontSize: 60,
                      fontWeight: FontWeight.w600)),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  '¿Qué deseas realizar?',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff2E2B52),
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      indexClicked = 0;
                    });
                  },
                  splashColor: const Color.fromARGB(32, 115, 79, 223),
                  tileColor: indexClicked == 0
                      ? const Color.fromARGB(32, 115, 79, 223)
                      : Colors.transparent,
                  title: Text(
                    'Revision de Gastos',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff4527A0), //382872 //453a88
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Color(0xff2E2B52),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Calcular:',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff2E2B52),
                      fontSize: 22,
                      fontWeight: FontWeight.w600),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    indexClicked = 1;
                  });
                },
                splashColor: const Color.fromARGB(32, 115, 79, 223),
                tileColor: indexClicked == 1
                    ? const Color.fromARGB(32, 115, 79, 223)
                    : Colors.transparent,
                title: Text(
                  'Pago de una tarjeta de credito',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff4527A0), //382872 //453a88
                    //382872 //453a88
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      indexClicked = 2;
                    });
                  },
                  splashColor: const Color.fromARGB(32, 115, 79, 223),
                  tileColor: indexClicked == 2
                      ? const Color.fromARGB(19, 115, 79, 223)
                      : Colors.transparent,
                  title: Text(
                    'Pago de un prestamo',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff4527A0), //382872 //453a88
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    indexClicked = 3;
                  });
                },
                splashColor: const Color.fromARGB(32, 115, 79, 223),
                tileColor: indexClicked == 3
                    ? const Color.fromARGB(19, 115, 79, 223)
                    : Colors.transparent,
                title: Text(
                  'Honorarios',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff4527A0), //382872 //453a88
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      indexClicked = 4;
                    });
                  },
                  splashColor: const Color.fromARGB(32, 115, 79, 223),
                  tileColor: indexClicked == 4
                      ? const Color.fromARGB(19, 115, 79, 223)
                      : Colors.transparent,
                  title: Text(
                    'Prima Vacacional',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff4527A0), //382872 //453a88
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    indexClicked = 5;
                  });
                },
                splashColor: const Color.fromARGB(32, 115, 79, 223),
                tileColor: indexClicked == 5
                    ? const Color.fromARGB(19, 115, 79, 223)
                    : Colors.transparent,
                title: Text(
                  'Impuesto Sobre Renta (ISR)',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff4527A0), //382872 //453a88
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      indexClicked = 6;
                    });
                  },
                  splashColor: const Color.fromARGB(32, 115, 79, 223),
                  tileColor: indexClicked == 6
                      ? const Color.fromARGB(19, 115, 79, 223)
                      : Colors.transparent,
                  title: Text(
                    'Impuesto al Valor Agregado (IVA)',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff4527A0), //382872 //453a88
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
