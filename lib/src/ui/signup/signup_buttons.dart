import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/login/login_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SignUpButtons extends StatelessWidget {
  final VoidCallback avanzar;
  const SignUpButtons({required this.avanzar, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(children: [
        RichText(
          text: TextSpan(
            text: 'Al continuar, acepta nuestro ',
            style: Theme.of(context).textTheme.titleMedium,
            children: <TextSpan>[
              TextSpan(
                  text: 'Acuerdo de Usuario',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF5E35B1),
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Al presionar manda a la pagina
                      launchUrlString(
                          'https://rafabelts.github.io/acuerdoypolitica/acuerdoUsuario/acuerdoDeUsuario.html');
                    }),
              TextSpan(
                text: ' y reconoce que comprende la ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextSpan(
                  text: 'Política de Privacidad.',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF5E35B1),
                    fontWeight: FontWeight.w500,
                    fontSize: 19,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      launchUrlString(
                          'https://rafabelts.github.io/acuerdoypolitica/politicaPrivacidad/politicaPrivacidad.html');
                    }),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: avanzar,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                backgroundColor: const Color(0xff4527A0),
                // elevation: 15,
                // shadowColor: Color(0xFFCBC8DE),
                padding: const EdgeInsets.symmetric(vertical: 13.0),
              ),
              child: Text(
                'Registrarse',
                style: GoogleFonts.inter(
                  // color: lightBackround,
                  fontWeight: FontWeight.w700,
                  fontSize: 27,
                ),
              ),
            ),
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.only(bottom: 10),
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
        //         side: const BorderSide(width: 2.0, color: Color(0xff4527A0)),
        //         shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(12.0)),
        //         padding: const EdgeInsets.symmetric(vertical: 13.0)),
        //     onPressed: () {},
        //     icon: const Image(
        //       image: AssetImage('images/googleLogo.png'),
        //       width: 20,
        //     ),
        //     label: Text('Registrarse con Google',
        //         style: GoogleFonts.inter(
        //             fontSize: 24,
        //             fontWeight: FontWeight.w600,
        //             color: const Color(0xff4527A0))),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()));
            },
            child: Text(
              'Ya tiene una cuenta?, Iniciar Sesión',
              style: GoogleFonts.inter(
                color: const Color(0xff4527A0),
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
