import 'package:flutter/material.dart';
import 'package:octoconta_final/src/services/base_datos_gastos.dart';

import '../../../../../models/gasto_item.dart';

class InformacionGastosOtros extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosOtros = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosOtros() {
    return listaGastosOtros;
  }

  final db = BaseDatosDeGastos();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    final datosGastos = db.leerDatosGastos();
    if (db.leerDatosGastos().isNotEmpty) {
      listaGastosOtros = datosGastos['Otros'] ?? [];
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
    db.guardarGasto(listaGastosOtros);
  }
}
