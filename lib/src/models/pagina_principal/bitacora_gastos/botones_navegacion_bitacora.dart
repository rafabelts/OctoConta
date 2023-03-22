import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

/* 
  Creo el boton para la navegacion de pantallas de la bitacora de gastos
  agregar gasto/ingreso, ver categoria gastos o ver ingresos.
*/

class BotonNavegacionBitacora extends StatelessWidget {
  final String pantallaAIr;
  final Function() onTap;
  const BotonNavegacionBitacora(
      {required this.pantallaAIr, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.transparent,
      onTap: onTap,
      title: Text(
        pantallaAIr,
        style: GoogleFonts.inter(
          color: botonPrimarioColor,
          fontWeight: FontWeight.bold,
          fontSize: 17.sp,
        ),
        textAlign: TextAlign.justify,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 17.sp,
        color: botonPrimarioColor,
      ),
    );
  }
}
