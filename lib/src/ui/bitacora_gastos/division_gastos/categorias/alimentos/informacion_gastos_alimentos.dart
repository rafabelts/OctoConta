import 'package:flutter/material.dart';

class InformacionGastosAlimentos extends ChangeNotifier {
  // Lista de los gastos
  List listaGastosAlimentos = [];

  // Se obtiene la lista cuando se llama
  List obtenerListaGastosAlimentos() {
    return listaGastosAlimentos;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoAlimentos(nuevoGasto) {
    listaGastosAlimentos.add(nuevoGasto);
    notifyListeners();
  }
}
