/* 
  Realizamos el calculo del interes de una tarjeta de credito,
  se pasan como argumentos, el context de la pantalla de donde 
  se llamara para poder mostrar el alert dialog
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../models/pagina_principal/alert_dialogs.dart';

class CalculoInteresTarjeta {
  final TextEditingController deuda;
  final TextEditingController interes;
  final BuildContext contexto;
  final Function(bool) validarNumeroDeuda;
  final Function(bool) validarNumeroInteres;

  void onChanged() {
    if (deuda.text.isNotEmpty) {
      validarNumeroDeuda(true);
    }
    if (deuda.text.isNotEmpty) {
      validarNumeroInteres(true);
    }
  }

  void onCompleteDeuda() {
    if (deuda.text.isEmpty) {
      validarNumeroDeuda(false);
    } else {
      validarNumeroDeuda(true);
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteInteres() {
    if (interes.text.isEmpty) {
      validarNumeroInteres(false);
    } else {
      validarNumeroDeuda(true);
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();

      mostrarResultado();
    }
  }

  String calculoIntereses() {
    double? deudaUsuario = double.tryParse(deuda.text.replaceAll(',', ''));
    double deudaDiaria = deudaUsuario! / 30;

    double? interesUsuario = double.tryParse(interes.text.replaceAll(',', ''));
    double interesMensual = (interesUsuario! / 100) / 12;

    double interesOrdinario = deudaDiaria * interesMensual;
    double interesOrdinarioIVA =
        (interesOrdinario + (interesOrdinario * .16)) * 30;

    return '\$${NumberFormat("#,##0.00").format(interesOrdinarioIVA)} MXN';
  }

  void mostrarResultado() {
    if (deuda.text.isEmpty) {
      validarNumeroDeuda(false);
    } else if (interes.text.isEmpty) {
      validarNumeroInteres(false);
    } else {
      validarNumeroDeuda(true);
      validarNumeroInteres(true);
      try {
        calculoIntereses();
        showDialog(
          context: contexto,
          builder: (context) => OctoAlertDialogs(
            contenidoDelDialog: Column(
              children: <Widget>[
                Text(
                  "Su interés mensual será de:",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0.h),
                  child: Text(
                    calculoIntereses(),
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
        validarNumeroDeuda(false);
        validarNumeroInteres(false);
      }
    }
  }

  void limpiar() {
    validarNumeroDeuda(true);
    validarNumeroInteres(true);
    deuda.clear();
    interes.clear();
  }

  CalculoInteresTarjeta({
    required this.validarNumeroDeuda,
    required this.validarNumeroInteres,
    required this.contexto,
    required this.deuda,
    required this.interes,
  });
}
