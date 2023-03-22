import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octoconta_final/src/bitacora_gastos/agregar_ingreso/ingreso_item.dart';
import 'package:octoconta_final/src/services/informacion_bitacora.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../models/pagina_principal/bitacora_gastos/entradas_bitacora/botones_bitacora.dart';
import '../../models/pagina_principal/bitacora_gastos/entradas_bitacora/entradas_bitacora.dart';
import '../../models/pagina_principal/calculos_contables/entradas_calculos/entradas_calculos.dart';
import '../../models/pagina_principal/modal_bottom.dart';

/*
  Creo la funcionalidad que tendra la parte de agregar un gasto
  en esta se crea el contenido de un modal y se agregaran providers
  para poder manejar los estados dentro de diferentes widgets.
*/
class AgregarIngreso {
  final BuildContext contexto;
  final TextEditingController ingreso;
  final TextEditingController monto;
  final Function(bool) validarIngreso;
  final Function(bool) validarMonto;

  void onChanged() {
    if (ingreso.text.isNotEmpty) {
      validarIngreso(true);
    }
    if (monto.text.isEmpty) {
      validarMonto(true);
    }
  }

  void onCompleteIngreso() {
    if (ingreso.text.isEmpty) {
      validarIngreso(false);
    } else {
      FocusScope.of(contexto).nextFocus();
    }
  }

  void onCompleteMonto() {
    if (monto.text.isEmpty) {
      validarIngreso(false);
    } else if (ingreso.text.isEmpty) {
      validarIngreso(false);
    } else {
      FocusManager.instance.primaryFocus!.unfocus();
      FocusScope.of(contexto).unfocus();
    }
  }

  void agregarArticulo() {
    if (monto.text.isEmpty) {
      validarIngreso(false);
    } else if (ingreso.text.isEmpty) {
      validarIngreso(false);
    } else {
      double? montoIngreso = double.tryParse(monto.text.replaceAll(',', ''));
      IngresoItem nuevoIngreso = IngresoItem(
        ingreso: ingreso.text,
        monto: montoIngreso!,
      );

      Provider.of<InformacionBitacora>(contexto, listen: false)
          .agregarNuevoIngreso(nuevoIngreso);
      Navigator.pop(contexto);
    }
  }

  void cancelar() {
    ingreso.clear();
    monto.clear();
    Navigator.pop(contexto);
  }

  AgregarIngreso({
    required this.contexto,
    required this.ingreso,
    required this.monto,
    required this.validarIngreso,
    required this.validarMonto,
  });
}
