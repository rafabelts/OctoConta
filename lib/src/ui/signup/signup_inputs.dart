import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpInputs extends StatefulWidget {
  final TextEditingController nombreUser;
  final dynamic nombreError;
  final Function(dynamic) onChangedNombre;
  final VoidCallback onSubmittedNombre;

  final TextEditingController emailUser;
  final dynamic emailError;
  final Function(dynamic) onChangedEmail;
  final VoidCallback onSubmittedEmail;

  final TextEditingController passwordUser;
  final dynamic passwordError;
  final Function(dynamic) onChangedPassword;
  final VoidCallback onSubmittedPassword;

  final TextEditingController conffirmedPasswordUser;
  final dynamic conffirmedPasswordError;
  final Function(dynamic) onChangedConffirmedPassword;
  final VoidCallback onSubmittedConffirmedPassword;

  const SignUpInputs(
      {required this.nombreUser,
      required this.nombreError,
      required this.onChangedNombre,
      required this.onSubmittedNombre,
      required this.emailUser,
      required this.emailError,
      required this.onChangedEmail,
      required this.onSubmittedEmail,
      required this.passwordUser,
      required this.passwordError,
      required this.onChangedPassword,
      required this.onSubmittedPassword,
      required this.conffirmedPasswordUser,
      required this.conffirmedPasswordError,
      required this.onChangedConffirmedPassword,
      required this.onSubmittedConffirmedPassword,
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
            'Crear cuenta',
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
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        controller: widget.nombreUser,
        onChanged: widget.onChangedNombre,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        onEditingComplete: widget.onSubmittedNombre,
        decoration: InputDecoration(
          errorText: widget.nombreError,
          errorMaxLines: 4,
          errorStyle: GoogleFonts.inter(
              fontSize: width <= 360 ? 12 : 14, fontWeight: FontWeight.w600),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Nombre')),
          labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(color: Color(0xff534677)),
              fontSize: width <= 360 ? 19 : 21,
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
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: widget.emailUser,
        onChanged: widget.onChangedEmail,
        onEditingComplete: widget.onSubmittedEmail,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorText: widget.emailError,
          errorMaxLines: 4,
          errorStyle: GoogleFonts.inter(
              fontSize: width <= 360 ? 12 : 14, fontWeight: FontWeight.w600),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Correo electrónico')),
          labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(color: Color(0xff534677)),
              fontSize: width <= 360 ? 19 : 21,
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
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextField(
        controller: widget.passwordUser,
        onChanged: widget.onChangedPassword,
        obscureText: _isPasswordVisible,
        onEditingComplete: widget.onSubmittedPassword,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorText: widget.passwordError,
          errorMaxLines: 4,
          errorStyle: GoogleFonts.inter(
              fontSize: width <= 360 ? 12 : 14, fontWeight: FontWeight.w600),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Contraseña')),
          labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(color: Color(0xff534677)),
              fontSize: width <= 360 ? 19 : 21,
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
            splashRadius: 1.0,
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
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextField(
        controller: widget.conffirmedPasswordUser,
        obscureText: _isConfirmPasswordVisible,
        onChanged: widget.onChangedConffirmedPassword,
        onEditingComplete: widget.onSubmittedConffirmedPassword,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorText: widget.conffirmedPasswordError,
          errorMaxLines: 4,
          errorStyle: GoogleFonts.inter(
              fontSize: width <= 360 ? 12 : 14, fontWeight: FontWeight.w600),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Confirmar contraseña')),
          labelStyle: GoogleFonts.inter(
              textStyle: const TextStyle(color: Color(0xff534677)),
              fontSize: width <= 360 ? 19 : 21,
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
            splashRadius: 1.0,
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
