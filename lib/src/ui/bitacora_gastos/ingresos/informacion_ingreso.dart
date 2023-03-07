import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/ingreso_item.dart';
import 'package:octoconta_final/src/services/base_datos_gastos.dart';

class InformacionIngresos extends ChangeNotifier {
  List<IngresoItem> listaIngresos = [];

  List<IngresoItem> obtenerListaIngresos() {
    return listaIngresos;
  }

  final db = BaseDatosDeGastos();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    if (db.leerDatosIngresos().isNotEmpty) {
      listaIngresos = db.leerDatosIngresos();
    }
  }

  void addNuevoIngreso(IngresoItem nuevoIngreso) {
    listaIngresos.add(nuevoIngreso);
    notifyListeners();
    db.guardarIngresos(listaIngresos);
  }

  double obtenerTotalIngresos() {
    double total = 0.0;
    for (IngresoItem monto in listaIngresos) {
      total += monto.monto;
    }
    return total == 0 ? 0 : total;
  }
}
