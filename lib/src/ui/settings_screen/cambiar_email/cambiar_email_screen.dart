import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/error_conexion.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_email/cambiar_email_buttons.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_email/cambiar_email_inputs.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_email/contra_para_cambio_email/contra_email_screen.dart';

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
  mensajeErrorConffirmedEmailUser(String mensajeError, bool error) {
    setState(() {
      errorInEmailUser = error;
      errorInEmailUser == false
          ? false
          : (mensajeDeErroremailUser = mensajeError);
    });
  }

  bool correoValido = false;

  TextEditingController password = TextEditingController();

  String mensajeDeErrorPassword = '';
  bool errorInPassword = false;
  mensajeErrorPassword(String mensajeError, bool error) {
    setState(() {
      errorInEmailUser = error;
      errorInEmailUser == false
          ? false
          : (mensajeDeErrorPassword = mensajeError);
    });
  }

  void onChangedEmailUser() => mensajeErrorConffirmedEmailUser("", false);
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

    Future<void> verificarPassword() async {
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
        // await realizarCambioPassword();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          Navigator.pop(context); // Cerrar diálogo
          mensajeErrorPassword('La contraseña es incorrecta.', true);
        }
      }
    }

    void cambiarCorreo() {
      String emailPattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExpEmail = RegExp(emailPattern);
      if (correoUser.text.isEmpty) {
        mensajeErrorConffirmedEmailUser("Por favor ingrese un correo.", true);
      } else if (!regExpEmail.hasMatch(correoUser.text.toLowerCase().trim())) {
        mensajeErrorConffirmedEmailUser("Correo invalido", true);
      } else if (userCorreo == correoUser.text.toLowerCase().trim()) {
        mensajeErrorConffirmedEmailUser(
            "Ingrese un correo diferente al actual", true);
      } else {
        setState(() {
          correoValido = true;
        });
      }
    }

    void comprobarPassord() {
      if (password.text.isEmpty) {
        mensajeErrorPassword('Por favor ingrese su contrasena', true);
      } else {
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
                          content: ContraCambiarCorreoScreen(
                              password: password,
                              onChangedPassword: (value) => onChangedPassword(),
                              errorPassword: errorInPassword == false
                                  ? null
                                  : mensajeDeErrorPassword,
                              cambiar: () => verificarPassword()),
                        ),
                      )
                    ],
                  ),
                ));
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
                    ),
                    CambiarEmailButtons(cambiarEmail: () {
                      cambiarCorreo();
                    })
                  ],
                ),
              )
            ],
          )),
    );
  }
}
