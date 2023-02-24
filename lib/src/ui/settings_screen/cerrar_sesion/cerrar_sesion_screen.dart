import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/settings_screen/cerrar_sesion/cerrar_sesion_buttons.dart';

class CerrarSesionScreen extends StatelessWidget {
  const CerrarSesionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '¿Desea cerrar sesión?',
          style: GoogleFonts.inter(
            color: const Color(0xff382A62),
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: CerrarSesionButtons(eliminarCuenta: () {
              try {
                Auth().signOut(
                    context: context,
                    navegacionPantallasAlCerrarSesion: (value) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    });
              } on FirebaseAuthException catch (e) {
                if (e.code == 'network-request-failed') {
                  Future.microtask(() => showMensajeParaUsuario(
                      context, true, 'No cuenta con conexion a internet'));
                }
              } finally {
                Navigator.pop(context);
              }
            })),
      ],
    );
  }
}
