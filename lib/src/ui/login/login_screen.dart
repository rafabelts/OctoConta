import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/ui/login/login_buttons.dart';
import 'package:octoconta_final/src/ui/login/login_inputs.dart';

import '../pagina_principal/pagina_principal.dart';
// import 'package:octoconta_final/src/ui/pagina_principal/pagina_principal.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController correo = TextEditingController();
  TextEditingController password = TextEditingController();

  Future signIn() async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const PaginaPrincipal()));
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: correo.text.trim(), password: password.text.trim());
  }

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

  void registrarse() {
    String correoValor = correo.text.trim();
    String passwordValor = password.text.trim();
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExpEmail = RegExp(emailPattern);
    if (correoValor.isEmpty) {
      mensajeErrorCorreo('Por favor, ingrese su correo electronico', false);
    }

    if (passwordValor.isEmpty) {
      mensajeErrorPassword('Por favor, ingrese su contraseña', false);
    } else {
      mensajeErrorCorreo('', true);
      mensajeErrorPassword('', true);
      if (!regExpEmail.hasMatch(correoValor)) {
        mensajeErrorCorreo('Correo Invalido', false);
      } else {
        signIn();
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
