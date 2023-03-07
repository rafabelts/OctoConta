import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';

import '../../../../../services/base_datos_gastos.dart';

class InformacionGastosAlimentos extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosAlimentos = [];
  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosAlimentos() {
    return listaGastosAlimentos;
  }

  final db = BaseDatosDeGastos();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    final datosGastos = db.leerDatosGastos();
    if (db.leerDatosGastos().isNotEmpty) {
      listaGastosAlimentos = datosGastos["Alimentos"] ?? [];
    }
  }

  double obtenerTotalGastosAlimentos() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosAlimentos) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoAlimentos(GastoItem nuevoGasto) {
    listaGastosAlimentos.add(nuevoGasto);
    notifyListeners();
    db.guardarGasto(listaGastosAlimentos);
    db.totalDeGastos(obtenerTotalGastosAlimentos());
    // db.guardarTotalGasto(obtenerTotalGastosAlimentos());
  }

  double prepararTotalGastos() {
    return db.leerTotalGastos();
  }
}
