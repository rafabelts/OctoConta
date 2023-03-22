import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constants/colors.dart';
import '../../../ui/login/log_in_screen.dart';

class SignUpButtons extends StatelessWidget {
  final VoidCallback crearCuenta;
  const SignUpButtons({required this.crearCuenta, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      builPoliticaYAcuerdo(context),
      Padding(
        padding: EdgeInsets.only(top: 25.0.h),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: crearCuenta,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0.r)),
              backgroundColor: botonSecundarioColor,
              padding: EdgeInsets.symmetric(vertical: 13.h),
            ),
            child: Text(
              'Registrarse',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 25.sp,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: TextButton(
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LogInScreen())),
          child: Text(
            '¿Ya tiene una cuenta?, Iniciar Sesión',
            style: GoogleFonts.inter(
              color: botonPrimarioColor,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ]);
  }

  Widget builPoliticaYAcuerdo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.h, bottom: 5.h, left: 6.w, right: 6.w),
        child: RichText(
          text: TextSpan(
            text: 'Al continuar, acepta nuestro ',
            style: Theme.of(context).textTheme.titleMedium,
            children: <TextSpan>[
              TextSpan(
                  text: 'Acuerdo de Usuario',
                  style: GoogleFonts.inter(
                    color: botonPrimarioColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 19.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Al presionar manda a la pagina
                      launchUrlString(
                          'https://rafabelts.github.io/acuerdoypolitica/politicaYacuerdo/acuerdo.html');
                    }),
              TextSpan(
                text: ' y reconoce que comprende la ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextSpan(
                  text: 'Política de Privacidad.',
                  style: GoogleFonts.inter(
                    color: botonPrimarioColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 19.sp,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Al presionar manda a la pagina
                      launchUrlString(
                          'https://rafabelts.github.io/acuerdoypolitica/politicaYacuerdo/politica.html');
                    }),
            ],
          ),
          textAlign: TextAlign.justify,
        ));
  }
}
