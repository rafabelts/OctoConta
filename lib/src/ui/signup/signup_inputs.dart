import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpInputs extends StatefulWidget {
  final TextEditingController emailUser;
  final dynamic emailError;
  final Function(dynamic) onChangedEmail;

  final TextEditingController nombreUser;
  final dynamic nombreError;
  final Function(dynamic) onChangedNombre;

  final TextEditingController passwordUser;
  final dynamic passwordError;
  final Function(dynamic) onChangedPassword;

  final TextEditingController conffirmedPasswordUser;
  final dynamic conffirmedPasswordError;
  final Function(dynamic) onChangedConffirmedPassword;

  const SignUpInputs(
      {required this.emailUser,
      required this.emailError,
      required this.onChangedEmail,
      required this.nombreUser,
      required this.nombreError,
      required this.onChangedNombre,
      required this.passwordUser,
      required this.passwordError,
      required this.onChangedPassword,
      required this.conffirmedPasswordUser,
      required this.conffirmedPasswordError,
      required this.onChangedConffirmedPassword,
      super.key});

  @override
  State<SignUpInputs> createState() => _SignUpInputsState();
}

class _SignUpInputsState extends State<SignUpInputs> {
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Crear Cuenta',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          buildInputNombre(context),
          buildEmailInput(context),
          buildPasswordInput(context),
          buildCPasswordInput(context),
        ],
      ),
    );
  }

  Widget buildInputNombre(BuildContext context) {
    // Creo la entrada del nombre del usuario
    late TextEditingController nombre = widget.nombreUser;
    late dynamic errorNombre = widget.nombreError;
    late Function(dynamic) onChangedNombre = widget.onChangedNombre;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        controller: nombre,
        onChanged: onChangedNombre,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorText: errorNombre,
          errorStyle:
              GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Nombre')),
          labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(color: Color(0xff534677)),
              fontSize: 21,
              fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Color(0xff534677))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Color(0xff534677))),
          prefixIcon: const Icon(
            Icons.person_outline_rounded,
            color: Color(0xff534677),
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget buildEmailInput(BuildContext context) {
    // Creo la entrada del e-mail del usuario
    late TextEditingController email = widget.emailUser;
    late dynamic emailError = widget.emailError;
    late Function(dynamic) onChangedEmail = widget.onChangedEmail;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextField(
        controller: email,
        onChanged: onChangedEmail,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorText: emailError,
          errorStyle:
              GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Correo Electrónico')),
          labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(color: Color(0xff534677)),
              fontSize: 21,
              fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Color(0xff534677))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Color(0xff534677))),
          prefixIcon: const Icon(
            Icons.mail_outline_rounded,
            color: Color(0xff534677),
            size: 30,
          ),
        ),
      ),
    );
  }

  Widget buildPasswordInput(BuildContext context) {
    // Entrada para la contrasena del usuario
    late TextEditingController password = widget.passwordUser;
    late dynamic errorPassword = widget.passwordError;
    late Function(dynamic) onChangedPassword = widget.onChangedPassword;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextField(
        controller: password,
        onChanged: onChangedPassword,
        obscureText: _isPasswordVisible,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorText: errorPassword,
          errorStyle:
              GoogleFonts.inter(fontSize: 13.15, fontWeight: FontWeight.w600),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Contraseña')),
          labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(color: Color(0xff534677)),
              fontSize: 21,
              fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Color(0xff534677))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Color(0xff534677))),
          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            color: Color(0xff534677),
            size: 30,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible; //change boolean value
              });
            },
            icon: Icon(
              _isPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: const Color(0xff534677),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCPasswordInput(BuildContext context) {
    // Entrada para la confirmacion de contrasena del usuario
    late TextEditingController conffirmedPassword =
        widget.conffirmedPasswordUser;
    late dynamic errorConffirmedPassword = widget.conffirmedPasswordError;
    late Function(dynamic) onChangedConffirmedPassword =
        widget.onChangedConffirmedPassword;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextField(
        controller: conffirmedPassword,
        obscureText: _isConfirmPasswordVisible,
        onChanged: onChangedConffirmedPassword,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorText: errorConffirmedPassword,
          errorStyle:
              GoogleFonts.inter(fontSize: 13.15, fontWeight: FontWeight.w600),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Confirmar Contraseña')),
          labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(color: Color(0xff534677)),
              fontSize: 21,
              fontWeight: FontWeight.w500),
          contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, color: Color(0xff534677))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Color(0xff534677))),
          prefixIcon: const Icon(
            Icons.lock_outline_rounded,
            color: Color(0xff534677),
            size: 30,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isConfirmPasswordVisible =
                    !_isConfirmPasswordVisible; //change boolean value
              });
            },
            icon: Icon(
              _isConfirmPasswordVisible
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: const Color(0xff534677),
            ),
          ),
        ),
      ),
    );
  }
}
