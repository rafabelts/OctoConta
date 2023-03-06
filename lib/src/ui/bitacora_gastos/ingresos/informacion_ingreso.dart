import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/ingreso_item.dart';

class InformacionIngresos extends ChangeNotifier {
  List<IngresoItem> listaIngresos = [];

  List<IngresoItem> obtenerListaIngresos() {
    return listaIngresos;
  }

  void addNuevoIngreso(IngresoItem nuevoIngreso) {
    listaIngresos.add(nuevoIngreso);
    notifyListeners();
  }

  double obtenerTotalIngresos() {
    double total = 0.0;
    for (IngresoItem monto in listaIngresos) {
      total += monto.monto;
    }
    return total == 0 ? 0 : total;
  }
}
