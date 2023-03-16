import 'package:adaptive_components/adaptive_components.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/ui/signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      padding: const EdgeInsets.all(10.0),
      child: AdaptiveColumn(
        children: <AdaptiveContainer>[
          AdaptiveContainer(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            columnSpan: 12,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: const AssetImage('images/imageWelcome.png'),
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  Text(
                    'Bienvenido!',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF2a195d),
                      fontWeight: FontWeight.bold,
                      fontSize: width <= 300
                          ? 40
                          : width <= 360
                              ? 50
                              : 56,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Soy Octo, tu nuevo consultor contable.',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  buildContinuarButton(context),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget buildContinuarButton(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            backgroundColor: const Color(0xff5E35B1),
            elevation: 10,
            shadowColor: const Color(0xff2A195D),
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 75.0),
          ),
          child: Text(
            'Continuar',
            style: GoogleFonts.poppins(
              color: Theme.of(context).scaffoldBackgroundColor,
              fontWeight: FontWeight.w700,
              fontSize: width <= 360 ? 26 : 32,
            ),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
            // Navego a la siguiente pantalla
          },
        ),
      ),
    );
  }
}
