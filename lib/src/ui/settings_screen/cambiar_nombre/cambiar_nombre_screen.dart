import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_cambiar_settings.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_nombre/cambiar_nombre_inputs.dart';

import '../../../models/mensaje_cuentas.dart';

class CambiarNombreScreen extends StatefulWidget {
  const CambiarNombreScreen({super.key});

  @override
  State<CambiarNombreScreen> createState() => _CambiarNombreScreenState();
}

class _CambiarNombreScreenState extends State<CambiarNombreScreen> {
  TextEditingController nombreUser = TextEditingController();

  String mensajeDeErrorNombre = '';
  bool errorInNombre = false;
  mensajeErrorNombre(String mensajeError, bool error) {
    setState(() {
      errorInNombre = error;
      errorInNombre == false ? false : (mensajeDeErrorNombre = mensajeError);
    });
  }

  void onChangedNombreUser() => mensajeErrorNombre("", false);

  @override
  void initState() {
    super.initState();
    nombreUser;
  }

  @override
  void dispose() {
    super.dispose();
    nombreUser.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Auth().currentUser;
    final String? userName = Auth().currentUser?.displayName;

    Future<void> cambioNombre() async {
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: const Color.fromARGB(255, 153, 151, 158),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ));
      try {
        await user?.updateDisplayName(nombreUser.text).then((value) {
          showMensajeParaUsuario(context, true, 'Nombre actualizado.');
          Navigator.pop(context);
          // FocusScope.of(context).unfocus();
          Navigator.pop(context);
        });
        await user?.reload();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.'));
        } else if (e.code == 'too-many-requests') {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Lo sentimos, has excedido el límite de solicitudes permitidas. Por favor, inténtalo de nuevo más tarde.'));
        } else {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Error desconocido. Por favor, inténtalo de nuevo más tarde'));
        }
      } finally {
        Navigator.pop(context);
      }
    }

    void cambiarNombre() {
      if (nombreUser.text.isEmpty) {
        mensajeErrorNombre('Por favor, ingrese su nombre.', true);
      } else if (userName == nombreUser.text) {
        mensajeErrorNombre(
            '''Por favor, ingrese un nombre diferente al actual.''', true);
      } else {
        FocusScope.of(context).unfocus();
        cambioNombre();
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: AdaptiveColumn(
            children: <AdaptiveContainer>[
              AdaptiveContainer(
                columnSpan: 12,
                child: Column(
                  children: <Widget>[
                    CambiarNombreInput(
                      nombreUser: nombreUser,
                      onChangedNombreUser: (value) => onChangedNombreUser(),
                      errorNombreUser:
                          errorInNombre == false ? null : mensajeDeErrorNombre,
                      onCompleteNombre: cambiarNombre,
                    ),
                    CambiarSettingsButtons(
                        cambio: 'nombre', cambiar: () => cambiarNombre())
                  ],
                ),
              )
            ],
          )),
    );
  }
}
