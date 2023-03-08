import 'package:flutter/material.dart';
import 'package:octoconta_final/src/services/base_datos_gastos_otros.dart';

import '../../../../../models/gasto_item.dart';

class InformacionGastosOtros extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosOtros = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosOtros() {
    return listaGastosOtros;
  }

  final db = BaseDatosDeGastosOtros();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    final datosGastos = db.leerDatosOtros();
    if (datosGastos.isNotEmpty) {
      listaGastosOtros = datosGastos;
    }
  }

  double obtenerTotalGastosOtros() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosOtros) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoOtros(GastoItem nuevoGasto) {
    listaGastosOtros.add(nuevoGasto);
    notifyListeners();
    db.guardarGastosOtros(listaGastosOtros);
    db.totalDeGastosOtros(obtenerTotalGastosOtros());
  }

  double prepararTotalGastos() {
    return db.leerTotalOtros();
  }
}
