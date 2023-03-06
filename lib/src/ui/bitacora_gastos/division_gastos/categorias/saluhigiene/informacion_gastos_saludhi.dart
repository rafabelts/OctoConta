import 'package:flutter/material.dart';

import '../../../../../models/gasto_item.dart';

class InformacionGastosSaludHigiene extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosSalud = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosSalud() {
    return listaGastosSalud;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoSalud(GastoItem nuevoGasto) {
    listaGastosSalud.add(nuevoGasto);
  }

  double obtenerTotalGastoSalud() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosSalud) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }
}
