import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/colors.dart';

class BotonesCalculos extends StatelessWidget {
  final VoidCallback calcular;
  final VoidCallback? limpiar;
  const BotonesCalculos({required this.calcular, this.limpiar, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: TextButton(
                  onPressed: limpiar,
                  child: Text(
                    'Borrar',
                    style: GoogleFonts.inter(
                      color: botonSecundarioColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: calcular,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0.r)),
                  backgroundColor: botonPrimarioColor,
                  padding:
                      EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 12.0.w),
                ),
                child: Text(
                  "Calcular",
                  style: GoogleFonts.inter(
                    color: fondoColor,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
