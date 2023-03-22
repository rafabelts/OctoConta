import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../../services/auth.dart';

class ContenidoDialogCerrarSesion extends StatelessWidget {
  const ContenidoDialogCerrarSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Text(
            "¿Desea cerrar sesión?",
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => Auth().cierreSesion(
                    context: context,
                    navegacionPantallasAlCerrarSesion: (_) {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0.r)),
                  backgroundColor: botonPrimarioColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 12.0.w),
                ),
                child: Text(
                  "Si, cerrar sesión",
                  style: GoogleFonts.inter(
                    color: fondoColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.w),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancelar',
                    style: GoogleFonts.inter(
                      color: colorError,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
