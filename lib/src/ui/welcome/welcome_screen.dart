import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../signup/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  /*
    Creacion de la pantalla de bienvenida de la
    aplicacion.
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0.h),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
                right: 15.0.w, left: 15.0.w, bottom: 15.0.h, top: 15.0.h),
            physics: const BouncingScrollPhysics(),
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
                  style: Theme.of(context).textTheme.displayLarge,
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0.h),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Text(
                        'Soy Octo, tu nuevo consultor contable.',
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    )),
                buildContinuarButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*
    Creamos el boton de continuar para poder pasar a la pantalla
    de creacion de usuario
   */
  Widget buildContinuarButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0.r)),
            backgroundColor: botonSecundarioColor,
            elevation: 10,
            shadowColor: primario,
            padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 75.0.w),
          ),
          child: Text(
            'Continuar',
            style: GoogleFonts.poppins(
              color: fondoColor,
              fontWeight: FontWeight.w700,
              fontSize: 28.sp,
            ),
          ),
          onPressed: () {
            /*
              Navegacion a la pantalla de creacion de cuenta
            */
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
        ),
      ),
    );
  }
}
