import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class DropdownPeriodoSalario extends StatefulWidget {
  final String periodoActual;
  final List<String> periodos;
  final Function(String?) cambiarPeriodo;
  const DropdownPeriodoSalario(
      {required this.periodoActual,
      required this.periodos,
      required this.cambiarPeriodo,
      super.key});

  @override
  State<DropdownPeriodoSalario> createState() => _DropdownPeriodoSalarioState();
}

class _DropdownPeriodoSalarioState extends State<DropdownPeriodoSalario> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 4.h),
      child: DropdownButtonFormField(
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff382A62), width: 1.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xff382A62), width: 2.0),
            )),

        dropdownColor: Theme.of(context).scaffoldBackgroundColor,
        icon: Icon(
          Icons.keyboard_arrow_down,
          size: 30.sp,
          color: entradaUsuarioColor,
        ),
        //
        items: widget.periodos.map((String? periodos) {
          return DropdownMenuItem(
            value: periodos,
            child: Text(
              periodos!,
              style: GoogleFonts.inter(
                  color: entradaUsuarioColor,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      MediaQuery.of(context).size.width <= 360 ? 21.sp : 24.sp),
              textAlign: TextAlign.center,
              // fontWeight: FontWeight.w600,
            ),
          );
        }).toList(),
        onChanged: widget.cambiarPeriodo,
        value: widget.periodoActual,
      ),
    );
  }
}
