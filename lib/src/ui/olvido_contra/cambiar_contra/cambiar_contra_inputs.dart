import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CambioContrasenaInput extends StatefulWidget {
  const CambioContrasenaInput({super.key});

  @override
  State<CambioContrasenaInput> createState() => _CambioContrasenaInputState();
}

class _CambioContrasenaInputState extends State<CambioContrasenaInput> {
  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = true;
    bool isConfirmPasswordVisible = true;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Crear nueva contraseña',
              style: GoogleFonts.inter(
                color: const Color(0xff2A195D),
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
          ),
          TextField(
            obscureText: isPasswordVisible,
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
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: TextField(
              obscureText: isConfirmPasswordVisible,
              style: GoogleFonts.inter(
                color: const Color(0xff534677),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                label: Container(
                    margin: const EdgeInsets.only(top: 3.0),
                    child: const Text('Confirmar Contraseña')),
                labelStyle: GoogleFonts.inter(
                    textStyle: const TextStyle(color: Color(0xff534677)),
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
                contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.0, color: Color(0xff534677))),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2.0, color: Color(0xff534677))),
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  color: Color(0xff534677),
                  size: 30,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isConfirmPasswordVisible =
                          !isConfirmPasswordVisible; //change boolean value
                    });
                  },
                  icon: Icon(
                    isConfirmPasswordVisible
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color(0xff534677),
                  ),
                ),
              ),
            ),
          )
        ]);
  }
}
