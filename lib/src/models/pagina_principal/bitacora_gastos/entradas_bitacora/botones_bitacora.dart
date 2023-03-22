import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';

class BotonesBitacora extends StatelessWidget {
  final VoidCallback agregar;
  final VoidCallback? cancelar;
  const BotonesBitacora({required this.agregar, this.cancelar, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: TextButton(
            onPressed: cancelar,
            child: Text(
              'Cancelar',
              style: GoogleFonts.inter(
                color: botonSecundarioColor,
                fontSize: 23.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: agregar,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r)),
            backgroundColor: botonPrimarioColor,
            padding: EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 12.0.w),
          ),
          child: Text(
            "Agregar",
            style: GoogleFonts.inter(
              color: fondoColor,
              fontSize: 23.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
