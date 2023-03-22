import 'package:flutter/material.dart';
import 'package:octoconta_final/src/bitacora_gastos/agregar_articulo/agregar_articulo.dart';

import 'base_datos_bitacora.dart';
import '../bitacora_gastos/agregar_articulo/articulo_item.dart';
import '../bitacora_gastos/agregar_ingreso/ingreso_item.dart';

class InformacionBitacora extends ChangeNotifier {
  final db = BaseDatosBitacora();

  List<ArticuloGastoItem> listaGastosAlimentos = [];
  List<ArticuloGastoItem> obtenerListaAlimentos() {
    return listaGastosAlimentos;
  }

  double obtenerTotalGastosAlimentos() {
    double total = 0.0;
    for (ArticuloGastoItem gasto in listaGastosAlimentos) {
      total += gasto.precio;
    }
    return total;
  }

  List<ArticuloGastoItem> listaGastosSalud = [];
  List<ArticuloGastoItem> obtenerListaSalud() {
    return listaGastosSalud;
  }

  double obtenerTotalGastosSalud() {
    double total = 0.0;
    for (ArticuloGastoItem gasto in listaGastosSalud) {
      total += gasto.precio;
    }
    return total;
  }

  List<ArticuloGastoItem> listaGastosServicios = [];
  List<ArticuloGastoItem> obtenerListaServicios() {
    return listaGastosServicios;
  }

  double obtenerTotalGastosServicios() {
    double total = 0.0;
    for (ArticuloGastoItem gasto in listaGastosServicios) {
      total += gasto.precio;
    }
    return total;
  }

  List<ArticuloGastoItem> listaGastosSuscripciones = [];
  List<ArticuloGastoItem> obtenerListaSuscripciones() {
    return listaGastosSuscripciones;
  }

  double obtenerTotalGastosSuscripciones() {
    double total = 0.0;
    for (ArticuloGastoItem gasto in listaGastosSuscripciones) {
      total += gasto.precio;
    }
    return total;
  }

  List<ArticuloGastoItem> listaGastosOtros = [];
  List<ArticuloGastoItem> obtenerListaOtros() {
    return listaGastosOtros;
  }

  double obtenerTotalGastosOtros() {
    double total = 0.0;
    for (ArticuloGastoItem gasto in listaGastosOtros) {
      total += gasto.precio;
    }
    return total;
  }

  List<IngresoItem> listaIngresos = [];
  List<IngresoItem> obtenerListaIngresos() {
    return listaIngresos;
  }

  double obtenerTotalGastosIngresos() {
    double total = 0.0;
    for (IngresoItem ingreso in listaIngresos) {
      total += ingreso.monto;
    }
    return total;
  }

  void prepararDatosGastos() {
    final leerDatosAlimentos = db.leerDatosGastos()[0];
    final leerDatosSalud = db.leerDatosGastos()[1];
    final leerDatosServicios = db.leerDatosGastos()[2];
    final leerDatosSuscripciones = db.leerDatosGastos()[3];
    final leerDatosOtros = db.leerDatosGastos()[4];
    if (leerDatosAlimentos.isNotEmpty) {
      listaGastosAlimentos = leerDatosAlimentos;
    }
    if (leerDatosSalud.isNotEmpty) {
      listaGastosSalud = leerDatosSalud;
    }
    if (leerDatosServicios.isNotEmpty) {
      listaGastosServicios = leerDatosServicios;
    }
    if (leerDatosSuscripciones.isNotEmpty) {
      listaGastosSuscripciones = leerDatosSuscripciones;
    }
    if (leerDatosOtros.isNotEmpty) {
      listaGastosOtros = leerDatosOtros;
    }
  }

  double obtenerTotalGastos() {
    double total = 0.0;

    total = (obtenerTotalGastosAlimentos() +
        obtenerTotalGastosSalud() +
        obtenerTotalGastosServicios() +
        obtenerTotalGastosSuscripciones() +
        obtenerTotalGastosOtros());
    return total;
  }

  List<ArticuloGastoItem> todosLosGastos = [];

  void agregarGasto(String nombreLista, ArticuloGastoItem nuevoGasto) {
    Map<String, List<ArticuloGastoItem>> listasDeGastos = {
      'Alimentos': listaGastosAlimentos,
      'Salud': listaGastosSalud,
      'Servicios': listaGastosServicios,
      'Suscripciones': listaGastosSuscripciones,
      'Otros': listaGastosOtros,
    };
    listasDeGastos[nombreLista]!.add(nuevoGasto);

    todosLosGastos.addAll(listaGastosAlimentos);
    todosLosGastos.addAll(listaGastosSalud);
    todosLosGastos.addAll(listaGastosServicios);
    todosLosGastos.addAll(listaGastosSuscripciones);
    todosLosGastos.addAll(listaGastosOtros);
    notifyListeners();
    db.guardarGastos(todosLosGastos);
    db.totalGastos(
      obtenerTotalGastosAlimentos(),
      obtenerTotalGastosSalud(),
      obtenerTotalGastosServicios(),
      obtenerTotalGastosSuscripciones(),
      obtenerTotalGastosOtros(),
      obtenerTotalGastos(),
    );
  }

  List<dynamic> prepararTotalGastos() {
    return db.leerTotalGastos();
  }

  void prepararDatosIngresos() {
    final leerDatosIngresos = db.leerDatosIngresos();
    if (leerDatosIngresos.isNotEmpty) {
      listaIngresos = leerDatosIngresos;
    }
  }

  void agregarNuevoIngreso(IngresoItem ingreso) {
    listaIngresos.add(ingreso);
    notifyListeners();
    db.guardarIngreso(listaIngresos);
    db.totalIngresos(obtenerTotalGastosIngresos());
  }

  double prepararTotalIngresos() {
    return db.leerTotalIngresos();
  }

  double _saldoUsuario = 0.0;
  double get saldoUsuario => _saldoUsuario;

  void agregarSaldo(double saldo) {
    _saldoUsuario = saldo;
    notifyListeners();
    db.guardarSaldo(saldo);
  }

  double prepararSaldo() {
    return db.leerSaldo();
  }
}
