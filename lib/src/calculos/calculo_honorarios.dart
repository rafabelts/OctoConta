/* 
  Realizamos el calculo de honorarios, se pasan como argumentos, 
  el context de la pantalla de donde se llamara para poder mostrar 
  el alert dialog
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../models/pagina_principal/alert_dialogs.dart';

class CalculoHonorarios {
  final TextEditingController importe;
  final BuildContext contexto;
  final Function(bool) validarNumeroImporte;

  void onChanged() {
    if (importe.text.isNotEmpty) {
      validarNumeroImporte(true);
    }
  }

  String calculoHonorarios() {
    double? importeUsuario = double.tryParse(importe.text.replaceAll(',', ''));

    double importeConIva = importeUsuario! + (importeUsuario * .16);

    double porcentajeImporte = importeUsuario * .10;

    double isrResico = ((importeUsuario * .16) / 3) * 2;

    double honorarios = importeConIva - porcentajeImporte - isrResico;

    return '\$${NumberFormat("#,##0.00").format(honorarios)} MXN';
  }

  void mostrarResultado() {
    if (importe.text.isEmpty) {
      validarNumeroImporte(false);
    } else {
      validarNumeroImporte(true);
      try {
        FocusManager.instance.primaryFocus!.unfocus();
        FocusScope.of(contexto).unfocus();
        showDialog(
          context: contexto,
          builder: (context) => OctoAlertDialogs(
            contenidoDelDialog: Column(
              children: <Widget>[
                Text(
                  "Su total a recibir será de:",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0.h),
                  child: Text(
                    calculoHonorarios(),
                    style: GoogleFonts.inter(
                      color: botonSecundarioColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      } catch (e) {
        validarNumeroImporte(false);
      }
    }
  }

  void limpiar() {
    validarNumeroImporte(true);
    importe.clear();
  }

  CalculoHonorarios({
    required this.validarNumeroImporte,
    required this.contexto,
    required this.importe,
  });
}
