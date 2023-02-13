import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/calculos/honorarios/definicion_honorarios.dart';
import 'package:octoconta_final/src/ui/calculos/isr/definicion_isr.dart';
import 'package:octoconta_final/src/ui/calculos/iva/definicion_iva.dart';
import 'package:octoconta_final/src/ui/calculos/prestamo/prestamo_screen.dart';
import 'package:octoconta_final/src/ui/calculos/primav/definicion_primav.dart';
import 'package:octoconta_final/src/ui/calculos/tarjeta/tarjeta_screen.dart';
import 'package:octoconta_final/src/ui/screen_seleccionada/screens_appbar.dart';
import '../calculos/honorarios/honorarios_screen.dart';
import '../calculos/isr/isr_screen.dart';
import '../calculos/iva/iva_screen.dart';
import '../calculos/prestamo/definicion_prestamo.dart';
import '../calculos/primav/primav_screen.dart';
import '../calculos/tarjeta/definicion_tarjeta.dart';

class SelectedScreen extends StatefulWidget {
  final int indexClicked;
  const SelectedScreen({required this.indexClicked, super.key});

  @override
  State<SelectedScreen> createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {
  late int indexClicked = widget.indexClicked;

  final pages = <Widget>[
    const CalculoTarjetaScreen(),
    const CalculoPrestamoScreen(),
    const CalculoHonorariosScreen(),
    const CalculoPrimaVacacionalScreen(),
    const CalculoISRScreen(),
    const CalculoIVAScreen(),
  ];

  info() {
    FocusScope.of(context).unfocus();
    showDialog(
        useSafeArea: true,
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
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      insetPadding: const EdgeInsets.all(8.0),
                      content: indexClicked == 0
                          ? const DescripcionTarjeta()
                          : indexClicked == 1
                              ? const DescripcionPrestamo()
                              : indexClicked == 2
                                  ? const DescripcionHonorarios()
                                  : indexClicked == 3
                                      ? const DescripcionPrimaVacacional()
                                      : indexClicked == 4
                                          ? SizedBox(
                                              width: double.infinity,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.85,
                                              child: const DescripcionISR())
                                          : const DescripcionIVA(),
                    ),
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreensAppBar(
        titulo: indexClicked == 0
            ? 'Pago de Tarjeta'
            : indexClicked == 1
                ? 'Pago de Prestamo'
                : indexClicked == 2
                    ? 'Honorarios'
                    : indexClicked == 3
                        ? 'Prima Vacacional'
                        : indexClicked == 4
                            ? 'Calculo de ISR'
                            : 'Calculo de IVA',
        leadingIcon: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                final FocusScopeNode currentScope = FocusScope.of(context);
                if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  FocusScope.of(context).unfocus();
                }
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.sort),
              iconSize: 40,
            );
          },
        ),
        icono: Icons.info_outline,
        onPressed: info,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
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
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              // Text('Hola Rafael!',
              //     style: GoogleFonts.inter(
              //         color: const Color(0xff2E2B52),
              //         fontSize: 60,
              //         fontWeight: FontWeight.w600)),

              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Calcular:',
                  style: GoogleFonts.poppins(
                      color: const Color(0xff2E2B52),
                      fontSize: 50,
                      fontWeight: FontWeight.w600),
                ),
              ),
              ListTile(
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
                  'Pago de una tarjeta de credito',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff4527A0), //382872 //453a88
                    //382872 //453a88
                    fontSize: 20,
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
                      indexClicked = 1;
                    });
                  },
                  splashColor: const Color.fromARGB(32, 115, 79, 223),
                  tileColor: indexClicked == 1
                      ? const Color.fromARGB(19, 115, 79, 223)
                      : Colors.transparent,
                  title: Text(
                    'Pago de un prestamo',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff4527A0), //382872 //453a88
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
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
                  'Honorarios',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff4527A0), //382872 //453a88
                    fontSize: 20,
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
                      indexClicked = 3;
                    });
                  },
                  splashColor: const Color.fromARGB(32, 115, 79, 223),
                  tileColor: indexClicked == 3
                      ? const Color.fromARGB(19, 115, 79, 223)
                      : Colors.transparent,
                  title: Text(
                    'Prima Vacacional',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff4527A0), //382872 //453a88
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              ListTile(
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
                  'Impuesto Sobre Renta (ISR)',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff4527A0), //382872 //453a88
                    fontSize: 20,
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
                      indexClicked = 5;
                    });
                  },
                  splashColor: const Color.fromARGB(32, 115, 79, 223),
                  tileColor: indexClicked == 5
                      ? const Color.fromARGB(19, 115, 79, 223)
                      : Colors.transparent,
                  title: Text(
                    'Impuesto al Valor Agregado (IVA)',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff4527A0), //382872 //453a88
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18),
                child: ListTile(
                  title: Text(
                    'Regresar',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff2E2B52), //382872 //453a88
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
