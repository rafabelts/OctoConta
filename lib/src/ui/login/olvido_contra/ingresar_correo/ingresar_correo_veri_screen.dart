import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_recuperacion.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/login/olvido_contra/ingresar_correo/ingresar_correo_veri_inputs.dart';

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
      Future.microtask(() => showMensajeParaUsuario(context, true,
          'Se ha enviado el link para cambiar su contraseña. Por favor, revise su email!'));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        showMensajeParaUsuario(context, true,
            'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.');
      } else if (e.code == 'user-not-found') {
        // El usuario no existe
        mensajeErrorEmail(
            '''Error: la cuenta de usuario no se ha encontrado. Por favor, compruebe su dirección de correo electrónico e intente de nuevo.''',
            false);
      } else if (e.code == 'invalid-email') {
        // La dirección de correo electrónico es inválida
        mensajeErrorEmail(
            '''Error: correo electrónico inválido. Por favor, ingrese un correo electrónico válido.''',
            false);
      } else if (e.code == 'too-many-requests') {
        Future.microtask(() => showMensajeParaUsuario(context, true,
            'Lo sentimos, has excedido el límite de solicitudes permitidas. Por favor, inténtalo de nuevo más tarde.'));
      } else {
        Future.microtask(() => showMensajeParaUsuario(context, true,
            'Error desconocido. Por favor, intente de nuevo más tarde.'));
      }
    } finally {
      FocusScope.of(context).unfocus();
      Navigator.pop(context);
    }
  }

  void enviarCodigoPassword() {
    if (correo.text.isEmpty) {
      mensajeErrorEmail('Por favor, ingrese su correo electrónico.', true);
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
            vertical: MediaQuery.of(context).size.height * 0.02),
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
                      onSubmittedCorreo: enviarCodigoPassword,
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
