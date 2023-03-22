/* 
  Realizamos el calculo de prima vacacional, se pasan como argumentos, 
  el context de la pantalla de donde se llamara para poder mostrar 
  el alert dialog, en este se convierte el periodo de pago del usuario
  al salario diario y se busca el dia de vacaciones que tendra de acuerdo
  al tiempo trabajado. 
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../models/pagina_principal/alert_dialogs.dart';

class CalculoPrimaVacacional {
  final TextEditingController yearLlegada;
  final TextEditingController sueldo;
  final BuildContext contexto;
  final void Function(String nuevoPeriodo) actualizarPeriodo;
  final void Function(bool) validarNumeroYear;
  final void Function(bool) validarNumeroSueldo;

  String periodoActual;

  List<String> periodosPago = ['Anual', 'Mensual', 'Semanal', 'Diario'];

  onChanged() {
    if (yearLlegada.text.isNotEmpty) {
      validarNumeroYear(true);
    }
    if (sueldo.text.isNotEmpty) {
      validarNumeroSueldo(true);
    }
  }

  void onCompleteYear() {
    if (yearLlegada.text.isEmpty) {
      validarNumeroYear(false);
    } else {
      validarNumeroYear(true);
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteSueldo() {
    if (sueldo.text.isEmpty) {
      validarNumeroSueldo(false);
    } else {
      validarNumeroSueldo(true);
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();

      mostrarResultado();
    }
  }

  List<String> calculoPrimaVacacional() {
    double? sueldoUsuario = double.tryParse(sueldo.text.replaceAll(',', ''));
    double? yearUsuario = double.tryParse(yearLlegada.text.replaceAll(',', ''));

    Map<String, double> calculoSalarioPeriodo = {
      'Anual': (sueldoUsuario! / 360),
      'Mensual': (sueldoUsuario / 30),
      'Semanal': (sueldoUsuario / 7),
      'Diario': sueldoUsuario,
    };
    double? salarioConvertido = calculoSalarioPeriodo[periodoActual];

    int yearActual = DateTime.now().year;
    double tiempoTrabajando = yearActual - yearUsuario!;

    Map<int, int> diasVacaciones = {};
    for (int i = 1; i <= 36; i++) {
      if (i <= 5) {
        diasVacaciones[i] = 10 + (i * 2);
      } else if (i >= 6 && i <= 10) {
        diasVacaciones[i] = 22;
      } else if (i >= 11 && i <= 15) {
        diasVacaciones[i] = 24;
      } else if (i >= 16 && i <= 20) {
        diasVacaciones[i] = 26;
      } else if (i >= 11 && i <= 15) {
        diasVacaciones[i] = 28;
      } else if (i >= 26 && i <= 30) {
        diasVacaciones[i] = 30;
      } else if (i >= 31 && i <= 35) {
        diasVacaciones[i] = 32;
      } else {
        diasVacaciones[i] = 0;
      }
    }

    int? diasVacacionesUsuario = diasVacaciones[tiempoTrabajando];

    try {
      double primaVacacional =
          (salarioConvertido! * diasVacacionesUsuario!) * 0.25;
      return [
        '\$${NumberFormat("#,##0.00").format(primaVacacional)} MXN',
        NumberFormat("#,##0.00").format(diasVacacionesUsuario),
      ];
    } catch (e) {
      return [
        'No aplica',
        'No aplica',
      ];
    }
  }

  void mostrarResultado() {
    if (yearLlegada.text.isEmpty) {
      validarNumeroYear(false);
    } else if (sueldo.text.isEmpty) {
      validarNumeroSueldo(false);
    } else {
      print(periodoActual);
      showDialog(
        context: contexto,
        builder: (context) => OctoAlertDialogs(
          contenidoDelDialog: Column(
            children: <Widget>[
              Text(
                'Prima vacacional total:',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0.h),
                child: Text(
                  calculoPrimaVacacional()[0],
                  style: GoogleFonts.inter(
                    color: botonSecundarioColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 30.sp,
                  ),
                ),
              ),
              Text(
                'Días de vacaciones:',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0.h),
                child: Text(
                  calculoPrimaVacacional()[1],
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
    }
  }

  void limpiar() {
    validarNumeroYear(true);
    validarNumeroSueldo(true);
    FocusScope.of(contexto).unfocus();

    yearLlegada.clear();
    sueldo.clear();
  }

  CalculoPrimaVacacional({
    required this.contexto,
    required this.yearLlegada,
    required this.sueldo,
    required this.validarNumeroYear,
    required this.validarNumeroSueldo,
    required this.actualizarPeriodo,
    required this.periodoActual,
  });
}
