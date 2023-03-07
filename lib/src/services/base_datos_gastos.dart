import 'package:hive_flutter/hive_flutter.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';
import 'package:octoconta_final/src/models/ingreso_item.dart';

class BaseDatosDeGastos {
  // Referencia la box
  final _mybox = Hive.box("base_datos_gastos");

  // escribir datos gasto
  void guardarGasto(List<GastoItem> gastos) {
    List<List<dynamic>> gastosFormateados = [];

    for (var gasto in gastos) {
      List<dynamic> gastoFormateado = [
        gasto.cantidad,
        gasto.articulo,
        gasto.precio
      ]; // Vamos sacando los datos del gasto item para poder almacenarlos en la data base
      gastosFormateados.add(gastoFormateado);
    }

    // Guardar en la base de datos
    _mybox.put('Gastos_totales', gastosFormateados);
  }

  void guardarIngresos(List<IngresoItem> ingresos) {
    List<List<dynamic>> ingresosFormateados = [];

    for (var ingreso in ingresos) {
      List<dynamic> ingresoFormateado = [
        ingreso.ingreso,
        ingreso.monto,
      ];
      ingresosFormateados.add(ingresoFormateado);
    }

    // Guardar en la base de datos
    _mybox.put('Ingresos_totales', ingresosFormateados);
  }

  void guardarTotalGasto(double obtenerTotalGastos) {
    double totalGasto = obtenerTotalGastos;
    _mybox.put('Ingresos_totales', totalGasto);
  }

  double leerTotalGastos() {
    return _mybox.get('Gastos_totales', defaultValue: 0.0);
  }

  // leer datos
  List<GastoItem> leerDatosGastos() {
    List gastosGuardados = _mybox.get('Gastos_totales') ?? [];
    List<GastoItem> gastosTotal = [];

    for (int i = 0; i < gastosGuardados.length; i++) {
      int cantidad = gastosGuardados[i][0];
      String articulo = gastosGuardados[i][1];
      double precio = gastosGuardados[i][2];

      GastoItem gasto =
          GastoItem(cantidad: cantidad, articulo: articulo, precio: precio);

      // Anadir gasto a la lista total de los gastos
      gastosTotal.add(gasto);
    }
    return gastosTotal;
  }

  List<IngresoItem> leerDatosIngresos() {
    List ingresosGuardados = _mybox.get('Ingresos_totales') ?? [];
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
}
