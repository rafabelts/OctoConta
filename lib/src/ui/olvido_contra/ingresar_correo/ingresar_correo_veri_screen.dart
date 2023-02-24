import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_recuperacion.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/olvido_contra/ingresar_correo/ingresar_correo_veri_inputs.dart';

class CorreoParaVerificar extends StatefulWidget {
  const CorreoParaVerificar({super.key});

  @override
  State<CorreoParaVerificar> createState() => _CorreoParaVerificarState();
}

class _CorreoParaVerificarState extends State<CorreoParaVerificar> {
  TextEditingController correo = TextEditingController();

  String mensajeDeErroremailUser = '';
  bool errorInEmailUser = false;
  mensajeErrorEmail(String mensajeError, bool error) {
    setState(() {
      errorInEmailUser = error;
      errorInEmailUser == false
          ? false
          : (mensajeDeErroremailUser = mensajeError);
    });
  }

  onChangedCorreo() => mensajeErrorEmail('', false);

  Future<void> enviarCorreo() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 153, 151, 158),
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ));
    try {
      await Auth().changePasswordEmail(
          context: context, email: correo.text.toLowerCase().trim());
      Future.microtask(() => showMensajeParaUsuario(
          context, true, 'Link para cambiar contrasena, revise su email!'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        Future.microtask(() => showMensajeParaUsuario(
            context, true, 'No cuenta con conexion a internet'));
      } else if (e.code == 'invalid-email') {
        mensajeErrorEmail('Correo invalido', true);
      } else if (e.code == 'user-not-found') {
        mensajeErrorEmail('Usuario no encontrado', true);
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

  void enviarCodigoPassword() {
    if (correo.text.isEmpty) {
      mensajeErrorEmail('Por favor ingrese su correo', true);
    } else {
      enviarCorreo();
    }
  }

  @override
  void initState() {
    super.initState();
    correo;
  }

  @override
  void dispose() {
    super.dispose();
    correo.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, size: 25),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.1),
        child: AdaptiveColumn(
          children: <AdaptiveContainer>[
            AdaptiveContainer(
                columnSpan: 12,
                child: Column(
                  children: <Widget>[
                    CorreoParaVerificarInput(
                      correoUser: correo,
                      onChangedCorreoUser: (value) => onChangedCorreo(),
                      errorInCorreoUser: errorInEmailUser == false
                          ? null
                          : mensajeDeErroremailUser,
                    ),
                    BotonesParaRecuperacion(
                      enviarCodigo: () => enviarCodigoPassword(),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
