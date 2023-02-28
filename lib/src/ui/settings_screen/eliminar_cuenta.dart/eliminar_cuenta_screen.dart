import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/models/mensaje_cuentas.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/settings_screen/eliminar_cuenta.dart/eliminar_cuenta_buttons.dart';
import 'package:octoconta_final/src/ui/settings_screen/eliminar_cuenta.dart/eliminar_cuenta_input.dart';
import 'package:octoconta_final/src/ui/welcome/welcome_screen.dart';

class EliminarCuentaScreen extends StatefulWidget {
  const EliminarCuentaScreen({super.key});

  @override
  State<EliminarCuentaScreen> createState() => _EliminarCuentaScreenState();
}

class _EliminarCuentaScreenState extends State<EliminarCuentaScreen> {
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

  onChangedPassword() => mensajeErrorPassword('', false);

  @override
  void initState() {
    super.initState();
    password;
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User? user = Auth().currentUser;
    final String? correoUser = Auth().currentUser?.email;

    Future<void> funElimin() async {
      try {
        showDialog(
            context: context,
            builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: const Color.fromARGB(255, 153, 151, 158),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ));

        final AuthCredential credentials = EmailAuthProvider.credential(
            email: correoUser!, password: password.text);
        await user?.reauthenticateWithCredential(credentials);

        await user?.delete().then((value) {
          FocusScope.of(context).unfocus();
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
        // La cuenta se eliminó correctamente.
      } on FirebaseAuthException catch (e) {
        if (e.code == 'network-request-failed') {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Error de solicitud de red: la solicitud no se pudo completar. Por favor, compruebe su conexión a Internet e inténtelo de nuevo.'));
        } else if (e.code == 'wrong-password') {
          Navigator.pop(context); // Cerrar diálogo
          mensajeErrorPassword(
              '''Error: contraseña incorrecta. Por favor ingrese su 
contraseña correctamente.''', true);
        } else {
          Future.microtask(() => showMensajeParaUsuario(context, true,
              'Error desconocido. Por favor, intente de nuevo más tarde.'));
        }
      }
    }

    void eliminar() {
      if (password.text.isEmpty) {
        mensajeErrorPassword("Por favor, ingrese su contraseña.", true);
      } else {
        mensajeErrorPassword('', false);
        print(password.text);

        funElimin();
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Eliminar cuenta',
          style: GoogleFonts.inter(
            color: const Color(0xff382A62),
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Para continuar, ingrese su contraseña por favor.',
            style: GoogleFonts.inter(
              color: const Color(0xff382A62),
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: EliminarCuentaInput(
            passwordUser: password,
            onChangedPassword: (value) => onChangedPassword(),
            passwordError:
                errorInPassword == false ? null : mensajeDeErrorPassword,
            onSubmmitedPassword: eliminar,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: EliminarCuentaButtons(eliminarCuenta: () => eliminar()),
        )
      ],
    );
  }
}
