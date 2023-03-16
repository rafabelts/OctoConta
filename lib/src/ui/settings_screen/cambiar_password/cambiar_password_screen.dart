import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/buttons_cambiar_settings.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
import 'package:octoconta_final/src/services/auth.dart';
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

    Future<void> realizarCambioPassword() async {
      try {
        await user?.updatePassword(userNewPassword.text).then((value) {
          showMensajeParaUsuario(context, true, 'Contraseña actualizada.');
        });
        await Future.microtask(() {
          Auth().signOut(
              context: context,
              navegacionPantallasAlCerrarSesion: (value) {
                Navigator.pop(context);
                Navigator.pop(context);
              });
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.'));
        } else if (e.code == 'too-many-requests') {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Lo sentimos, has excedido el límite de solicitudes permitidas. Por favor, inténtalo de nuevo más tarde.'));
        } else {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Error desconocido. Por favor, intente de nuevo más tarde.'));
        }
      } finally {
        Navigator.pop(context);
      }
    }

    Future<void> verificarPassword() async {
      String passwordPattern =
          r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
      RegExp regExpPassword = RegExp(passwordPattern);
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: const Color.fromARGB(255, 153, 151, 158),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              ));
      try {
        await user
            ?.reauthenticateWithCredential(credentials)
            .then((value) => Navigator.pop(context));
        if (userNewPassword.text.isEmpty) {
          mensajeErrorNewPassword(
              'Por favor, ingrese su nueva contraseña.', true);
        } else if (conffirmedNewPassword.text.isEmpty) {
          mensajeErrorConffirmedNewPassword(
              '''Por favor, ingrese su nueva contraseña de nuevo para confirmar.''',
              true);
        } else if (userNewPassword.text.length < 8) {
          mensajeErrorNewPassword('Se necesitan al menos 8 caracteres', true);
        } else if (!regExpPassword.hasMatch(userNewPassword.text)) {
          mensajeErrorNewPassword(
              '''La contraseña debe tener al entre 8 y 16 caracteres, al menos un valor especial, un numero, una minúscula y una mayúscula.''',
              true);
        } else if (userPassword.text == userNewPassword.text) {
          mensajeErrorNewPassword(
              '''Por favor, ingrese una contraseña diferente a la actual.''',
              true);
        } else if (userNewPassword.text != conffirmedNewPassword.text) {
          mensajeErrorNewPassword('Error: Las contraseñas no coinciden.', true);
          mensajeErrorConffirmedNewPassword(
              'Error: Las contraseñas no coinciden.', true);
        } else {
          await realizarCambioPassword();
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {
          showMensajeParaUsuario(context, true,
              'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.');
        } else if (e.code == 'wrong-password') {
          Navigator.pop(context); // Cerrar diálogo
          mensajeErrorPassword(
              '''Error: contraseña incorrecta. Por favor ingrese su contraseña correctamente.''',
              true);
        } else if (e.code == 'too-many-requests') {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Lo sentimos, has excedido el límite de solicitudes permitidas. Por favor, inténtalo de nuevo más tarde.'));
        } else {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Error desconocido. Por favor, intente de nuevo más tarde.'));
        }
      }
    }

    onSubmittedPassword() async {
      if (userPassword.text.isEmpty) {
        mensajeErrorPassword("Por favor, ingrese su contraseña.", true);
      } else {
        FocusScope.of(context).nextFocus();
        FocusScope.of(context).nextFocus();
      }
    }

    void onSubmittedNewPassword() {
      String passwordPattern =
          r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
      RegExp regExpPassword = RegExp(passwordPattern);
      if (userNewPassword.text.isEmpty) {
        mensajeErrorNewPassword(
            'Por favor, ingrese su nueva contraseña.', true);
      } else if (userNewPassword.text.length < 8) {
        mensajeErrorNewPassword('Se necesitan al menos 8 caracteres', true);
      } else if (!regExpPassword.hasMatch(userNewPassword.text)) {
        mensajeErrorNewPassword(
            '''La contraseña debe tener al entre 8 y 16 caracteres, al menos un valor especial, un numero, una minúscula y una mayúscula.''',
            true);
      } else if (userPassword.text == userNewPassword.text) {
        mensajeErrorNewPassword(
            '''Por favor, ingrese una contraseña diferente a la actual.''',
            true);
      } else {
        FocusScope.of(context).nextFocus();
        FocusScope.of(context).nextFocus();
      }
    }

    void onSubmittedConffirmedNewPassword() {
      if (conffirmedNewPassword.text.isEmpty) {
        mensajeErrorConffirmedNewPassword(
            '''Por favor, ingrese su nueva contraseña de nuevo  para confirmar.''',
            true);
      } else if (userNewPassword.text != conffirmedNewPassword.text) {
        mensajeErrorNewPassword('Error: Las contraseñas no coinciden.', true);
        mensajeErrorConffirmedNewPassword(
            'Error: Las contraseñas no coinciden.', true);
      } else {
        userPassword.text.isEmpty
            ? mensajeErrorPassword("Por favor, ingrese su contraseña.", true)
            : verificarPassword();
      }
    }

    void cambiarPassword() {
      // aracely y rafael
      userPassword.text.isEmpty
          ? mensajeErrorPassword("Por favor, ingrese su contraseña.", true)
          : verificarPassword();
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
                      onSubmmitedPassword: onSubmittedPassword,
                      newPasswordUser: userNewPassword,
                      onChangedNewPassword: (value) => onChangedNewPassword(),
                      newPasswordError: errorInNewPasswordUser == false
                          ? null
                          : mensajeDeErrorNewPassword,
                      onSubmittedNewPassword: onSubmittedNewPassword,
                      conffirmedNewPasswordUser: conffirmedNewPassword,
                      onChangedNewConffirmedPassword: (value) =>
                          onChangedConffirmedNewPassword(),
                      conffirmedNewPasswordError:
                          errorInConffirmedNewPasswordUser == false
                              ? null
                              : mensajeDeErrorConffirmedNewPassword,
                      onSubmittedNewConffirmedPassword:
                          onSubmittedConffirmedNewPassword,
                    ),
                    CambiarSettingsButtons(
                        cambio: 'contraseña', cambiar: () => cambiarPassword())
                  ],
                ),
              )
            ],
          )),
    );
  }
}
