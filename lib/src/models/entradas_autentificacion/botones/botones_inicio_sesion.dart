import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class LogInButtons extends StatelessWidget {
  final VoidCallback iniciarSesion;
  final VoidCallback olvidoContra;

  const LogInButtons(
      {required this.iniciarSesion, required this.olvidoContra, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25.0.h),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: iniciarSesion,
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
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: SizedBox(
              // width: MediaQuery.of(context).size.width * 0.78,
              child: TextButton(
                onPressed: olvidoContra,
                child: Text(
                  'Haz olvidado tu contraseña?',
                  style: GoogleFonts.inter(
                    color: botonPrimarioColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.5.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  // maxLines: 2,
                  textAlign: TextAlign.center,
                ),
              ),
            ))
      ],
    );
  }
}
