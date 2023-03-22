import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:octoconta_final/src/models/mensaje_scaffold.dart';
import 'package:octoconta_final/src/ui/pagina_principal/pagina_principal.dart';

import '../../models/pagina_principal/botones_settings.dart';
import '../../services/auth.dart';

class VerificacionCorreoScreen extends StatefulWidget {
  const VerificacionCorreoScreen({super.key});

  @override
  State<VerificacionCorreoScreen> createState() =>
      _VerificacionCorreoScreenState();
}

class _VerificacionCorreoScreenState extends State<VerificacionCorreoScreen> {
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

  Future<void> enviarCorreoVerificacion() async {
    final user = Auth().currentUser!;

    try {
      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        Future.microtask(() => MensajeScaffold(
                contexto: context,
                mensaje:
                    'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.')
            .mostrar());
      } else if (e.code == 'too-many-requests') {
        Future.microtask(() => MensajeScaffold(
                contexto: context,
                mensaje:
                    'Lo sentimos, has excedido el límite de solicitudes permitidas. Por favor, inténtalo de nuevo más tarde.')
            .mostrar());
      } else {
        Future.microtask(() => MensajeScaffold(
                contexto: context,
                mensaje:
                    'Error desconocido. Por favor, intente de nuevo más tarde.')
            .mostrar());
      }
    }
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

  @override
  Widget build(BuildContext context) => estaEmailVerificado
      ? const PaginaPrincipalScreen()
      : verificarCorreo(context);

  Widget verificarCorreo(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 10.h, bottom: 10.h, right: 15.w, left: 15.w),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60.h),
                    child: Text(
                      'Verificación de correo.',
                      maxLines: 4,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 35.h),
                    child: Text(
                      'Encontrara un correo en su bandeja para verificar su usuario (en caso de que no aparezca verifique en su bandeja de spam).',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Align(
                    child: BotonesSettings(
                      largo: 0.25,
                      largo1: 0.1,
                      accion: 'Reenviar correo',
                      cancelar: 'Cancelar',
                      calcular: () {
                        showDialog(
                            context: context,
                            builder: (context) => Center(
                                  child: CircularProgressIndicator(
                                    color: const Color.fromARGB(
                                        255, 153, 151, 158),
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                  ),
                                ));
                        enviarCorreoVerificacion()
                            .then((value) => Navigator.pop(context));
                      },
                      limpiar: () => Auth().cierreSesion(
                        context: context,
                        navegacionPantallasAlCerrarSesion: (_) =>
                            Navigator.pop(context),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
