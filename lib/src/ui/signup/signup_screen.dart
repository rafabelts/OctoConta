import 'package:adaptive_components/adaptive_components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
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
      print("Usuario Creado");
      await Auth().createUserWithEmailAndPassword(
        email: email.text.toLowerCase().trim(),
        password: password.text,
        context: context,
      );
      final User? user = Auth().currentUser;
      // final AuthCredential userCredential = EmailAuthProvider.credential(email: email.text.toLowerCase().trim(), password: password.text);

      await user?.updateDisplayName(nombre.text);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'network-request-failed') {
        showMensajeParaUsuario(context, true,
            'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.');
      } else if (e.code == 'email-already-in-use') {
        mensajeErrorEmail('''Error: esta dirección de correo electrónico 
ya está en uso. Por favor, intente con una 
diferente.''', false);
      } else if (e.code == 'weak-password') {
        mensajeErrorPassword('''La contraseña ingresada es demasiado débil. 
Por favor intente crear una contraseña más segura''', false);
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
    String nombreValor = nombre.text;
    String emailValor = email.text.toLowerCase().trim();
    String passwordValor = password.text;
    String conffirmedPasswordValor = conffirmedPassword.text;

    if (nombreValor.isEmpty) {
      mensajeErrorNombre('Por favor, ingrese su nombre.', false);
    }
    if (emailValor.isEmpty) {
      mensajeErrorEmail('Por favor, ingrese su correo electrónico.', false);
    }
    if (passwordValor.isEmpty) {
      mensajeErrorPassword('Por favor, ingrese su contraseña', false);
    }
    if (conffirmedPasswordValor.isEmpty) {
      mensajeErrorConffirmedPassword(
          '''Por favor, ingrese su contraseña de nuevo para 
confirmar.''', false);
    } else {
      String emailPattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExpEmail = RegExp(emailPattern);

      String passwordPattern =
          r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
      RegExp regExpPassword = RegExp(passwordPattern);

      if (passwordValor.length < 8) {
        mensajeErrorPassword(
            'La contraseña debe tener al menos 8 caracteres.', false);
      } else if (passwordValor != conffirmedPasswordValor) {
        mensajeErrorPassword('Error: contraseñas no coinciden.', false);
        mensajeErrorConffirmedPassword(
            'Error: contraseñas no coinciden.', false);
      } else if (!regExpPassword.hasMatch(passwordValor)) {
        mensajeErrorPassword(
            '''La contraseña debe tener al entre 8 y 16 caracteres,
al menos un valor especial, un número, una 
minúscula y una mayúscula.''', false);
      } else {
        if (nombreValor.isEmpty) {
          mensajeErrorNombre('Por favor, ingrese su nombre.', false);
        } else if (emailValor.isEmpty) {
          mensajeErrorEmail('Por favor, ingrese su correo electrónico.', false);
        } else if (!regExpEmail.hasMatch(emailValor)) {
          mensajeErrorEmail('''Error: correo electrónico inválido. Por favor, 
ingrese un correo electrónico válido.''', false);
        } else {
          mensajeErrorNombre('', true);
          mensajeErrorEmail('', true);
          mensajeErrorPassword('', true);
          mensajeErrorConffirmedPassword('', true);
          FocusScope.of(context).unfocus();
          createUserWithEmailAndPassword();
        }
      }
    }
  }

  void onSubmittedNombre() {
    if (nombre.text.isEmpty) {
      mensajeErrorNombre('Por favor, ingrese su nombre.', false);
    } else {
      mensajeErrorNombre("", true);
      FocusScope.of(context).nextFocus();
    }
  }

  void onSubmittedEmail() {
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExpEmail = RegExp(emailPattern);
    if (email.text.trim().toLowerCase().isEmpty) {
      mensajeErrorEmail('Por favor, ingrese su correo electrónico.', false);
    } else if (!regExpEmail.hasMatch(email.text.trim().toLowerCase())) {
      mensajeErrorEmail('''Error: correo electrónico inválido. Por favor, 
ingrese un correo electrónico válido.''', false);
    } else {
      mensajeErrorEmail("", true);
      FocusScope.of(context).nextFocus();
    }
  }

  void onSubmittedPassword() {
    String passwordPattern =
        r'^(?=.*\d)(?=.*[\u0021-\u002b\u003c-\u0040])(?=.*[A-Z])(?=.*[a-z])\S{8,16}$';
    RegExp regExpPassword = RegExp(passwordPattern);
    if (password.text.isEmpty) {
      mensajeErrorPassword('Por favor, ingrese su contraseña', false);
    } else if (password.text.length < 8) {
      mensajeErrorPassword(
          'La contraseña debe tener al menos 8 caracteres.', false);
    } else if (!regExpPassword.hasMatch(password.text)) {
      mensajeErrorPassword(
          '''La contraseña debe tener al entre 8 y 16 caracteres,
al menos un valor especial, un número, una
minúscula y una mayúscula.''', false);
    } else {
      mensajeErrorPassword("", true);
      FocusScope.of(context).nextFocus();
      FocusScope.of(context).nextFocus();
    }
  }

  void onSubmittedConffirmedPassword() {
    if (conffirmedPassword.text.isEmpty) {
      mensajeErrorConffirmedPassword('Por favor, ingrese su contraseña', false);
    } else if (conffirmedPassword.text != password.text) {
      mensajeErrorConffirmedPassword('Las contraseñas no coinciden.', false);
    } else {
      mensajeErrorConffirmedPassword("", true);
      createUserWithEmailAndPassword();
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
                    onSubmittedNombre: onSubmittedNombre,
                    emailUser: email,
                    onChangedEmail: (value) => onChangedEmail(),
                    onSubmittedEmail: onSubmittedEmail,
                    emailError: errorInEmail ? null : mensajeErrorDeEmail,
                    passwordUser: password,
                    onChangedPassword: (value) => onChangedPassword(),
                    passwordError:
                        errorInPassword ? null : mensajeErrorDePassword,
                    onSubmittedPassword: onSubmittedPassword,
                    conffirmedPasswordUser: conffirmedPassword,
                    onChangedConffirmedPassword: (value) =>
                        onChangedConffirmedPassword(),
                    conffirmedPasswordError: errorInConffirmedPassword
                        ? null
                        : mensajeErrorDeConffirmedPassword,
                    onSubmittedConffirmedPassword:
                        onSubmittedConffirmedPassword,
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
