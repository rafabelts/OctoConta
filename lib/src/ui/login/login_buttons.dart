import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/login/olvido_contra/ingresar_correo/ingresar_correo_veri_screen.dart';

class LogInButtons extends StatelessWidget {
  final VoidCallback avanzar;
  const LogInButtons({required this.avanzar, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CorreoParaVerificar()));
            },
            child: Text(
              'Haz olvidado tu contraseña?',
              style: GoogleFonts.inter(
                color: const Color(0xff4527A0),
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: avanzar,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    backgroundColor: Color.fromARGB(255, 54, 30, 124),
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
            // Padding(
            //   padding: const EdgeInsets.only(bottom: 20),
            //   child: Text(
            //     'O',
            //     style: GoogleFonts.inter(
            //         fontSize: 28,
            //         fontWeight: FontWeight.w700,
            //         color: const Color(0xff534677)),
            //   ),
            // ),
            // SizedBox(
            //   width: double.infinity,
            //   child: OutlinedButton.icon(
            //     style: OutlinedButton.styleFrom(
            //         side:
            //             const BorderSide(width: 2.0, color: Color(0xff4527A0)),
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(12.0)),
            //         padding: const EdgeInsets.symmetric(vertical: 13.0)),
            //     onPressed: () {},
            //     icon: const Image(
            //       image: AssetImage('images/googleLogo.png'),
            //       width: 20,
            //     ),
            //     label: Text('Iniciar Sesión con Google',
            //         style: GoogleFonts.inter(
            //             fontSize: 24,
            //             fontWeight: FontWeight.w600,
            //             color: const Color(0xff4527A0))),
            //   ),
            // ),
          ]),
        ],
      ),
    );
  }
}
