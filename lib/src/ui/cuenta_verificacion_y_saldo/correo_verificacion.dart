import 'dart:async';

import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
import 'package:octoconta_final/src/ui/pagina_principal/pagina_principal.dart';

import '../../services/auth.dart';

class VerificacionCorreo extends StatefulWidget {
  const VerificacionCorreo({super.key});

  @override
  State<VerificacionCorreo> createState() => VerificacionCorreoState();
}

class VerificacionCorreoState extends State<VerificacionCorreo> {
  bool estaEmailVerificado = false;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    if (Auth().currentUser != null) {
      estaEmailVerificado = Auth().currentUser!.emailVerified;
      if (!estaEmailVerificado) {
        enviarCorreoVerificacion();
        timer = Timer.periodic(
          const Duration(seconds: 3),
          (_) => checarCorreoVerificacion(),
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  Future<void> checarCorreoVerificacion() async {
    await Auth().currentUser!.reload();
    setState(() {
      if (Auth().currentUser != null) {
        estaEmailVerificado = Auth().currentUser!.emailVerified;
      }
    });
    if (estaEmailVerificado) {
      timer?.cancel();
    }
  }

  Future<void> enviarCorreoVerificacion() async {
    final user = Auth().currentUser!;

    try {
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        Future.microtask(() => showMensajeParaUsuario(
            context, true, 'No cuenta con conexion a internet'));
      } else if (e.code == 'too-many-requests') {
        Future.microtask(() => showMensajeParaUsuario(context, true,
            'Lo sentimos, has excedido el límite de solicitudes permitidas. Por favor, inténtalo de nuevo más tarde'));
      } else {
        Future.microtask(() => showMensajeParaUsuario(context, true,
            'Error desconocido. Por favor, inténtalo de nuevo más tarde'));
      }
    } finally {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) => estaEmailVerificado
      ? const PaginaPrincipal()
      : verificacionScreen(context);

  Widget verificacionScreen(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10.0),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
              columnSpan: 12,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: Text(
                        'Verificación de correo.',
                        style: Theme.of(context).textTheme.displayMedium,
                        // textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Text(
                        'Encontrara un correo en su bandeja para verificar su usuario (en caso de que no aparezca verifique en su bandeja de spam).',
                        style: GoogleFonts.inter(
                          color: const Color(0xff382A62),
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          backgroundColor: const Color(0xff5E35B1),
                          elevation: 10,
                          shadowColor: const Color(0xff2A195D),
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                        ),
                        child: Text(
                          'Reenviar Correo',
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => Center(
                                    child: CircularProgressIndicator(
                                      color: const Color(0xff2A195D),
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ));
                          enviarCorreoVerificacion()
                              .then((value) => Navigator.pop(context));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextButton(
                        onPressed: () => Auth().signOut(
                            context: context,
                            navegacionPantallasAlCerrarSesion: (value) =>
                                Navigator.pop(context)),
                        child: Text(
                          'Cancelar',
                          style: GoogleFonts.poppins(
                            color: const Color(0xff4527A0),
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    ));
  }
}
