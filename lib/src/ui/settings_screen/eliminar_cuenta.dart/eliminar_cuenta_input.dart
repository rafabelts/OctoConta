import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EliminarCuentaInput extends StatefulWidget {
  final TextEditingController passwordUser;
  final Function(dynamic) onChangedPassword;
  final dynamic passwordError;
  final VoidCallback onSubmmitedPassword;

  const EliminarCuentaInput(
      {required this.passwordUser,
      required this.onChangedPassword,
      required this.passwordError,
      required this.onSubmmitedPassword,
      super.key});

  @override
  State<EliminarCuentaInput> createState() => _EliminarCuentaInputState();
}

class _EliminarCuentaInputState extends State<EliminarCuentaInput> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width - 20,
        child: TextField(
          controller: widget.passwordUser,
          onChanged: widget.onChangedPassword,
          obscureText: isPasswordVisible,
          onEditingComplete: widget.onSubmmitedPassword,
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
        ));
  }
}
