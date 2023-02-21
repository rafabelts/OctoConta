import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/signup/signup_buttons.dart';
import 'package:octoconta_final/src/ui/signup/signup_inputs.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nombre = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController conffirmedPassword = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
    } catch (e) {}
  }

  void registrarse() {
    String nombreValor = nombre.text.trim();
    String emailValor = email.text.trim();
    String passwordValor = password.text.trim();
    String conffirmedPasswordValor = conffirmedPassword.text.trim();

    if (nombreValor.isEmpty) {
      mensajeErrorNombre('Por favor, ingrese su nombre', false);
    }
    if (emailValor.isEmpty) {
      mensajeErrorEmail('Por favor, ingrese su correo electronico', false);
    }
    if (passwordValor.isEmpty) {
      mensajeErrorPassword('Por favor, ingrese su contraseña', false);
    }
    if (conffirmedPasswordValor.isEmpty) {
      mensajeErrorConffirmedPassword('Por favor, ingrese su contraseña', false);
    } else {
      String emailPattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExpEmail = RegExp(emailPattern);

      String passwordPattern =
          r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
      RegExp regExpPassword = RegExp(passwordPattern);

      if (passwordValor.length < 8) {
        mensajeErrorPassword('Se necesitan al menos 8 caracteres', false);
        if (conffirmedPasswordValor.length < 8) {
          mensajeErrorConffirmedPassword(
              'Se necesitan al menos 8 caracteres', false);
        }
      } else if (passwordValor != conffirmedPasswordValor) {
        mensajeErrorPassword('Las contraseñas no coinciden', false);
        mensajeErrorConffirmedPassword('Las contraseñas no coinciden', false);
      } else if (!regExpPassword.hasMatch(passwordValor)) {
        mensajeErrorPassword(
            '''La contraseña debe tener al entre 8 y 16 caracteres,
al menos un valor especial, un numero, una minúscula 
y una mayúscula.''', false);
        if (!regExpPassword.hasMatch(conffirmedPasswordValor)) {
          mensajeErrorConffirmedPassword(
              '''La contraseña debe tener al entre 8 y 16 caracteres,
al menos un valor especial, un numero, una minúscula 
y una mayúscula.''', false);
        }
      } else {
        mensajeErrorPassword('', true);
        mensajeErrorConffirmedPassword('', true);
        if (nombreValor.isEmpty) {
          mensajeErrorNombre('Por favor, ingrese su nombre', false);
        } else if (emailValor.isEmpty) {
          mensajeErrorEmail('Por favor, ingrese su correo electronico', false);
        } else if (!regExpEmail.hasMatch(emailValor)) {
          mensajeErrorEmail('Correo Invalido', false);
        } else {
          mensajeErrorNombre('', true);
          mensajeErrorEmail('', true);

          createUserWithEmailAndPassword();
        }
      }
    }
  }

  String mensajeErrorDeNombre = '';
  bool errorInNombre = true;
  mensajeErrorNombre(String mensajeError, bool error) {
    setState(() {
      errorInNombre = error;
      errorInNombre ? true : (mensajeErrorDeNombre = mensajeError);
    });
  }

  String mensajeErrorDeEmail = '';
  bool errorInEmail = true;
  mensajeErrorEmail(String mensajeError, bool error) {
    setState(() {
      errorInEmail = error;
      errorInEmail ? true : (mensajeErrorDeEmail = mensajeError);
    });
  }

  String mensajeErrorDePassword = '';
  bool errorInPassword = true;
  mensajeErrorPassword(String mensajeError, bool error) {
    setState(() {
      errorInPassword = error;
      errorInPassword ? true : (mensajeErrorDePassword = mensajeError);
    });
  }

  String mensajeErrorDeConffirmedPassword = '';
  bool errorInConffirmedPassword = true;
  mensajeErrorConffirmedPassword(String mensajeError, bool error) {
    setState(() {
      errorInConffirmedPassword = error;
      errorInConffirmedPassword
          ? true
          : (mensajeErrorDeConffirmedPassword = mensajeError);
    });
  }

  onChangedNombre() => mensajeErrorNombre('', true);
  onChangedEmail() => mensajeErrorEmail('', true);
  onChangedPassword() => mensajeErrorPassword('', true);
  onChangedConffirmedPassword() => mensajeErrorConffirmedPassword('', true);

  @override
  void initState() {
    super.initState();
    nombre;
    email;
    password;
    conffirmedPassword;
  }

  @override
  void dispose() {
    super.dispose();
    nombre.dispose();
    email.dispose();
    password.dispose();
    conffirmedPassword.dispose();
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
                  SignUpInputs(
                    nombreUser: nombre,
                    onChangedNombre: (value) => onChangedNombre(),
                    nombreError: errorInNombre ? null : mensajeErrorDeNombre,
                    emailUser: email,
                    onChangedEmail: (value) => onChangedEmail(),
                    emailError: errorInEmail ? null : mensajeErrorDeEmail,
                    passwordUser: password,
                    onChangedPassword: (value) => onChangedPassword(),
                    passwordError:
                        errorInPassword ? null : mensajeErrorDePassword,
                    conffirmedPasswordUser: conffirmedPassword,
                    onChangedConffirmedPassword: (value) =>
                        onChangedConffirmedPassword(),
                    conffirmedPasswordError: errorInConffirmedPassword
                        ? null
                        : mensajeErrorDeConffirmedPassword,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: SignUpButtons(
                      avanzar: () => registrarse(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
