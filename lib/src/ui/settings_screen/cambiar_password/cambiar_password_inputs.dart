import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CambiarPasswordInput extends StatefulWidget {
  const CambiarPasswordInput({super.key});

  @override
  State<CambiarPasswordInput> createState() => _CambiarPasswordInputState();
}

class _CambiarPasswordInputState extends State<CambiarPasswordInput> {
  bool isPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isConffirmNewPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
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
            obscureText: isNewPasswordVisible,
            style: GoogleFonts.inter(
              color: const Color(0xff534677),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            decoration: InputDecoration(
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
          obscureText: isConffirmNewPasswordVisible,
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                backgroundColor: const Color(0xff4527A0),
                padding: const EdgeInsets.symmetric(vertical: 8.0),
              ),
              child: Text(
                'Cambiar',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
