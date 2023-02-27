import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CambiarEmailInput extends StatefulWidget {
  final TextEditingController correoUser;
  final Function(dynamic) onChangedCorreoUser;
  final dynamic errorCorreoUser;
  final VoidCallback onSubmittedCorreo;

  final TextEditingController passwordUser;
  final Function(dynamic) onChangedPassword;
  final dynamic passwordUserError;
  final VoidCallback onSubmittedPassword;

  const CambiarEmailInput(
      {required this.correoUser,
      required this.onChangedCorreoUser,
      required this.errorCorreoUser,
      required this.onSubmittedCorreo,
      required this.passwordUser,
      required this.onChangedPassword,
      required this.passwordUserError,
      required this.onSubmittedPassword,
      super.key});

  @override
  State<CambiarEmailInput> createState() => _CambiarEmailInputState();
}

class _CambiarEmailInputState extends State<CambiarEmailInput> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Cambiar Correo',
            style: GoogleFonts.inter(
              color: const Color(0xff2A195D),
              fontWeight: FontWeight.w700,
              fontSize: 37.9,
            ),
          ),
        ),
        TextField(
          controller: widget.correoUser,
          onChanged: widget.onChangedCorreoUser,
          onEditingComplete: widget.onSubmittedCorreo,
          keyboardType: TextInputType.emailAddress,
          style: GoogleFonts.inter(
            color: const Color(0xff534677),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            errorText: widget.errorCorreoUser,
            errorStyle:
                GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0)),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2.0, color: Colors.red)),
            label: Container(
                margin: const EdgeInsets.only(top: 3.0),
                child: const Text('Nuevo Correo Electrónico')),
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
        Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              'Para realizar el cambio ingrese su contraseña',
              style: GoogleFonts.inter(
                color: const Color(0xff382A62),
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextField(
            controller: widget.passwordUser,
            onChanged: widget.onChangedPassword,
            onEditingComplete: widget.onSubmittedPassword,
            obscureText: isPasswordVisible,
            style: GoogleFonts.inter(
              color: const Color(0xff534677),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              errorText: widget.passwordUserError,
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
                    isPasswordVisible =
                        !isPasswordVisible; //change boolean value
                  });
                },
                icon: Icon(
                  isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xff534677),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
