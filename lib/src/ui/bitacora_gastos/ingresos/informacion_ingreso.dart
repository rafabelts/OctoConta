import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/ingreso_item.dart';
import 'package:octoconta_final/src/services/base_datos_ingresos.dart';

class InformacionIngresos extends ChangeNotifier {
  List<IngresoItem> listaIngresos = [];

  List<IngresoItem> obtenerListaIngresos() {
    return listaIngresos;
  }

  final db = BaseDatosDeIngresos();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    if (db.leerDatosIngresos().isNotEmpty) {
      listaIngresos = db.leerDatosIngresos();
    }
  }

  double obtenerTotalIngresos() {
    double total = 0.0;
    for (IngresoItem monto in listaIngresos) {
      total += monto.monto;
    }
    return total == 0 ? 0 : total;
  }

// Agregar ingreso
  void addNuevoIngreso(IngresoItem nuevoIngreso) {
    listaIngresos.add(nuevoIngreso);
    notifyListeners();
    db.guardarIngresos(listaIngresos);
    db.totalDeIngresos(obtenerTotalIngresos());
  }

  // Leer total ingresos
  double prepararTotalIngresos() {
    return db.leerTotalIngresos();
  }
}
