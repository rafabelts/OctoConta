import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';

class InformacionGastosServicios extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosServicios = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosServicios() {
    return listaGastosServicios;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoServicios(GastoItem nuevoGasto) {
    listaGastosServicios.add(nuevoGasto);
  }

  double obtenerTotalGastosServicios() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosServicios) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }
}
