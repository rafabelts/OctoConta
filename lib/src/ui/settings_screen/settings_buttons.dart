import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/settings_screen/cerrar_sesion/cerrar_sesion_screen.dart';

import 'eliminar_cuenta.dart/eliminar_cuenta_screen.dart';

class SettingsButton extends StatelessWidget {
  SettingsButton({super.key});
  final user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                backgroundColor: const Color(0xff4527A0),
                padding: const EdgeInsets.symmetric(vertical: 9.0),
              ),
              child: Text(
                'Cerrar Sesión',
                style: GoogleFonts.inter(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 27),
              ),
              onPressed: () {
                showDialog(
                    useSafeArea: true,
                    context: context,
                    builder: (BuildContext context) => Center(
                          child: AdaptiveColumn(
                            children: [
                              AdaptiveContainer(
                                  columnSpan: 12,
                                  child: AlertDialog(
                                      insetPadding: EdgeInsets.zero,
                                      scrollable: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      // insetPadding: const EdgeInsets.all(8.0),
                                      content: const CerrarSesionScreen()))
                            ],
                          ),
                        ));
              }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: TextButton(
            onPressed: () {
              showDialog(
                  useSafeArea: true,
                  context: context,
                  builder: (BuildContext context) => Center(
                        child: AdaptiveColumn(
                          children: [
                            AdaptiveContainer(
                              columnSpan: 12,
                              child: AlertDialog(
                                  insetPadding: EdgeInsets.zero,
                                  scrollable: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  // insetPadding: const EdgeInsets.all(8.0),
                                  content: const EliminarCuentaScreen()),
                            )
                          ],
                        ),
                      ));
            },
            child: Text(
              'Eliminar Cuenta',
              style: GoogleFonts.poppins(
                color: const Color(0xff5e35b1),
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
