import 'package:flutter/material.dart';

import '../../../../../models/gasto_item.dart';

class InformacionGastosOtros extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosOtros = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosOtros() {
    return listaGastosOtros;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoOtros(GastoItem nuevoGasto) {
    listaGastosOtros.add(nuevoGasto);
  }

  double obtenerTotalGastosOtros() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosOtros) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }
}
