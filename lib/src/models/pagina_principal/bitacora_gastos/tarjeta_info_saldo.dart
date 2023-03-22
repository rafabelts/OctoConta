import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';

/*
  Se muestra el total del saldo en la pagina principal, de igual 
  forma se mostrara el total gastado y el de ingresos en la pantalla
  de finanzas.
 */

class TarjetaInfoSaldo extends StatelessWidget {
  final String opcion;
  final double total;
  const TarjetaInfoSaldo(
      {required this.opcion, required this.total, super.key});

  @override
  Widget build(BuildContext context) {
    final decoracion = BoxDecoration(
      borderRadius: BorderRadius.circular(20.0),
      gradient: LinearGradient(
        begin: Alignment(-0.400.w, -0.400.h),
        end: Alignment(-1.108.w, 2.80.h),
        colors: <Color>[
          primario,
          const Color.fromARGB(211, 111, 96, 150)
        ], //2a195d  //2a1861
        stops: const <double>[0, 1.0],
      ),
    );
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height <= 640 ? 250.h : 200.h,
      decoration: decoracion,
      padding:
          EdgeInsets.only(top: 25.h, bottom: 25.h, left: 25.w, right: 25.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$opcion:',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 22.h),
              child: SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Text(
                        '\$${NumberFormat("#,##0.00", "en_US").format(total >= 0 ? total : total * -1)}',
                        style: GoogleFonts.inter(
                          color: total >= 0 ? fondoColor : colorError,
                          fontWeight: FontWeight.w600,
                          fontSize: 46.sp,
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
