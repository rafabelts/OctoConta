import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

class EntradaCorreoNombre extends StatelessWidget {
  final String etiqueta;
  final IconData icono;
  final TextEditingController controlador;
  final dynamic error;
  final VoidCallback onComplete;
  final Function(dynamic) onChanged;
  final bool hayValor;
  const EntradaCorreoNombre(
      {required this.controlador,
      required this.onComplete,
      required this.onChanged,
      required this.hayValor,
      required this.error,
      required this.etiqueta,
      required this.icono,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.0.h),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        controller: controlador,
        onChanged: onChanged,
        onEditingComplete: onComplete,
        style: GoogleFonts.inter(
          color: entradaUsuarioColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          errorText: error,
          label: Container(
            margin: EdgeInsets.only(top: 3.0.h),
            child: Text(
              etiqueta,
              textAlign: TextAlign.justify,
            ),
          ),
          prefixIcon: Icon(
            icono,
            color: entradaUsuarioColor,
            size: 28.sp,
          ),
        ),
      ),
    );
  }
}
