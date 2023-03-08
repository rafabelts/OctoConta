import 'package:flutter/material.dart';
import 'package:octoconta_final/src/services/base_datos_gastos_salud.dart';

import '../../../../../models/gasto_item.dart';

class InformacionGastosSaludHigiene extends ChangeNotifier {
  // Lista de los gastos
  List<GastoItem> listaGastosSalud = [];

  // Se obtiene la lista cuando se llama
  List<GastoItem> obtenerListaGastosSalud() {
    return listaGastosSalud;
  }

  final db = BaseDatosDeGastosSalud();

  // prepara datos para la base de datos
  void prepararDatos() {
    // Si existe un dato, obtenerlo
    final datosGastos = db.leerDatosSalud();
    if (datosGastos.isNotEmpty) {
      listaGastosSalud = datosGastos;
    }
  }

  double obtenerTotalGastoSalud() {
    double total = 0.0;
    for (GastoItem gasto in listaGastosSalud) {
      total += gasto.precio;
    }
    return total == 0 ? 0 : total;
  }

  // agregar nuevo gasto
  void agregarNuevoGastoSalud(GastoItem nuevoGasto) {
    listaGastosSalud.add(nuevoGasto);
    notifyListeners();
    // db.guardarGasto(listaGastosSalud);
    db.guardarGastosSalud(listaGastosSalud);
    db.totalDeGastosSalud(obtenerTotalGastoSalud());
  }

  double prepararTotalGastos() {
    return db.leerTotalSalud();
  }
}
