import 'package:hive_flutter/hive_flutter.dart';
import 'package:octoconta_final/src/models/gasto_item.dart';

class BaseDatosDeGastosAlimentos {
  // Referencia la box
  final _mybox = Hive.box("base_datos_alimentos");

  // escribir datos gasto
  void guardarGastosAlimentos(List<GastoItem> gastos) {
    List<List<dynamic>> gastosFormateados = [];

    for (var gasto in gastos) {
      List<dynamic> gastoFormateado = [
        gasto.cantidad,
        gasto.articulo,
        gasto.precio
      ];
      gastosFormateados.add(gastoFormateado);
    }

    // Guardar en la base de datos
    _mybox.put('Gastos_items', gastosFormateados);
  }

  // Guardar valor total de ingresos
  void totalDeGastosAlimentos(double obtenerTotal) {
    double totalGastos = obtenerTotal;
    _mybox.put("Gastos_total", totalGastos);
  }

  // Leer total ingresps
  double leerTotalGastos() {
    return _mybox.get("Gastos_total", defaultValue: 0.0);
  }

  // Leer datos de ingresos
  List<GastoItem> leerDatosGastos() {
    List gastosGuardado = _mybox.get('Gastos_items') ?? [];
    List<GastoItem> gastoTotal = [];

    for (int i = 0; i < gastosGuardado.length; i++) {
      int cantidad = gastosGuardado[i][0];
      String articulo = gastosGuardado[i][1];
      double precio = gastosGuardado[i][2];

      GastoItem ingresoUser =
          GastoItem(cantidad: cantidad, articulo: articulo, precio: precio);

      // Anadir gasto a la lista total de ingresos
      gastoTotal.add(ingresoUser);
    }
    return gastoTotal;
  }
}
