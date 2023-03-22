/* 
  Realizamos el calculo del interes de un prestamo,
  se pasan como argumentos, el context de la pantalla de donde 
  se llamara para poder mostrar el alert dialog
*/

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../models/pagina_principal/alert_dialogs.dart';

class CalculoInteresPrestamo {
  final TextEditingController monto;
  final TextEditingController interes;
  final TextEditingController meses;

  final BuildContext contexto;
  final Function(bool) validarNumeroMonto;
  final Function(bool) validarNumeroInteres;
  final Function(bool) validarNumeroMeses;

  void onChanged() {
    if (monto.text.isNotEmpty) {
      validarNumeroMonto(true);
    }
    if (interes.text.isNotEmpty) {
      validarNumeroInteres(true);
    }
    if (meses.text.isNotEmpty) {
      validarNumeroMeses(true);
    }
  }

  void onSubmittedMonto() {
    if (monto.text.isEmpty) {
      validarNumeroMonto(false);
    } else {
      validarNumeroMonto(true);
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteInteres() {
    if (interes.text.isEmpty) {
      validarNumeroInteres(false);
    } else {
      validarNumeroInteres(true);

      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteMeses() {
    if (interes.text.isEmpty) {
      validarNumeroInteres(false);
    } else {
      validarNumeroInteres(true);
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();

      mostrarResultado();
    }
  }

  String calculoInteres() {
    double? montoUsuario = double.tryParse(monto.text.replaceAll(',', ''));

    double? interesUsuario = double.tryParse(interes.text.replaceAll(',', ''));
    double interesMensual = (interesUsuario! / 100) / 12;

    double? mesesUsuario = -(double.tryParse(meses.text.replaceAll(',', '')))!;

    double pagoInteresMensual = montoUsuario! /
        ((1 - (pow((1 + interesMensual), mesesUsuario))) / interesMensual);

    return '\$${NumberFormat("#,##0.00").format(pagoInteresMensual)} MXN';
  }

  void mostrarResultado() {
    if (monto.text.isEmpty) {
      validarNumeroMonto(false);
    } else if (interes.text.isEmpty) {
      validarNumeroInteres(false);
    } else if (meses.text.isEmpty) {
      validarNumeroMeses(false);
    } else {
      validarNumeroMonto(true);
      validarNumeroInteres(true);
      validarNumeroMeses(true);
      try {
        calculoInteres();
        showDialog(
          context: contexto,
          builder: (context) => OctoAlertDialogs(
            contenidoDelDialog: Column(
              children: <Widget>[
                Text(
                  "Su pago mensual será de:",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0.h),
                  child: Text(
                    calculoInteres(),
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
        validarNumeroMonto(false);
        validarNumeroInteres(false);
        validarNumeroMeses(false);
      }
    }
  }

  void limpiar() {
    validarNumeroMonto(true);
    validarNumeroInteres(true);
    validarNumeroMeses(true);
    monto.clear();
    interes.clear();
    meses.clear();
  }

  CalculoInteresPrestamo({
    required this.validarNumeroMonto,
    required this.validarNumeroInteres,
    required this.validarNumeroMeses,
    required this.contexto,
    required this.monto,
    required this.interes,
    required this.meses,
  });
}
