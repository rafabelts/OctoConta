import 'package:flutter/material.dart';

import '../../../../../models/gasto_item.dart';
import '../../../../../services/base_datos_gastos.dart';

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
    if (db.leerDatosGastos().isNotEmpty) {
      listaGastosOtros = db.leerDatosGastos();
    }
  }

  // agregar nuevo gasto
  void agregarNuevoGastoOtros(GastoItem nuevoGasto) {
    listaGastosOtros.add(nuevoGasto);
    notifyListeners();
    db.guardarGasto(listaGastosOtros);
  }

  double obtenerTotalGastosOtros() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosOtros) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }
}
