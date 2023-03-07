import 'package:flutter/material.dart';
import 'package:octoconta_final/src/services/base_datos_gastos.dart';

import '../../../../../models/gasto_item.dart';

class InformacionGastosSaludHigiene extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosSalud = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosSalud() {
    return listaGastosSalud;
  }

  final db = BaseDatosDeGastos();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    if (db.leerDatosGastos().isNotEmpty) {
      listaGastosSalud = db.leerDatosGastos();
    }
  }

  // agregar nuevo gasto
  void agregarNuevoGastoSalud(GastoItem nuevoGasto) {
    listaGastosSalud.add(nuevoGasto);
    notifyListeners();
    db.guardarGasto(listaGastosSalud);
  }

  double obtenerTotalGastoSalud() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosSalud) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }
}
