import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogInButtons extends StatelessWidget {
  const LogInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                backgroundColor: const Color(0xff4527A0),
                // elevation: 15,
                // shadowColor: Color(0xFFCBC8DE),
                padding: const EdgeInsets.symmetric(vertical: 13.0),
              ),
              child: Text(
                'Iniciar Sesión',
                style: GoogleFonts.inter(
                  // color: lightBackround,
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Text(
            'O',
            style: GoogleFonts.inter(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: const Color(0xff534677)),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 2.0, color: Color(0xff4527A0)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                padding: const EdgeInsets.symmetric(vertical: 13.0)),
            onPressed: () {},
            icon: const Image(
              image: AssetImage('images/googleLogo.png'),
              width: 20,
            ),
            label: Text('Iniciar Sesión con Google',
                style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff4527A0))),
          ),
        ),
      ]),
    );
  }
}
