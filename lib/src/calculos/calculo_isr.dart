/* 
  Realizamos el calculo de ISR, se pasan como argumentos, 
  el context de la pantalla de donde se llamara para poder mostrar 
  el alert dialog
*/

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../models/pagina_principal/alert_dialogs.dart';

class CalculoISR {
  final TextEditingController sueldo;
  final BuildContext contexto;
  final Function(bool) validarNumeroSueldo;
  final void Function(String nuevoPeriodo) actualizarPeriodo;

  String periodoActual;
  List<String> periodosPago = ['Mensual', 'Quincenal', 'Diario'];

  void onChanged() {
    if (sueldo.text.isNotEmpty) {
      validarNumeroSueldo(true);
    }
  }

  /* 
    Realizo el calculo del subsidio del salario dividiendolo en retencion mensual, quincenal
    y diaria.
  */
  double? calculoSubsidio(sueldoUsuario) {
    Map<double, double> calculoSubsidioMensual = {};
    if (sueldoUsuario! >= 0.01 && sueldoUsuario <= 1768.96) {
      calculoSubsidioMensual[sueldoUsuario] = 407.02;
    } else if (sueldoUsuario >= 1768.97 && sueldoUsuario <= 2653.38) {
      calculoSubsidioMensual[sueldoUsuario] = 406.83;
    } else if (sueldoUsuario >= 2653.39 && sueldoUsuario <= 3472.84) {
      calculoSubsidioMensual[sueldoUsuario] = 406.62;
    } else if (sueldoUsuario >= 3472.85 && sueldoUsuario <= 3537.87) {
      calculoSubsidioMensual[sueldoUsuario] = 392.77;
    } else if (sueldoUsuario >= 3537.88 && sueldoUsuario <= 4446.15) {
      calculoSubsidioMensual[sueldoUsuario] = 382.46;
    } else if (sueldoUsuario >= 4446.16 && sueldoUsuario <= 4717.18) {
      calculoSubsidioMensual[sueldoUsuario] = 354.23;
    } else if (sueldoUsuario >= 4717.19 && sueldoUsuario <= 5335.42) {
      calculoSubsidioMensual[sueldoUsuario] = 324.87;
    } else if (sueldoUsuario >= 5335.43 && sueldoUsuario <= 6224.67) {
      calculoSubsidioMensual[sueldoUsuario] = 294.63;
    } else if (sueldoUsuario >= 6224.68 && sueldoUsuario <= 7113.90) {
      calculoSubsidioMensual[sueldoUsuario] = 253.54;
    } else if (sueldoUsuario >= 7113.91 && sueldoUsuario <= 7382.33) {
      calculoSubsidioMensual[sueldoUsuario] = 217.61;
    } else {
      calculoSubsidioMensual[sueldoUsuario] = 0;
    }
    double? subsidioMensual = calculoSubsidioMensual[sueldoUsuario];

    Map<double, double> calculoSubsidioQuincenal = {};
    if (sueldoUsuario >= 0.01 && sueldoUsuario <= 872.85) {
      calculoSubsidioQuincenal[sueldoUsuario] = 200.85;
    } else if (sueldoUsuario >= 872.86 && sueldoUsuario <= 1309.20) {
      calculoSubsidioQuincenal[sueldoUsuario] = 200.70;
    } else if (sueldoUsuario >= 1309.21 && sueldoUsuario <= 1713.60) {
      calculoSubsidioQuincenal[sueldoUsuario] = 200.70;
    } else if (sueldoUsuario >= 1713.61 && sueldoUsuario <= 1745.70) {
      calculoSubsidioQuincenal[sueldoUsuario] = 193.80;
    } else if (sueldoUsuario >= 1745.71 && sueldoUsuario <= 2193.75) {
      calculoSubsidioQuincenal[sueldoUsuario] = 188.70;
    } else if (sueldoUsuario >= 2193.76 && sueldoUsuario <= 2327.55) {
      calculoSubsidioQuincenal[sueldoUsuario] = 174.75;
    } else if (sueldoUsuario >= 2327.56 && sueldoUsuario <= 2632.65) {
      calculoSubsidioQuincenal[sueldoUsuario] = 160.35;
    } else if (sueldoUsuario >= 2632.66 && sueldoUsuario <= 3071.40) {
      calculoSubsidioQuincenal[sueldoUsuario] = 145.35;
    } else if (sueldoUsuario >= 3071.41 && sueldoUsuario <= 3510.15) {
      calculoSubsidioQuincenal[sueldoUsuario] = 125.10;
    } else if (sueldoUsuario >= 3510.16 && sueldoUsuario <= 3642.60) {
      calculoSubsidioQuincenal[sueldoUsuario] = 107.40;
    } else {
      calculoSubsidioQuincenal[sueldoUsuario] = 0;
    }
    double? subsidioQuincenal = calculoSubsidioQuincenal[sueldoUsuario];

    Map<double, double> calculoSubsidioDiario = {};
    if (sueldoUsuario >= 0.01 && sueldoUsuario <= 58.19) {
      calculoSubsidioDiario[sueldoUsuario] = 13.39;
    } else if (sueldoUsuario >= 58.20 && sueldoUsuario <= 87.28) {
      calculoSubsidioDiario[sueldoUsuario] = 13.38;
    } else if (sueldoUsuario >= 87.29 && sueldoUsuario <= 114.24) {
      calculoSubsidioDiario[sueldoUsuario] = 13.38;
    } else if (sueldoUsuario >= 114.25 && sueldoUsuario <= 116.38) {
      calculoSubsidioDiario[sueldoUsuario] = 12.92;
    } else if (sueldoUsuario >= 116.39 && sueldoUsuario <= 146.25) {
      calculoSubsidioDiario[sueldoUsuario] = 12.58;
    } else if (sueldoUsuario >= 146.26 && sueldoUsuario <= 155.17) {
      calculoSubsidioDiario[sueldoUsuario] = 11.65;
    } else if (sueldoUsuario >= 155.18 && sueldoUsuario <= 175.51) {
      calculoSubsidioDiario[sueldoUsuario] = 10.69;
    } else if (sueldoUsuario >= 175.52 && sueldoUsuario <= 204.76) {
      calculoSubsidioDiario[sueldoUsuario] = 9.69;
    } else if (sueldoUsuario >= 204.77 && sueldoUsuario <= 234.01) {
      calculoSubsidioDiario[sueldoUsuario] = 8.34;
    } else if (sueldoUsuario >= 234.02 && sueldoUsuario <= 242.84) {
      calculoSubsidioDiario[sueldoUsuario] = 7.16;
    } else {
      calculoSubsidioDiario[sueldoUsuario] = 0;
    }
    double? subsidioDiario = calculoSubsidioDiario[sueldoUsuario];

    Map<String, double> subsidioSeleccionado = {
      'Mensual': subsidioMensual!,
      'Quincenal': subsidioQuincenal!,
      'Diario': subsidioDiario!,
    };

    return subsidioSeleccionado[periodoActual];
    // double subsidioPeriodo = subsidioSeleccionado['']

    // return NumberFormat("#,##0.00").format(subsidioSeleccionado[periodoActual]);
  }

  /* 
    Realizo el calculo de la retencion del salario dividiendolo en retencion mensual, quincenal
    y diaria.
  */
  double? calculoRetencion(sueldoUsuario) {
    double excedenteLimiteInferior;
    double isrMarginal;
    double cuotaFija;
    double impuestoPrevio;

    double subsidio = calculoSubsidio(sueldoUsuario)!;

    Map<double, double> calculoRetencionMensual = {};
    if (sueldoUsuario >= 0.01 && sueldoUsuario <= 746.04) {
      excedenteLimiteInferior = sueldoUsuario - 0.01;
      isrMarginal = excedenteLimiteInferior * 0.0192;
      cuotaFija = 0.00;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 746.05 && sueldoUsuario <= 6332.05) {
      excedenteLimiteInferior = sueldoUsuario - 746.05;
      isrMarginal = excedenteLimiteInferior * 0.064;
      cuotaFija = 14.32;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 6332.06 && sueldoUsuario <= 11128.01) {
      excedenteLimiteInferior = sueldoUsuario - 6332.06;
      isrMarginal = excedenteLimiteInferior * 0.1088;
      cuotaFija = 371.83;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 11128.02 && sueldoUsuario <= 12935.82) {
      excedenteLimiteInferior = sueldoUsuario - 11128.02;
      isrMarginal = excedenteLimiteInferior * 0.16;
      cuotaFija = 893.63;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 12935.83 && sueldoUsuario <= 15487.71) {
      excedenteLimiteInferior = sueldoUsuario - 12935.83;
      isrMarginal = excedenteLimiteInferior * 0.1792;
      cuotaFija = 1182.88;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 15487.72 && sueldoUsuario <= 31236.49) {
      excedenteLimiteInferior = sueldoUsuario - 15487.72;
      isrMarginal = excedenteLimiteInferior * 0.2136;
      cuotaFija = 1640.18;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 31236.50 && sueldoUsuario <= 49233.00) {
      excedenteLimiteInferior = sueldoUsuario - 31236.50;
      isrMarginal = excedenteLimiteInferior * 0.2352;
      cuotaFija = 5004.12;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 49233.01 && sueldoUsuario <= 93993.90) {
      excedenteLimiteInferior = sueldoUsuario - 49233.01;
      isrMarginal = excedenteLimiteInferior * .3;
      cuotaFija = 9236.89;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 93993.91 && sueldoUsuario <= 125325.20) {
      excedenteLimiteInferior = sueldoUsuario - 93993.91;
      isrMarginal = excedenteLimiteInferior * 0.32;
      cuotaFija = 22665.17;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 125325.21 && sueldoUsuario <= 375975.61) {
      excedenteLimiteInferior = sueldoUsuario - 125325.21;
      isrMarginal = excedenteLimiteInferior * 0.34;
      cuotaFija = 32691.18;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else {
      excedenteLimiteInferior = sueldoUsuario - 375975.62;
      isrMarginal = excedenteLimiteInferior * 0.35;
      cuotaFija = 117912.32;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionMensual[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    }
    double? retencionMensual = calculoRetencionMensual[sueldoUsuario];

    Map<double, double> calculoRetencionQuincenal = {};
    if (sueldoUsuario >= 0.01 && sueldoUsuario <= 368.10) {
      excedenteLimiteInferior = sueldoUsuario - 0.01;
      isrMarginal = excedenteLimiteInferior * 0.0192;
      cuotaFija = 0.00;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 368.11 && sueldoUsuario <= 3124.35) {
      excedenteLimiteInferior = sueldoUsuario - 368.11;
      isrMarginal = excedenteLimiteInferior * 0.064;
      cuotaFija = 7.05;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 3124.36 && sueldoUsuario <= 5490.75) {
      excedenteLimiteInferior = sueldoUsuario - 3124.36;
      isrMarginal = excedenteLimiteInferior * 0.1088;
      cuotaFija = 183.45;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 5490.76 && sueldoUsuario <= 6382.80) {
      excedenteLimiteInferior = sueldoUsuario - 5490.76;
      isrMarginal = excedenteLimiteInferior * 0.16;
      cuotaFija = 441.00;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 6382.81 && sueldoUsuario <= 7641.90) {
      excedenteLimiteInferior = sueldoUsuario - 6382.81;
      isrMarginal = excedenteLimiteInferior * 0.1792;
      cuotaFija = 583.65;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 7641.91 && sueldoUsuario <= 15412.80) {
      excedenteLimiteInferior = sueldoUsuario - 7641.91;
      isrMarginal = excedenteLimiteInferior * 0.2136;
      cuotaFija = 809.25;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 15412.80 && sueldoUsuario <= 24292.65) {
      excedenteLimiteInferior = sueldoUsuario - 15412.80;
      isrMarginal = excedenteLimiteInferior * 0.2352;
      cuotaFija = 2469.15;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 24292.66 && sueldoUsuario <= 46378.50) {
      excedenteLimiteInferior = sueldoUsuario - 24292.66;
      isrMarginal = excedenteLimiteInferior * .3;
      cuotaFija = 4557.75;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 46378.51 && sueldoUsuario <= 61838.10) {
      excedenteLimiteInferior = sueldoUsuario - 46378.51;
      isrMarginal = excedenteLimiteInferior * 0.32;
      cuotaFija = 11183.40;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 61838.11 && sueldoUsuario <= 185514.30) {
      excedenteLimiteInferior = sueldoUsuario - 61838.11;
      isrMarginal = excedenteLimiteInferior * 0.34;
      cuotaFija = 16130.55;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else {
      excedenteLimiteInferior = sueldoUsuario - 185514.31;
      isrMarginal = excedenteLimiteInferior * 0.35;
      cuotaFija = 58180.35;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionQuincenal[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    }
    double? retencionQuincenal = calculoRetencionQuincenal[sueldoUsuario];

    Map<double, double> calculoRetencionDiaria = {};
    if (sueldoUsuario >= 0.01 && sueldoUsuario <= 24.54) {
      excedenteLimiteInferior = sueldoUsuario - 0.01;
      isrMarginal = excedenteLimiteInferior * 0.0192;
      cuotaFija = 0.00;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 24.54 && sueldoUsuario <= 208.29) {
      excedenteLimiteInferior = sueldoUsuario - 24.54;
      isrMarginal = excedenteLimiteInferior * 0.064;
      cuotaFija = 0.47;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 208.30 && sueldoUsuario <= 366.05) {
      excedenteLimiteInferior = sueldoUsuario - 208.30;
      isrMarginal = excedenteLimiteInferior * 0.1088;
      cuotaFija = 12.23;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 366.06 && sueldoUsuario <= 425.52) {
      excedenteLimiteInferior = sueldoUsuario - 366.06;
      isrMarginal = excedenteLimiteInferior * 0.16;
      cuotaFija = 29.40;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 425.53 && sueldoUsuario <= 509.46) {
      excedenteLimiteInferior = sueldoUsuario - 425.53;
      isrMarginal = excedenteLimiteInferior * 0.1792;
      cuotaFija = 38.91;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 509.47 && sueldoUsuario <= 1027.52) {
      excedenteLimiteInferior = sueldoUsuario - 509.47;
      isrMarginal = excedenteLimiteInferior * 0.2136;
      cuotaFija = 53.95;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 1027.53 && sueldoUsuario <= 1619.51) {
      excedenteLimiteInferior = sueldoUsuario - 1027.53;
      isrMarginal = excedenteLimiteInferior * 0.2352;
      cuotaFija = 164.61;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 1619.52 && sueldoUsuario <= 3091.90) {
      excedenteLimiteInferior = sueldoUsuario - 1619.52;
      isrMarginal = excedenteLimiteInferior * .3;
      cuotaFija = 303.85;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 3091.91 && sueldoUsuario <= 4122.54) {
      excedenteLimiteInferior = sueldoUsuario - 3091.91;
      isrMarginal = excedenteLimiteInferior * 0.32;
      cuotaFija = 745.56;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else if (sueldoUsuario >= 4122.55 && sueldoUsuario <= 12367.62) {
      excedenteLimiteInferior = sueldoUsuario - 4122.55;
      isrMarginal = excedenteLimiteInferior * 0.34;
      cuotaFija = 1075.37;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    } else {
      excedenteLimiteInferior = sueldoUsuario - 12367.63;
      isrMarginal = excedenteLimiteInferior * 0.35;
      cuotaFija = 3878.69;
      impuestoPrevio = isrMarginal + cuotaFija;
      calculoRetencionDiaria[sueldoUsuario] = impuestoPrevio - subsidio;
      //
    }
    double? retencionDiaria = calculoRetencionDiaria[sueldoUsuario];

    Map<String, double> retenciones = {
      'Mensual': retencionMensual!,
      'Quincenal': retencionQuincenal!,
      'Diario': retencionDiaria!,
    };

    return retenciones[periodoActual];
  }

  List<dynamic> calculoIsr() {
    double? sueldoUsuario = double.tryParse(sueldo.text.replaceAll(',', ''));
    double retencionUsuario = calculoRetencion(sueldoUsuario)!;
    bool aFavor = false;

    if (retencionUsuario < 0) {
      double isrUsuario = retencionUsuario * -1;
      aFavor = true;
      return [aFavor, '\$${NumberFormat("#,##0.00").format(isrUsuario)} MXN'];
    } else {
      double isrUsuario = retencionUsuario;
      aFavor = false;
      return [aFavor, '\$${NumberFormat("#,##0.00").format(isrUsuario)} MXN'];
    }
  }

  void mostrarResultado() {
    if (sueldo.text.isEmpty) {
      validarNumeroSueldo(false);
    } else {
      validarNumeroSueldo(true);
      try {
        FocusManager.instance.primaryFocus!.unfocus();
        FocusScope.of(contexto).unfocus();
        showDialog(
          context: contexto,
          builder: (context) => OctoAlertDialogs(
            contenidoDelDialog: Column(
              children: <Widget>[
                Text(
                  'Su ISR ${calculoIsr()[0] == true ? 'a favor' : 'a retener'} será de:',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0.h),
                  child: Text(
                    calculoIsr()[1],
                    style: GoogleFonts.inter(
                      color: botonSecundarioColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.sp,
                    ),
                  ),
                ),
              ],
            ),
            // Column(
            //   children: [
            //     Text(calculoIsr()[1] == true ? 'a favor' : 'a retener'),
            //     Text(calculoIsr()[0]),
            //   ],
            // ),
          ),
        );
      } catch (e) {
        validarNumeroSueldo(false);
      }
    }
  }

  void onComplete() {
    if (sueldo.text.isEmpty) {
      validarNumeroSueldo(false);
    } else {
      validarNumeroSueldo(true);

      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  void limpiar() {
    validarNumeroSueldo(true);
    sueldo.clear();
  }

  CalculoISR(
      {required this.validarNumeroSueldo,
      required this.contexto,
      required this.sueldo,
      required this.actualizarPeriodo,
      required this.periodoActual});
}
