import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/colors.dart';

class EntradaContrasena extends StatefulWidget {
  final String etiqueta;
  final TextEditingController controlador;
  final VoidCallback onComplete;
  final Function(dynamic) onChanged;
  final bool hayValor;
  final dynamic error;

  const EntradaContrasena(
      {required this.controlador,
      required this.onComplete,
      required this.onChanged,
      required this.hayValor,
      required this.error,
      required this.etiqueta,
      super.key});

  @override
  State<EntradaContrasena> createState() => _EntradaContrasenaState();
}

class _EntradaContrasenaState extends State<EntradaContrasena> {
  bool contraNoVisible = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 30.0.h),
        child: TextField(
          obscureText: contraNoVisible,
          keyboardType: TextInputType.emailAddress,
          controller: widget.controlador,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onComplete,
          style: GoogleFonts.inter(
            color: entradaUsuarioColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            errorText: widget.error,
            label: Container(
              margin: EdgeInsets.only(top: 3.0.h),
              child: Text(
                widget.etiqueta,
                textAlign: TextAlign.justify,
              ),
            ),
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              color: entradaUsuarioColor,
              size: 28.sp,
            ),
            suffixIcon: IconButton(
              splashRadius: 1.0,
              onPressed: () {
                setState(() {
                  contraNoVisible = !contraNoVisible; //change boolean value
                });
              },
              icon: Icon(
                contraNoVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: entradaUsuarioColor,
              ),
            ),
          ),
        ));
  }
}
