import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInInputs extends StatefulWidget {
  const LogInInputs({super.key});

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
            'Bienvenido De Nuevo!',
            style: Theme.of(context).textTheme.headline2,
          ),
          buildInputNombreEmail(context),
          buildPasswordInput(context),
        ],
      ),
    );
  }

  Widget buildInputNombreEmail(BuildContext context) {
    // Creo la entrada del nombre del usuario
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          label: Container(
              margin: const EdgeInsets.only(top: 3.0),
              child: const Text('Nombre o Correo Electrónico')),
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
        obscureText: _isPasswordVisible,
        style: GoogleFonts.inter(
          color: const Color(0xff534677),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
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
