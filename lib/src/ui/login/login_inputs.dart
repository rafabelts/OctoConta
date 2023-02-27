import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInInputs extends StatefulWidget {
  final TextEditingController correoUser;
  final dynamic correoError;
  final Function(dynamic) onChangedCorreo;
  final VoidCallback onSubmittedCorreo;

  final TextEditingController passwordUser;
  final dynamic passwordError;
  final Function(dynamic) onChangedPassword;
  final VoidCallback onSubmittedPassword;

  const LogInInputs(
      {required this.correoUser,
      required this.correoError,
      required this.onChangedCorreo,
      required this.onSubmittedCorreo,
      required this.passwordUser,
      required this.passwordError,
      required this.onChangedPassword,
      required this.onSubmittedPassword,
      super.key});

  @override
  State<LogInInputs> createState() => _LogInInputsState();
}

class _LogInInputsState extends State<LogInInputs> {
  bool _isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Bienvenido!',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          buildInputNombreEmail(context),
          buildPasswordInput(context),
        ],
      ),
    );
  }

  Widget buildInputNombreEmail(BuildContext context) {
    // Creo la entrada del email del usuario

    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextField(
        controller: widget.correoUser,
        onChanged: widget.onChangedCorreo,
        onEditingComplete: widget.onSubmittedCorreo,
        keyboardType: TextInputType.emailAddress,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorText: widget.correoError,
          errorStyle:
              GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Correo electrónico')),
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

  Widget buildPasswordInput(BuildContext context) {
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
          errorStyle:
              GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
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
}
