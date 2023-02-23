import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_nombre/cambiar_nombre_buttons.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_nombre/cambiar_nombre_inputs.dart';

import '../../../models/error_conexion.dart';

class CambiarNombreScreen extends StatefulWidget {
  const CambiarNombreScreen({super.key});

  @override
  State<CambiarNombreScreen> createState() => _CambiarNombreScreenState();
}

class _CambiarNombreScreenState extends State<CambiarNombreScreen> {
  final TextEditingController nombreUser = TextEditingController();

  String mensajeDeErrorNombre = '';
  bool errorInNombre = false;
  mensajeErrorNombre(String mensajeError, bool error) {
    setState(() {
      errorInNombre = error;
      errorInNombre == false ? false : (mensajeDeErrorNombre = mensajeError);
    });
  }

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
                  color: Color.fromARGB(255, 153, 151, 158),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ));
      try {
        await user?.updateDisplayName(nombreUser.text).then((value) {
          showErrorMessageConexion(context, true, 'Nombre actualizado.');
          Navigator.pop(context);
          Navigator.pop(context);
        });
        await user?.reload();
      } catch (e) {
        if (e == 'network-request-failed') {
          Future.microtask(() => showErrorMessageConexion(
              context, true, 'No cuenta con conexion a internet'));
        }
      } finally {
        Navigator.pop(context);
      }
    }

    void cambiarNombre() {
      if (nombreUser.text.isEmpty) {
        mensajeErrorNombre('Por favor ingrese un nuevo nombre', true);
      } else if (userName == nombreUser.text) {
        mensajeErrorNombre('''Ingrese un nombre diferente al dado con 
anterioridad.''', true);
      } else {
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
                      onChangedNombreUser: (p0) {},
                      errorNombreUser:
                          errorInNombre == false ? null : mensajeDeErrorNombre,
                    ),
                    CambiarNombreButtons(
                        cambiarnombreUser: () => cambiarNombre())
                  ],
                ),
              )
            ],
          )),
    );
  }
}
