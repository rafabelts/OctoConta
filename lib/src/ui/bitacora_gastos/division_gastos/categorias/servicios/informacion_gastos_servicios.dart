import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';
import 'package:octoconta_final/src/services/base_datos_gastos_servicios.dart';

class InformacionGastosServicios extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosServicios = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosServicios() {
    return listaGastosServicios;
  }

  final db = BaseDatosDeGastosServicios();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    final datosGastos = db.leerDatosGastosServicios();
    if (datosGastos.isNotEmpty) {
      listaGastosServicios = datosGastos;
    }
  }

  double obtenerTotalGastosServicios() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosServicios) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoServicios(GastoItem nuevoGasto) {
    listaGastosServicios.add(nuevoGasto);
    notifyListeners();
    db.guardarGastosServicios(listaGastosServicios);
    db.totalDeGastosServicios(obtenerTotalGastosServicios());
  }

  double prepararTotalGastos() {
    return db.leerTotalServicios();
  }
}
