import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/login/login_buttons.dart';
import 'package:octoconta_final/src/ui/login/login_inputs.dart';

// import 'package:octoconta_final/src/ui/pagina_principal/pagina_principal.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();

  String mensajeDeErrorCorreo = '';
  bool errorInCorreo = true;
  mensajeErrorCorreo(String mensajeError, bool error) {
    setState(() {
      errorInCorreo = error;
      errorInCorreo ? true : (mensajeDeErrorCorreo = mensajeError);
    });
  }

  String mensajeDeErrorPassword = '';
  bool errorInPassword = true;
  mensajeErrorPassword(String mensajeError, bool error) {
    setState(() {
      errorInPassword = error;
      errorInPassword ? true : (mensajeDeErrorPassword = mensajeError);
    });
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: correo.text.toLowerCase().trim(),
        password: password.text,
        context: context,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'network-request-failed') {
        showMensajeParaUsuario(context, true,
            'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.');
      } else if (e.code == 'user-not-found') {
        // El usuario no existe
        mensajeErrorCorreo('''Error: la cuenta de usuario no se ha encontrado. 
Por favor, compruebe su dirección de correo 
electrónico e intente de nuevo.''', false);
      } else if (e.code == 'wrong-password') {
        // La contraseña es incorrecta
        mensajeErrorPassword(
            '''Error: contraseña incorrecta. Por favor ingrese su 
contraseña correctamente.''', false);
      } else if (e.code == 'invalid-email') {
        // La dirección de correo electrónico es inválida
        mensajeErrorCorreo('''Error: correo electrónico inválido. Por favor, 
ingrese un correo electrónico válido.''', false);
      } else if (e.code == 'too-many-requests') {
        Future.microtask(() => showMensajeParaUsuario(context, true,
            'Lo sentimos, has excedido el límite de solicitudes permitidas. Por favor, inténtalo de nuevo más tarde.'));
      } else {
        Future.microtask(() => showMensajeParaUsuario(context, true,
            'Error desconocido. Por favor, intente de nuevo más tarde.'));
      }
    }
  }

  void registrarse() {
    String correoValor = correo.text.trim().toLowerCase();
    String passwordValor = password.text;

    if (correoValor.isEmpty) {
      mensajeErrorCorreo('Por favor, ingrese su correo electrónico.', false);
    }

    if (passwordValor.isEmpty) {
      mensajeErrorPassword('Por favor, ingrese su contraseña.', false);
    } else {
      if (correoValor.isEmpty) {
        mensajeErrorCorreo('Por favor, ingrese su correo electrónico.', false);
      } else {
        mensajeErrorCorreo('', true);
        mensajeErrorPassword('', true);
        FocusScope.of(context).unfocus();
        signInWithEmailAndPassword();
      }
    }
  }

  void onSubmittedCorreo() {
    if (correo.text.isEmpty) {
      mensajeErrorCorreo('Por favor, ingrese su correo electrónico.', false);
    } else {
      FocusScope.of(context).nextFocus();
    }
  }

  onChangedCorreo() => mensajeErrorCorreo('', true);

  onChangedPassword() => mensajeErrorPassword('', true);

  @override
  void initState() {
    super.initState();
    correo;
    password;
  }

  @override
  void dispose() {
    super.dispose();
    correo.dispose();
    password.dispose();
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
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(2.0),
            child: AdaptiveColumn(
              children: <AdaptiveContainer>[
                AdaptiveContainer(
                  columnSpan: 12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      LogInInputs(
                        correoUser: correo,
                        onChangedCorreo: (value) => onChangedCorreo(),
                        correoError:
                            errorInCorreo ? null : mensajeDeErrorCorreo,
                        onSubmittedCorreo: onSubmittedCorreo,
                        passwordUser: password,
                        passwordError:
                            errorInPassword ? null : mensajeDeErrorPassword,
                        onChangedPassword: (value) => onChangedPassword(),
                        onSubmittedPassword: registrarse,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      LogInButtons(
                        avanzar: () => registrarse(),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
