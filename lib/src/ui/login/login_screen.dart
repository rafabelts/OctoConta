import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/error_conexion.dart';
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
          email: correo.text.toLowerCase().trim(), password: password.text);
      Future.microtask(() {
        Navigator.pop(context);
        Navigator.pop(context);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        showErrorMessageConexion(
            context, true, 'No cuenta con conexion a internet');
      } else if (e.code == 'user-not-found') {
        // El usuario no existe
        mensajeErrorCorreo('''La dirección de correo electrónico 
ingresada no es válida.''', false);
      } else if (e.code == 'wrong-password') {
        // La contraseña es incorrecta
        mensajeErrorPassword('La contraseña ingresada es incorrecta.', false);
      } else if (e.code == 'invalid-email') {
        // La dirección de correo electrónico es inválida
        mensajeErrorCorreo('''La dirección de correo electrónico 
ingresada no es válida.''', false);
      }
      // Puedes mostrar un mensaje de error al usuario o realizar otra acción según el error específico
    }
  }

  void registrarse() {
    String correoValor = correo.text.trim();
    String passwordValor = password.text;

    if (correoValor.isEmpty) {
      mensajeErrorCorreo('Por favor, ingrese su correo electronico', false);
    }

    if (passwordValor.isEmpty) {
      mensajeErrorPassword('Por favor, ingrese su contraseña', false);
    } else {
      if (correoValor.isEmpty) {
        mensajeErrorCorreo('Por favor, ingrese su correo electronico', false);
      } else {
        mensajeErrorCorreo('', true);
        mensajeErrorPassword('', true);
        signInWithEmailAndPassword();
      }
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
                        passwordUser: password,
                        passwordError:
                            errorInPassword ? null : mensajeDeErrorPassword,
                        onChangedPassword: (value) => onChangedPassword(),
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
