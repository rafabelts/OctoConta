import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';

class InformacionGastosSuscripciones extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosSuscripciones = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosSuscripciones() {
    return listaGastosSuscripciones;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoSuscripciones(GastoItem nuevoGasto) {
    listaGastosSuscripciones.add(nuevoGasto);
  }

  double obtenerTotalGastosSuscripciones() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosSuscripciones) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }
}
