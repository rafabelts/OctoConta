import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import '../../../../constants/colors.dart';

/*
  Creo la entrada de texto que usare en las pantallas de los
  calculos.
*/

class EntradaBitacora extends StatelessWidget {
  final TextEditingController controlador;
  final VoidCallback onComplete;
  final Function(dynamic) onChanged;
  final bool hayValor;
  const EntradaBitacora(
      {required this.controlador,
      required this.onComplete,
      required this.onChanged,
      required this.hayValor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding: EdgeInsets.only(left: 10.w, right: 10.w),
      padding: EdgeInsets.only(top: 15.h),
      child: TextField(
        controller: controlador,
        onChanged: onChanged,
        onEditingComplete: onComplete,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: botonSecundarioColor,
          fontWeight: FontWeight.w500,
          fontSize: 30.sp,
        ),
        cursorColor: primario,
        decoration: InputDecoration(
          hintText: 'Artículo',
          errorText: hayValor == true ? null : 'Por favor ingrese un valor.',
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2.0)),
          focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: Colors.red)),
          hintStyle: GoogleFonts.inter(
            color: botonSecundarioColor,
            fontWeight: FontWeight.w500,
            fontSize: 30.sp,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0.h),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: primario)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2.0, color: primario)),
        ),
      ),
    );
  }
}
