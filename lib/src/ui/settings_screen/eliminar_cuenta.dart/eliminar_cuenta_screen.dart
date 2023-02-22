import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/services/auth.dart';
import 'package:octoconta_final/src/ui/settings_screen/eliminar_cuenta.dart/eliminar_cuenta_buttons.dart';
import 'package:octoconta_final/src/ui/settings_screen/eliminar_cuenta.dart/eliminar_cuenta_input.dart';

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

    late AuthCredential credentials = EmailAuthProvider.credential(
        email: correoUser!, password: password.text);

    Future<void> funElimin() async {
      try {
        showDialog(
            context: context,
            builder: (context) => Center(
                  child: CircularProgressIndicator(
                    color: const Color(0xff2A195D),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ));
        await user?.reauthenticateWithCredential(credentials);

        await user?.delete().then((value) {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pop(context);
        });
        // La cuenta se eliminó correctamente.
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password') {
          Navigator.pop(context); // Cerrar diálogo
          mensajeErrorPassword('La contraseña es incorrecta.', true);
        }
      }
    }

    void eliminar() {
      if (password.text.isEmpty) {
        mensajeErrorPassword('Por favor, ingrese su contraseña.', true);
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
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: EliminarCuentaInput(
            passwordUser: password,
            onChangedPassword: (value) => onChangedPassword(),
            passwordError:
                errorInPassword == false ? null : mensajeDeErrorPassword,
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
