import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class BotonesSettings extends StatelessWidget {
  final String? accion;
  final VoidCallback funcion;
  final double? largo;
  final double? largo1;
  const BotonesSettings(
      {required this.funcion, this.accion, this.largo, this.largo1, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: funcion,
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
        ],
      ),
    );
  }
}
