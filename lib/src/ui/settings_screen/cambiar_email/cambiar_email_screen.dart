import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_cambiar_settings.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_email/cambiar_email_inputs.dart';
import 'package:octoconta_final/src/ui/signup/verificacion_correo/verificacion_de_correo.dart';

import '../../../services/auth.dart';

class CambiarEmailScreen extends StatefulWidget {
  const CambiarEmailScreen({super.key});

  @override
  State<CambiarEmailScreen> createState() => _CambiarEmailScreenState();
}

class _CambiarEmailScreenState extends State<CambiarEmailScreen> {
  TextEditingController correoUser = TextEditingController();

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

  TextEditingController password = TextEditingController();

  String mensajeDeErrorPassword = '';
  bool errorInPassword = false;
  mensajeErrorPassword(String mensajeError, bool error) {
    setState(() {
      errorInPassword = error;
      errorInPassword == false
          ? false
          : (mensajeDeErrorPassword = mensajeError);
    });
  }

  void onChangedEmailUser() => mensajeErrorEmail("", false);
  void onChangedPassword() => mensajeErrorPassword("", false);

  @override
  void initState() {
    super.initState();
    correoUser;
    password;
  }

  @override
  void dispose() {
    super.dispose();
    correoUser;
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Auth().currentUser;
    final String? userCorreo = Auth().currentUser?.email;

    final AuthCredential credentials = EmailAuthProvider.credential(
        email: userCorreo!, password: password.text);

    Future<void> cambioCorreo() async {
      try {
        await user
            ?.updateEmail(correoUser.text.toLowerCase().trim())
            .then((value) {
          Navigator.pop(context);
          showMensajeParaUsuario(context, true, 'Correo actualizado.');
        });
        Future.microtask(() {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const VerificacionDeCorreo()));
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {
          showMensajeParaUsuario(
              context, true, 'No cuenta con conexion a internet');
        } else if (e.code == 'invalid-email') {
          mensajeErrorEmail('Correo invalido', true);
        } else if (e.code == 'email-already-in-use') {
          mensajeErrorEmail('Correo en uso', true);
        } else {
          showMensajeParaUsuario(
              context, true, 'Error al cambiar correo, intente mas tarde');
        }
      }
    }

    Future<void> validarUser() async {
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 153, 151, 158),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ));

      try {
        await user
            ?.reauthenticateWithCredential(credentials)
            .then((value) => Navigator.pop(context));
        await cambioCorreo();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {
          showMensajeParaUsuario(
              context, true, 'No cuenta con conexion a internet');
        } else if (e.code == 'wrong-password') {
          mensajeErrorPassword('La contraseña es incorrecta.', true);
        }
      } finally {
        Navigator.pop(context);
      }
    }

    void cambiarCorreo() {
      String emailPattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExpEmail = RegExp(emailPattern);
      if (correoUser.text.isEmpty) {
        mensajeErrorEmail("Por favor ingrese un correo.", true);
      } else if (!regExpEmail.hasMatch(correoUser.text.toLowerCase().trim())) {
        mensajeErrorEmail('Correo Invalido', true);
      } else if (userCorreo == correoUser.text.toLowerCase().trim()) {
        mensajeErrorEmail('Ingrese un correo diferente al actual', true);
      } else if (password.text.isEmpty) {
        mensajeErrorPassword('Ingrese su contra', true);
      } else {
        validarUser();
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
                    CambiarEmailInput(
                      correoUser: correoUser,
                      onChangedCorreoUser: (value) => onChangedEmailUser(),
                      errorCorreoUser: errorInEmailUser == false
                          ? null
                          : mensajeDeErroremailUser,
                      passwordUser: password,
                      onChangedPassword: (value) => onChangedPassword(),
                      passwordUserError: errorInPassword == false
                          ? null
                          : mensajeDeErrorPassword,
                    ),
                    CambiarSettingsButtons(
                        cambio: 'correo', cambiar: () => cambiarCorreo())
                  ],
                ),
              )
            ],
          )),
    );
  }
}
