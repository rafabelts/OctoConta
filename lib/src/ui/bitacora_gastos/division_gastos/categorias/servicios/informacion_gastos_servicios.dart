import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';

import '../../../../../services/base_datos_gastos.dart';

class InformacionGastosServicios extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosServicios = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosServicios() {
    return listaGastosServicios;
  }

  final db = BaseDatosDeGastos();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    final datosGastos = db.leerDatosGastos();
    if (db.leerDatosGastos().isNotEmpty) {
      listaGastosServicios = datosGastos['Servicios'] ?? [];
    }
  }

  // agregar nuevo gasto
  void agregarNuevoGastoServicios(GastoItem nuevoGasto) {
    listaGastosServicios.add(nuevoGasto);
    notifyListeners();
    db.guardarGasto(listaGastosServicios);
  }

  double obtenerTotalGastosServicios() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosServicios) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }
}
