import 'package:hive_flutter/hive_flutter.dart';
import 'package:octoconta_final/src/bitacora_gastos/agregar_ingreso/ingreso_item.dart';

import '../bitacora_gastos/agregar_articulo/articulo_item.dart';

class BaseDatosBitacora {
  // se referencia a la box
  final _myBox = Hive.box('base_datos_bitacora');

  void guardarGastos(List<ArticuloGastoItem> gastos) {
    List<List<dynamic>> gastosFormateados = [];
    for (var gasto in gastos) {
      List<dynamic> gastoFormateado = [
        gasto.cantidad,
        gasto.articulo,
        gasto.precio,
        gasto.categoria,
      ];

      gastosFormateados.add(gastoFormateado);
    }

    // Guardar en la base de datos
    _myBox.put('articulos_gastos', gastosFormateados);
  }

  List<List<ArticuloGastoItem>> leerDatosGastos() {
    List gastosGuardado = _myBox.get('articulos_gastos') ?? [];
    List<ArticuloGastoItem> gastosAlimentosTotal = [];
    List<ArticuloGastoItem> gastosSaludTotal = [];
    List<ArticuloGastoItem> gastosServiciosTotal = [];
    List<ArticuloGastoItem> gastosSuscripcionesTotal = [];
    List<ArticuloGastoItem> gastosOtrosTotal = [];

    for (int i = 0; i < gastosGuardado.length; i++) {
      int cantidad = gastosGuardado[i][0];
      String articulo = gastosGuardado[i][1];
      double precio = gastosGuardado[i][2];
      String categoria = gastosGuardado[i][3];

      ArticuloGastoItem gasto = ArticuloGastoItem(
          cantidad: cantidad,
          articulo: articulo,
          precio: precio,
          categoria: categoria);

      Map<String, List<ArticuloGastoItem>> gastosTotales = {
        'Alimentos': gastosAlimentosTotal,
        'Salud': gastosSaludTotal,
        'Servicios': gastosServiciosTotal,
        'Suscripciones': gastosSuscripcionesTotal,
        'Otros': gastosOtrosTotal,
      };

      gastosTotales[gasto.categoria]!.add(gasto);
    }
    return [
      gastosAlimentosTotal,
      gastosSaludTotal,
      gastosServiciosTotal,
      gastosSuscripcionesTotal,
      gastosOtrosTotal
    ];
  }

  void guardarIngreso(List<IngresoItem> ingresos) {
    List<List<dynamic>> ingresosFormateados = [];
    for (var ingreso in ingresos) {
      List<dynamic> ingresoFormateado = [
        ingreso.ingreso,
        ingreso.monto,
      ];

      ingresosFormateados.add(ingresoFormateado);
    }

    // Guardar en la base de datos
    _myBox.put('ingresos', ingresosFormateados);
  }

  List<IngresoItem> leerDatosIngresos() {
    List ingresosGuardados = _myBox.get('ingresos') ?? [];
    List<IngresoItem> ingresosTotal = [];

    for (int i = 0; i < ingresosGuardados.length; i++) {
      String ingreso = ingresosGuardados[i][0];
      double monto = ingresosGuardados[i][1];

      IngresoItem ingresoUser = IngresoItem(ingreso: ingreso, monto: monto);

      // Anadir gasto a la lista total de ingresos
      ingresosTotal.add(ingresoUser);
    }
    return ingresosTotal;
  }

  void totalGastos(
      double totalAlimentos,
      double totalSalud,
      double totalServicios,
      double totalSuscripciones,
      double totalOtros,
      double obtenerTotal) {
    double totalGastoAlimentos = totalAlimentos;
    double totalGastoSalud = totalSalud;
    double totalGastoServicios = totalServicios;
    double totalGastoSuscripciones = totalSuscripciones;
    double totalGastoOtros = totalOtros;
    double totalGastos = obtenerTotal;

    _myBox.put('Total_Gastos_Alimento', totalGastoAlimentos);
    _myBox.put('Total_Gastos_Salud', totalGastoSalud);
    _myBox.put('Total_Gastos_Servicios', totalGastoServicios);
    _myBox.put('Total_Gasos_Suscripciones', totalGastoSuscripciones);
    _myBox.put('Total_Gasos_Otros', totalGastoOtros);
    _myBox.put('Total_Gastos', totalGastos);
  }

  List<dynamic> leerTotalGastos() {
    return [
      _myBox.get('Total_Gastos', defaultValue: 0.0),
      _myBox.get('Total_Gastos_Alimento', defaultValue: 0.0),
      _myBox.get('Total_Gastos_Salud', defaultValue: 0.0),
      _myBox.get('Total_Gastos_Servicios', defaultValue: 0.0),
      _myBox.get('Total_Gasos_Suscripciones', defaultValue: 0.0),
      _myBox.get('Total_Gasos_Otros', defaultValue: 0.0),
    ];
  }

  void totalIngresos(double obtenerTotal) {
    double totalIngresos = obtenerTotal;
    _myBox.put('Total_Ingresos', totalIngresos);
  }

  double leerTotalIngresos() {
    return _myBox.get('Total_Ingresos', defaultValue: 0.0);
  }

  void guardarSaldo(double saldo) {
    _myBox.put('saldo', saldo);
  }

  double leerSaldo() {
    return _myBox.get('saldo', defaultValue: 0.0);
  }
}
