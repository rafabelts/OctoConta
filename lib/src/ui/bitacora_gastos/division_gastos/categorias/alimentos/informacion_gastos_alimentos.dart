import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';

class InformacionGastosAlimentos extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosAlimentos = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosAlimentos() {
    return listaGastosAlimentos;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoAlimentos(GastoItem nuevoGasto) {
    listaGastosAlimentos.add(nuevoGasto);
    notifyListeners();
  }
}
