import 'package:flutter/material.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';
import 'package:octoconta_final/src/services/base_datos_gastos.dart';

class InformacionGastosSuscripciones extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosSuscripciones = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosSuscripciones() {
    return listaGastosSuscripciones;
  }

  final db = BaseDatosDeGastos();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    final datosGastos = db.leerDatosGastos();
    if (db.leerDatosGastos().isNotEmpty) {
      listaGastosSuscripciones = datosGastos['Suscripciones'] ?? [];
    }
  }

  // agregar nuevo gasto
  void agregarNuevoGastoSuscripciones(GastoItem nuevoGasto) {
    listaGastosSuscripciones.add(nuevoGasto);
    notifyListeners();
    db.guardarGasto(listaGastosSuscripciones);
  }

  double obtenerTotalGastosSuscripciones() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosSuscripciones) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }
}
