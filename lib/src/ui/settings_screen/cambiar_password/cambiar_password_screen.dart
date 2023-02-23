import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/error_conexion.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_password/cambiar_password_buttons.dart';
import 'package:octoconta_final/src/ui/settings_screen/cambiar_password/cambiar_password_inputs.dart';

class CambiarPasswordScreen extends StatefulWidget {
  const CambiarPasswordScreen({super.key});

  @override
  State<CambiarPasswordScreen> createState() => _CambiarPasswordScreenState();
}

class _CambiarPasswordScreenState extends State<CambiarPasswordScreen> {
  TextEditingController userPassword = TextEditingController();
  TextEditingController userNewPassword = TextEditingController();
  TextEditingController conffirmedNewPassword = TextEditingController();

  String mensajeDeErrorPassword = '';
  bool errorInPasswordUser = false;
  mensajeErrorPassword(String mensajeError, bool error) {
    setState(() {
      errorInPasswordUser = error;
      errorInPasswordUser == false
          ? false
          : (mensajeDeErrorPassword = mensajeError);
    });
  }

  String mensajeDeErrorNewPassword = '';
  bool errorInNewPasswordUser = false;
  mensajeErrorNewPassword(String mensajeError, bool error) {
    setState(() {
      errorInNewPasswordUser = error;
      errorInNewPasswordUser == false
          ? false
          : (mensajeDeErrorNewPassword = mensajeError);
    });
  }

  String mensajeDeErrorConffirmedNewPassword = '';
  bool errorInConffirmedNewPasswordUser = false;
  mensajeErrorConffirmedNewPassword(String mensajeError, bool error) {
    setState(() {
      errorInConffirmedNewPasswordUser = error;
      errorInConffirmedNewPasswordUser == false
          ? false
          : (mensajeDeErrorConffirmedNewPassword = mensajeError);
    });
  }

  onChangedPassword() => mensajeErrorPassword('', false);
  onChangedNewPassword() => mensajeErrorNewPassword('', false);
  onChangedConffirmedNewPassword() =>
      mensajeErrorConffirmedNewPassword('', false);

  @override
  void initState() {
    super.initState();
    userPassword;
    userNewPassword;
    conffirmedNewPassword;
  }

  @override
  void dispose() {
    super.dispose();
    userPassword.dispose();
    userNewPassword.dispose();
    conffirmedNewPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Auth().currentUser;
    final String? correoUser = Auth().currentUser?.email;

    final AuthCredential credentials = EmailAuthProvider.credential(
        email: correoUser!, password: userPassword.text);

    Future<void> verificarPassword() async {
      try {
        showDialog(
            context: context,
            builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 153, 151, 158),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ));
        await user
            ?.reauthenticateWithCredential(credentials)
            .then((value) => Navigator.pop(context));

        String passwordPattern =
            r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
        RegExp regExpPassword = RegExp(passwordPattern);

        if (userNewPassword.text.length < 8) {
          mensajeErrorNewPassword('Se necesitan al menos 8 caracteres', false);
          if (conffirmedNewPassword.text.length < 8) {
            mensajeErrorConffirmedNewPassword(
                'Se necesitan al menos 8 caracteres', false);
          }
        } else if (userNewPassword.text != conffirmedNewPassword.text) {
          mensajeErrorNewPassword('Las contraseñas no coinciden', false);
          mensajeErrorConffirmedNewPassword(
              'Las contraseñas no coinciden', false);
        } else if (!regExpPassword.hasMatch(userNewPassword.text)) {
          mensajeErrorPassword(
              '''La contraseña debe tener al entre 8 y 16 caracteres,
al menos un valor especial, un numero, una 
minúscula y una mayúscula.''', false);
          if (!regExpPassword.hasMatch(conffirmedNewPassword.text)) {
            mensajeErrorConffirmedNewPassword(
                '''La contraseña debe tener al entre 8 y 16 caracteres,
al menos un valor especial, un numero, una 
minúscula y una mayúscula.''', false);
          } else {
            try {
              Future.microtask(() => showDialog(
                  context: context,
                  builder: (context) => Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 153, 151, 158),
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                        ),
                      )));
              await user!.updatePassword(userNewPassword.text).then((value) {
                // Navigator.pop(context);
                print("cambio");
                showErrorMessageConexion(
                    context, true, 'Contraseña actualizada.');
              });
            } catch (e) {
              if (e == 'network-request-failed') {
                Future.microtask(() => showErrorMessageConexion(
                    context, true, 'No cuenta con conexion a internet'));
              }
            }
          }
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          Navigator.pop(context); // Cerrar diálogo
          mensajeErrorPassword('La contraseña es incorrecta.', true);
        }
      }
    }

    void cambiarPassword() {
      // aracely y rafael
      if (userPassword.text.isEmpty) {
        mensajeErrorPassword("Por favor ingrese su contraseña.", true);
      } else {
        verificarPassword();
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
                    CambiarPasswordInput(
                      passwordUser: userPassword,
                      onChangedPassword: (value) => onChangedPassword(),
                      passwordError: errorInPasswordUser == false
                          ? null
                          : mensajeDeErrorPassword,
                      newPasswordUser: userNewPassword,
                      onChangedNewPassword: (value) => onChangedNewPassword(),
                      newPasswordError: errorInNewPasswordUser == false
                          ? null
                          : mensajeDeErrorNewPassword,
                      conffirmedNewPasswordUser: conffirmedNewPassword,
                      onChangedNewConffirmedPassword: (value) =>
                          onChangedConffirmedNewPassword(),
                      conffirmedNewPasswordError:
                          errorInConffirmedNewPasswordUser == false
                              ? null
                              : mensajeDeErrorConffirmedNewPassword,
                    ),
                    CambiarPasswordButtons(
                        cambiarPassword: () => cambiarPassword())
                  ],
                ),
              )
            ],
          )),
    );
  }
}
