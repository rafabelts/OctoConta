import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CambiarPasswordInput extends StatefulWidget {
  final TextEditingController passwordUser;
  final dynamic passwordError;
  final Function(dynamic) onChangedPassword;

  final TextEditingController newPasswordUser;
  final dynamic newPasswordError;
  final Function(dynamic) onChangedNewPassword;

  final TextEditingController conffirmedNewPasswordUser;
  final dynamic conffirmedNewPasswordError;
  final Function(dynamic) onChangedNewConffirmedPassword;
  const CambiarPasswordInput(
      {required this.passwordUser,
      required this.passwordError,
      required this.onChangedPassword,
      required this.newPasswordUser,
      required this.newPasswordError,
      required this.onChangedNewPassword,
      required this.conffirmedNewPasswordUser,
      required this.conffirmedNewPasswordError,
      required this.onChangedNewConffirmedPassword,
      super.key});

  @override
  State<CambiarPasswordInput> createState() => _CambiarPasswordInputState();
}

class _CambiarPasswordInputState extends State<CambiarPasswordInput> {
  bool isPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConffirmNewPasswordVisible = true;

  late final TextEditingController passwordUser = widget.passwordUser;
  late final Function(dynamic) onChangedPassword = widget.onChangedPassword;

  late final TextEditingController newPasswordUser = widget.newPasswordUser;
  late final Function(dynamic) onChangedNewPassword =
      widget.onChangedNewPassword;

  late final TextEditingController conffirmedNewPassword =
      widget.conffirmedNewPasswordUser;
  late final Function(dynamic) onChangedconffirmedNewPassword =
      widget.onChangedNewConffirmedPassword;

  @override
  Widget build(BuildContext context) {
    final dynamic passwordUserError = widget.passwordError;
    final dynamic newPasswordUserError = widget.newPasswordError;
    final dynamic confirmedNewPasswordUserError =
        widget.conffirmedNewPasswordError;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            'Cambiar Contraseña',
            style: GoogleFonts.inter(
              color: const Color(0xff2A195D),
              fontWeight: FontWeight.w700,
              fontSize: 37.9,
            ),
          ),
        ),
        TextField(
          controller: passwordUser,
          onChanged: onChangedPassword,
          obscureText: isPasswordVisible,
          style: GoogleFonts.inter(
            color: const Color(0xff534677),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            errorText: passwordUserError,
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
                  isPasswordVisible = !isPasswordVisible; //change boolean value
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: TextField(
            controller: newPasswordUser,
            onChanged: onChangedNewPassword,
            obscureText: isNewPasswordVisible,
            style: GoogleFonts.inter(
              color: const Color(0xff534677),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
              errorText: newPasswordUserError,
              errorStyle:
                  GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0)),
              focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 2.0, color: Colors.red)),
              label: Container(
                  margin: const EdgeInsets.only(top: 3.0),
                  child: const Text('Nueva Contraseña')),
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
                    isNewPasswordVisible =
                        !isNewPasswordVisible; //change boolean value
                  });
                },
                icon: Icon(
                  isNewPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: const Color(0xff534677),
                ),
              ),
            ),
          ),
        ),
        TextField(
          controller: conffirmedNewPassword,
          onChanged: onChangedconffirmedNewPassword,
          obscureText: isConffirmNewPasswordVisible,
          style: GoogleFonts.inter(
            color: const Color(0xff534677),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            errorText: confirmedNewPasswordUserError,
            errorStyle:
                GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
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
                  isConffirmNewPasswordVisible =
                      !isConffirmNewPasswordVisible; //change boolean value
                });
              },
              icon: Icon(
                isConffirmNewPasswordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: const Color(0xff534677),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
