import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class BotonesSettings extends StatelessWidget {
  final String? accion;
  final String? cancelar;
  final VoidCallback calcular;
  final VoidCallback? limpiar;
  final double? largo;
  final double? largo1;
  const BotonesSettings(
      {required this.calcular,
      this.limpiar,
      this.accion,
      this.cancelar,
      this.largo,
      this.largo1,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(
          top: height <= 640
              ? height * (largo1 ?? 0.2)
              : height * (largo ?? 0.35)),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: calcular,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0.r)),
                backgroundColor: botonPrimarioColor,
                padding:
                    EdgeInsets.symmetric(vertical: 6.0.h, horizontal: 12.0.w),
              ),
              child: Text(
                accion!,
                style: GoogleFonts.inter(
                  color: fondoColor,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.w),
            child: TextButton(
              onPressed: limpiar,
              child: Text(
                cancelar!,
                style: GoogleFonts.inter(
                  color: botonSecundarioColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
